package com.munhwa.prj.wallet.web;

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
import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.common.vo.PageDTO;
import com.munhwa.prj.wallet.service.UsageService;
import com.munhwa.prj.wallet.vo.UsageVO;

@Controller
public class WalletController {
	@Autowired
	private UsageService usageDao;
	
	@Autowired
	private ChargeService chargeDao;
	
	
//	SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


	@PostMapping("/payCart")
	@ResponseBody
	public void payCart(UsageVO vo) {
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
	
	// 마일리지 충전 페이지
	@GetMapping("/withdrawForm.do")
	public String withdrawForm() {
		return "withdrawForm-memberWallet";
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
