package com.munhwa.prj.ticketList.web;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.PerformanceVO;
import com.munhwa.prj.ticketList.service.TicketListService;
import com.munhwa.prj.ticketList.vo.TicketListVO;
import com.munhwa.prj.wallet.service.ProfitService;
import com.munhwa.prj.wallet.service.UsageService;
import com.munhwa.prj.wallet.vo.UsageVO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class TicketListController {

	@Autowired
	private TicketListService ticketListDao;

	@Autowired
	private UsageService usageDao;

	@Autowired
	private MemberService memberDao;

	@Autowired
	private ProfitService profitDao;
	
	@Autowired
	private PerformanceService performanceDao;

	// 마이페이지 링크(회원 구매 목록)
	@RequestMapping("/ticketList.do")
	public String ticketList(Model model, @LoginUser SessionUser user) {
		String memberId = user.getId();
		List<TicketListVO> list = ticketListDao.ticketListSelectList(memberId);
		model.addAttribute("ticketLists", list);
		return "ticketList/ticketList";
	}

	@RequestMapping("/ticketListSelect.do")
	public String ticketListSelect(@LoginUser SessionUser user, Model model, TicketListVO vo) {
		String nickname = user.getNickname();
		vo = ticketListDao.ticketListSelect(vo);
		model.addAttribute("nickname", nickname);
		model.addAttribute("ticket", vo);
		return "ticketList/ticketListSelect";
	}
	
	@Transactional
	@RequestMapping("/ticketListInsert.do")
	public String ticketListInsert(@LoginUser SessionUser user, int id, int person, HttpServletRequest req,
			HttpServletResponse response) throws WriterException, IOException {
		String memberId = user.getId();
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("v_member_id", memberId);
		paramMap.put("v_performance_id", id);
		paramMap.put("v_person", person);

		int ticketId = ticketListDao.ticketListInsert(paramMap);
		log.info("ticketId={}", ticketId);
		String qr = makeQR(req, ticketId);

		TicketListVO vo = new TicketListVO();
		vo.setId(ticketId);
		vo.setQrcode(qr);
		PerformanceVO performance = new PerformanceVO();
		performance.setId(id);
		performance = performanceDao.performanceSelect(performance);
		
		vo.setPerformancevo(performance);
		ticketListDao.qrcodeUpdate(vo);


		Date useDate = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());

		List<UsageVO> resultUsageList = new ArrayList<>();
		Map<String, Object> param = new HashMap<String, Object>();

		UsageVO usageVO = new UsageVO();
		usageVO.setMileage(vo.getPerformancevo().getPrice() * person);
		usageVO.setUseAt(useDate);
		usageVO.setPlace("U02");
		usageVO.setMemberId(memberId);
		usageVO.setPks(vo.getId());
		usageVO.setName(vo.getPerformancevo().getName());

		resultUsageList.add(usageVO);

		param.put("v_member_id", memberId);
		param.put("v_mileage", vo.getPerformancevo().getPrice() * person);
		param.put("v_ticket_list_id", vo.getId());
		param.put("v_profit_at", useDate);
		param.put("v_artist_id", vo.getPerformancevo().getArtistId());
		param.put("v_name", vo.getPerformancevo().getName());
		
		// 사용 내역 남기기
		usageDao.insertUsage(resultUsageList);

//		// 공연 구매한 회원 마일리지 차감, 아티스트 수익 추가 프로시저
		memberDao.updateMileagePerformance(param);

		user.setMileage(user.getMileage() - vo.getPerformancevo().getPrice() * person);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.println("<script language='javascript'>");
		out.println("alert('예매가 완료되었습니다.');");
		out.println("</script>");
		out.flush();

		return "home/home"; // 메인화면경로 넣어줘야함
	}

	// QR코드 생성
	private String makeQR(HttpServletRequest req, int ticketId) throws WriterException, IOException {
		String qrURI = null;
		String path = req.getSession().getServletContext().getRealPath("resources");
		try (DatagramSocket r = new DatagramSocket()) {
			r.connect(InetAddress.getByName("8.8.8.8"), 10002);
			String t = req.getRequestURI();
			qrURI = r.getLocalAddress().getHostAddress() + "/prj/ticketCheck/" + ticketId;
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (SocketException e1) {
			e1.printStackTrace();
		}
		String id = UUID.randomUUID().toString();

		return makeQRDetail(path, qrURI, id);
	}

	public String makeQRDetail(String path, String qrURI, String fileName) throws WriterException, IOException {

		String savePath = "C:\\DEV\\filetest" + "\\qrCodes\\"; // 파일 경로

		// 파일 경로가 없으면 생성하기
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdirs();
		}

		// 링크로 할 URL주소
		String url = qrURI;

		// 링크 생성값
		String codeurl = new String(url.getBytes("UTF-8"), "ISO-8859-1");

		// QRCode 색상값
		int qrcodeColor = 0xFF2e4e96;
		// QRCode 배경색상값
		int backgroundColor = 0xFFFFFFFF;

		// QRCode 생성
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE, 200, 200); // 200,200은 width, height

		MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor, backgroundColor);
		BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);

		// 파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
		File temp = new File(savePath + fileName + ".png");

		// ImageIO를 사용하여 파일쓰기
		ImageIO.write(bufferedImage, "png", temp);

		// 리턴은 사용자가 원하는 값을 리턴한다.
		// 작성자는 QRCode 파일의 이름을 넘겨주고 싶었음.
		return fileName + ".png";
	}

	@PreAuthorize("hasRole('ROLE_R03')")
	@RequestMapping("ticketCheck/{ticketId}")
	public String qrLink(@PathVariable int ticketId, Model model) {
		TicketListVO vo = new TicketListVO();
		vo.setId(ticketId);
		vo = ticketListDao.ticketListSelect(vo);
		model.addAttribute("ticket", vo);
		Date now = new Date();
		Date edate = vo.getPerformancevo().getEdate();
		if (now.after(edate)) {
			return "qrcode/qrcodeError";
		} else {
			Map<String, Object> paramMapt = new HashMap<>();
			paramMapt.put("v_tic_id", ticketId);
			paramMapt.put("v_pro_pks", ticketId);
			paramMapt.put("v_tic_attendance", vo.getAttendance());
			paramMapt.put("v_pro_buyer", vo.getMemberId());
			ticketListDao.qrcodeAttendance(paramMapt);
			return "qrcodeDetail-qrcode";
		}
	}
}