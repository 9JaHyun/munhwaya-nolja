package com.munhwa.prj.wallet.web;

import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.common.vo.PageDTO;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;
import com.munhwa.prj.music.service.PurchaseService;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.music.vo.PurchaseVO;
import com.munhwa.prj.wallet.service.ProfitService;
import com.munhwa.prj.wallet.service.UsageService;
import com.munhwa.prj.wallet.vo.ProfitVO;
import com.munhwa.prj.wallet.vo.UsageVO;

@Controller
public class WalletController {
	@Autowired
	private UsageService usageDao;
	
	@Autowired
	private ChargeService chargeDao;
	
	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private ProfitService profitDao;
	
	@Autowired
	private PurchaseService purchaseDao;
	
	
//	SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@PostMapping("/payCart")
	@ResponseBody
	public String payCart(@LoginUser SessionUser user, @RequestBody List<MusicVO> musics) {
		Date useDate = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());

		String memberId = user.getId();
		// musics -> 1. 마일리지 합계 구하기
		//			 2. 곡 ID를 수집 => 구매음원, 사용, 수익 내역에 전달
		
		/** 마일리지
		 * 	1st. 회원에서 차감
		 *  2nd. 아티스트에게 추가
		 */
		int sum = 0;
		List<UsageVO> resultUsageList = new ArrayList<>();
		List<MemberVO> resultListByMember = new ArrayList<>();
		List<PurchaseVO> resultPurchaseList = new ArrayList<>();
		List<ProfitVO> resultProfitByArtist = new ArrayList<>();
		for(MusicVO music : musics) {
			sum += music.getPrice();
			System.out.println("뮤직아이디" + music.getId());
			UsageVO usageVO = new UsageVO();
			usageVO.setMileage(music.getPrice());
			usageVO.setUseAt(useDate);
			usageVO.setPlace("U01");
			usageVO.setMemberId(memberId);
			usageVO.setPks(music.getId());
			
			resultUsageList.add(usageVO);
			
			MemberVO memberVO = new MemberVO();
			memberVO.setId(memberId);
			memberVO.setMileage(music.getPrice());
			
			resultListByMember.add(memberVO);
            
			PurchaseVO purchaseVO = new PurchaseVO();
			purchaseVO.setMusicId(music.getId());
			purchaseVO.setMemberId(memberId);
			
			resultPurchaseList.add(purchaseVO);
			
			ProfitVO profitVO = new ProfitVO();
			profitVO.setProfitAt(useDate);
			profitVO.setMileage(music.getPrice());
			profitVO.setPlace("U01");
			profitVO.setId(music.getId());
			
			
			resultProfitByArtist.add(profitVO);
		}
			usageDao.insertUsage(resultUsageList);
			minusMileage(resultListByMember);
			insertPurchaseMusic(resultPurchaseList);
			insertProfitHistory(resultProfitByArtist);
				
		return "wallet/usageHistory-memberWallet";
	}
	
	// 곡 구매시 회원 마일리지 차감 
	public List<MemberVO> minusMileage(@RequestBody List<MemberVO> vo) {
		memberDao.minusMileage(vo);
		return vo;
	}
	
	// 구매한 음원에 담기
	public List<PurchaseVO> insertPurchaseMusic(@RequestBody List<PurchaseVO> vo) {
		purchaseDao.purchaseInsert(vo);
		return vo;
	}
	
	// 곡 구매시 아티스트 수익 내역에 찍기
	public List<ProfitVO> insertProfitHistory(@RequestBody List<ProfitVO> vo) {
		profitDao.insertProfit(vo);
		return vo;
	}
	
