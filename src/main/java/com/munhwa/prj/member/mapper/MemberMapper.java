package com.munhwa.prj.member.mapper;

import com.munhwa.prj.member.vo.MemberVO;

public interface MemberMapper {
	
	// 회원가입
	int memberSignup(MemberVO vo);
	
	// 아이디 중복체크
	int idChk(String id);
	
	// 닉네임 중복체크
	int nickChk(String nickname);

}
