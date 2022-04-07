package com.munhwa.prj.charge.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;

@Controller
public class ChargeController {
	@Autowired
	ChargeService chargeDao;
	
	@Autowired
	MemberService memberDao;
		
	
	@PostMapping("/charge")
	@ResponseBody
	public MemberVO plusMileage(@LoginUser SessionUser user ,MemberVO vo, ChargeVO cvo, Model model) {
		String memberId = user.getId();
		model.addAttribute("memberId", memberId);
		vo.setId(memberId);
		memberDao.plusMileage(vo);
		System.out.println(vo);
			insertCharge(cvo);
		user.setMileage(user.getMileage() + cvo.getMileage());
		return vo;
	}
	
	public ChargeVO insertCharge(ChargeVO vo) {
		chargeDao.insertCharge(vo);
		return vo;
	}
	
}	
