package com.munhwa.prj.charge.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.member.vo.MemberVO;

@Controller
public class ChargeController {
	@Autowired
	ChargeService chargeDao;
		
	@GetMapping("/chargeForm")
	public String chargeForm(MemberVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("id", "test1@gmail.com");
		return "charge/chargeForm";
	}
	
	
	@PostMapping("/charge")
	@ResponseBody
	public void insertCharge(ChargeVO vo, HttpServletRequest req, Model model) {
		String memberId = (String) req.getSession().getAttribute("id");
		model.addAttribute("memberId", memberId);
		//HttpSession session = request.getSession();
		//vo.setMemberId((String) session.getAttribute("id"));
		chargeDao.insertCharge(vo);
	}
	
//	@GetMapping("/chargeSuccess.do")
//	public String chargeSuccess(ChargeVO vo, Model model, HttpServletRequest req) {
//		model.addAttribute("charge", chargeDao.selectCharge(vo));
//		return "chargeSuccess-memberWallet";
//	}
	
	@RequestMapping("/kakaoPay.do")
	public String kakaoPay(){
		
		return"charge/kakao";
	}
//	@GetMapping("/chargeForm")
//	public String chargeForm() {
//		return "charge/chargeForm";
//	}

	// 테스트용 세션 id값 없이 결제 내역 남기기 
//	@PostMapping("/charge")
//	@ResponseBody
//	public void insertCharge(ChargeVO vo) { 
//		//HttpSession session = request.getSession();
//		vo.setType("P01");
//		//vo.setMemberId((String) session.getAttribute("id"));
//		chargeDao.insertCharge(vo);
//	}
	
//	@Transactional
//	@PostMapping("/user/charge/point")
//	@ResponseBody
//	public MemberVO ajaxChargeUpdate(MemberVO vo, ChargeVO cvo) {
//		memberDao.memberUpdate(vo);
//			ChargeInsert(cvo);
//		return vo;
//	}
//	
//	public ChargeVO ChargeInsert(ChargeVO vo) {
//		vo.setChargeType("P01");
//		chargeDao.chargeInsert(vo);
//		return vo;
//	}
}
