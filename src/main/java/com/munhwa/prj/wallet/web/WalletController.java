package com.munhwa.prj.wallet.web;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.wallet.service.UsageService;
import com.munhwa.prj.wallet.vo.UsageVO;

@Controller
public class WalletController {
	@Autowired
	private UsageService usageDao;
	
	@Autowired
	private ChargeService chargeDao;
	
	
	SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


	@PostMapping("/payCart")
	@ResponseBody
	public void payCart(UsageVO vo) {
		System.out.println("1");
		usageDao.insertUsage(vo);
	}
	
	// 마이페이지 지갑 정보 리스트 페이지
	@GetMapping("/walletInfo.do")
	public String walletInfo(Model model, HttpServletRequest req) {
		String memberId = (String) req.getSession().getAttribute("id");
		model.addAttribute("memberId", memberId);
		return "walletInfo-memberWallet";
	}
	
	// 지갑 정보 상세 페이지
	@RequestMapping("/walletInfoSelect.do")
	public String walletInfoSelect(HttpServletRequest req, Model model) {
		String memberId = (String) req.getSession().getAttribute("id");
		List<ChargeVO> list = chargeDao.findByMemberId(memberId);
//		list.forEach(charge -> System.out.println(tranSimpleFormat.format(charge.getChargeAt())));
		model.addAttribute("charges", list);
		return "walletInfoSelect-memberWallet";
	}
	
	
	
//	@RequestMapping("/ticketListSelect.do")
//	   public String ticketListSelect(HttpServletRequest req, Model model, TicketListVO vo) {
//	      String memberId = (String) req.getSession().getAttribute("member");
//	      vo = ticketListDao.ticketListSelect(vo);
//	      System.out.println(vo);
//	      model.addAttribute("memberId", memberId);
//	      model.addAttribute("ticket", vo);
//	      return "ticketList/ticketListSelect";
//	   }
	
	// 마일리지 사용 내역 페이지
	@GetMapping("/usageHistory.do")
	public String usageHistory() {
		return "usageHistory-memberWallet";
	}
	
	// 마일리지 충전 페이지
	@GetMapping("/chargeForm.do")
	public String chargeForm() {
		return "chargeForm-memberWallet";
	}
	
	// 마일리지 충전 페이지
	@GetMapping("/withdrawForm.do")
	public String withdrawForm() {
		return "withdrawForm-memberWallet";
	}
}