//	@PostMapping("/payCart")
//	@ResponseBody
//	public MemberVO payCart(MemberVO vo, UsageVO uvo,HttpServletRequest req, Model model) {
//		String memberId = (String) req.getSession().getAttribute("id");
//		model.addAttribute("memberId", memberId);
//		vo.setId(memberId);
//		memberDao.minusMileage(vo);
//		insertUsage(uvo);
//		return vo;
//	}
//	
//	public UsageVO insertUsage(UsageVO vo) {
//		usageDao.insertUsage(vo);
//		return vo;
//	}
	
	
	// 마이페이지 지갑 정보 리스트 페이지
	@GetMapping("/walletInfo.do")
	public String walletInfo(Model model, HttpServletRequest req) {
		String memberId = (String) req.getSession().getAttribute("id");
		model.addAttribute("memberId", memberId);
		return "walletInfo-memberWallet";
	}
	
	// 지갑 정보 상세 페이지
	@RequestMapping("/walletInfoSelect.do")
	public String walletInfoSelect(HttpServletRequest req, Model model, Criteria cri) {
		String memberId = (String) req.getSession().getAttribute("id");
//		Criteria cri = new Criteria();
//		String pageNum = req.getParameter("pageNum");
//		if(pageNum == null) { pageNum = "1";}
//		int result = Integer.parseInt(pageNum);
//		cri.setPageNum(result);
		List<ChargeVO> list = chargeDao.findByMemberId(memberId, cri);
//		list.forEach(charge -> System.out.println(tranSimpleFormat.format(charge.getChargeAt())));
		model.addAttribute("charges", list);
		int total = chargeDao.getCountByChargeId(memberId);
	    PageDTO pageMake = new PageDTO(cri, total);
	    model.addAttribute("pageMaker", pageMake);
		return "walletInfoSelect-memberWallet";
	}
	
	// 마일리지 사용 내역 페이지
	@GetMapping("/usageHistory.do")
	public String usageHistory(HttpServletRequest req, Model model, Criteria cri) {
		String memberId = (String) req.getSession().getAttribute("id");
		List<UsageVO> list = usageDao.findByMemberId(memberId, cri);
		model.addAttribute("usages",list);
		int total = usageDao.getCountByUsageId(memberId);
		PageDTO pageMake = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "usageHistory-memberWallet";
	}
	
	// 마일리지 충전 페이지
	@GetMapping("/chargeForm.do")
	public String chargeForm() {
		return "chargeForm-memberWallet";
	}
	
	// 마일리지 출금 페이지
	@GetMapping("/withdrawForm.do")
	public String withdrawForm() {
		return "withdrawForm-memberWallet";
	}
	
	// 아티스트 수익 내역 페이지
	@GetMapping("/profitHistory.do")
	public String profitHistory(HttpServletRequest req, Model model, Criteria cri) {
		String memberId = (String) req.getSession().getAttribute("id");
		List<ProfitVO> list = profitDao.findByMemberId(memberId, cri);
		model.addAttribute("profits", list);
		int total = profitDao.getCountByProfitId(memberId);
		PageDTO pageMake = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "profitHistory-memberWallet";
	}
		
	// 충전 내역 페이지에 보일수량
//	@GetMapping("/changeAmout.do")
//	@ResponseBody 
//	public String changeAmount(@RequestBody AmountChangeRequestDTO dto, Model model) {
//		Criteria cri = new Criteria();
//		cri.setAmount(dto.getAmount());
//		List<ChargeVO> list = chargeDao.findByMemberId(dto.getMemberId(), cri);
//		model.addAttribute("charges", list);
//		return "walletInfoSelect-memberWallet";
//	}
	
	
//	@RequestMapping("/ticketListSelect.do")
//	   public String ticketListSelect(HttpServletRequest req, Model model, TicketListVO vo) {
//	      String memberId = (String) req.getSession().getAttribute("member");
//	      vo = ticketListDao.ticketListSelect(vo);
//	      System.out.println(vo);
//	      model.addAttribute("memberId", memberId);
//	      model.addAttribute("ticket", vo);
//	      return "ticketList/ticketListSelect";
//	   }
	
	
}
