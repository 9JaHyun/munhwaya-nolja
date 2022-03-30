package com.munhwa.prj.ticketList.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.munhwa.prj.ticketList.service.TicketListService;
import com.munhwa.prj.ticketList.vo.TicketListVO;

@Controller
public class TicketListController {
	@Autowired
	private TicketListService ticketListDao;
	
	//마이페이지 링크
	@RequestMapping("/ticketList.do")
	public String ticketList(Model model) {
		List <TicketListVO> list = ticketListDao.ticketListSelectList();
		model.addAttribute("ticketLists", list);
		return "ticketList/ticketList";
	}
	
	@RequestMapping("/ticketListSelect.do")
	public String ticketListSelect(HttpServletRequest req, Model model, TicketListVO vo) {
		String memberId = (String) req.getSession().getAttribute("member");
		vo = ticketListDao.ticketListSelect(vo);
		System.out.println(vo);
		model.addAttribute("memberId", memberId);
		model.addAttribute("ticket", vo);
		return "ticketList/ticketListSelect";
	}
	
//	@RequestMapping("/ticketListInsert.do")
//	public String ticketListInsert(HttpServletRequest req, HttpSession session,int id) throws WriterException, IOException {
//		TicketListVO vo = new TicketListVO();
////		vo.setMemberId(session.getAttribute("member"));
//		vo.setMemberId("test0@gmail.com");
//		vo.setPerformanceId(id);
//		int n = ticketListDao.ticketListInsert(vo);
//		vo.setQrcode(makeQR(req, ));
//		ticketListDao.update(vo);
//		
//		return "redirect:performance"; //메인화면경로 넣어줘야함
//	}
//
//	// QR코드 생성
//	private String makeQR(HttpServletRequest req) throws WriterException, IOException {
//		String qrURI = null;
//		String path = req.getSession().getServletContext().getRealPath("resources");
//	    try (DatagramSocket r = new DatagramSocket()){
//	    	r.connect(InetAddress.getByName("8.8.8.8"),10002);
//	    	String t = req.getRequestURI();
//	    	qrURI = r.getLocalAddress().getHostAddress()+t + "/" + ticket_id;
//	    } catch (UnknownHostException e) {
//			e.printStackTrace();
//		} catch (SocketException e1) {
//			e1.printStackTrace();
//		}
//	    
//	    return makeQRDetail(path, qrURI, "test");
//	}
//	
//	public String makeQRDetail(String path, String qrURI, String fn) throws WriterException, IOException { 
//		
//		String savePath = "C:\\Users\\admin\\Documents\\MyModels" + "\\qrCodes\\"; // 파일 경로
//		System.out.println(savePath);
//
//		//파일 경로가 없으면 생성하기
//		File file = new File(savePath); 
//		if(!file.exists()) { 
//	   	 	file.mkdirs(); 
//		}  
//	    
//		
//	    // 링크로 할 URL주소 
//	    String url = qrURI; 
//	    
//	     // 링크 생성값
//	    String codeurl = new String(url.getBytes("UTF-8"), "ISO-8859-1"); 
//	   
//	    // QRCode 색상값
//	    int qrcodeColor =   0xFF2e4e96; 
//	    // QRCode 배경색상값  
//	    int backgroundColor = 0xFFFFFFFF; 
//	         
//	    //QRCode 생성
//	    QRCodeWriter qrCodeWriter = new QRCodeWriter();  
//	    BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE,200, 200);    // 200,200은 width, height
//	  
//	    MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor,backgroundColor); 
//	    BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig); 
//	    
//
//	    String fileName= fn;
//	    
//	    //파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
//	    File temp =  new File(savePath+fileName+".png");  
//	    
//	    // ImageIO를 사용하여 파일쓰기 
//	    ImageIO.write(bufferedImage, "png",temp); 
//		
//	    //리턴은 사용자가 원하는 값을 리턴한다. 
//	    //작성자는 QRCode 파일의 이름을 넘겨주고 싶었음.
//		return fileName+".png"; 
//	}
//	
//	@RequestMapping("qr링크/{ticketId}")
//	public String qrLink(@PathVariable int ticketId) {
//		model.addAttribute("ticket", ticketDao.select(ticketId));
//		return "QR코드";
//	}
}
