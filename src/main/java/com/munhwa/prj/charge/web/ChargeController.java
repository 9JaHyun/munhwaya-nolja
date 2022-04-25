package com.munhwa.prj.charge.web;



import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;

@Controller
public class ChargeController {
	@Autowired
	ChargeService chargeDao;
	
	@Autowired
	MemberService memberDao;
		
	@Transactional
	@PostMapping("/charge")
	@ResponseBody
	public MemberVO plusMileage(@LoginUser SessionUser user, MemberVO vo, ChargeVO cvo, Model model) {
		String memberId = user.getId();
		Date useDate = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
		model.addAttribute("memberId", memberId);
		vo.setId(memberId);
		memberDao.plusMileage(vo);
		cvo.setChargeAt(useDate);
		chargeDao.insertCharge(cvo);
    
		user.setMileage(user.getMileage() + cvo.getMileage());
		return vo;
	}
		
}	
