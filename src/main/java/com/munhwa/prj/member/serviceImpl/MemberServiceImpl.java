package com.munhwa.prj.member.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper map;

	@Override
	public int memberSignup(MemberVO vo) {
		return map.memberSignup(vo);
	}

	@Override
	public int idChk(String id) {
		int result = map.idChk(id);
		return result;
	}

	@Override
	public int nickChk(String nickname) {
		int result = map.nickChk(nickname);
		return result;
	}


}
