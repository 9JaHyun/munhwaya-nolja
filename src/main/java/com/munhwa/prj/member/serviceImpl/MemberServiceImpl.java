package com.munhwa.prj.member.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;

@Service("memberDao")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper map;

	@Override
	public int memberSignup(MemberVO vo) {
		return map.memberSignup(vo);
	}

	@Override
	public int idChk(String id) {
		return map.idChk(id);
	}

	@Override
	public int nickChk(String nickname) {
		return map.nickChk(nickname);
	}

	@Override
	public MemberVO mypageInfo(MemberVO vo) {
		return map.mypageInfo(vo);
	}

	@Override
	public int updateInfo(MemberVO vo) {
		return map.updateInfo(vo);
	}


}
