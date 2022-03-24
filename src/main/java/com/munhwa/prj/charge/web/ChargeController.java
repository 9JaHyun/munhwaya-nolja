package com.munhwa.prj.charge.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;

@Controller
public class ChargeController {
	@Autowired
	ChargeService chargeDao;
	
	@GetMapping("/chargeForm")
	public String chargeForm() {
		return "charge/chargeForm";
	}
	
	// 테스트용 세션 id값 없이 결제 내역 남기기 
	@PostMapping("/charge")
	@ResponseBody
	public String insertCharge(ChargeVO vo) { 
		//HttpSession session = request.getSession();
		vo.setType("P01");
		//vo.setMemberId((String) session.getAttribute("id"));
		chargeDao.insertCharge(vo);
		return "home/home";
	}
	
	
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
