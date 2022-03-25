package com.munhwa.prj.member.service;

import com.munhwa.prj.member.vo.MemberVO;

public interface MemberService {
	
	// 아이디 중복체크
	public int idChk(MemberVO vo);

}
