package com.munhwa.prj.member.mapper;

import com.munhwa.prj.member.vo.MemberVO;

public interface MemberMapper {
	
	// 회원가입
	int memberSignup(MemberVO vo);
	
	// 아이디 중복체크
	int idChk(String id);
	
	// 닉네임 중복체크
	int nickChk(String nickname);
	
	// 마일리지 충전 22/04/04 류기태
	int plusMileage(MemberVO vo);
		
	// 마일리지 사용 22/04/04 류기태
	int minusMileage(MemberVO vo);

}
