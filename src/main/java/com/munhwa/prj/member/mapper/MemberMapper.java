package com.munhwa.prj.member.mapper;

import com.munhwa.prj.member.vo.MemberVO;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

public interface MemberMapper {

	// 회원가입
	int memberSignup(MemberVO memberVO);
	int memberOAuthSignup(Map<String, String> map);

	// 아이디 중복체크
	int idChk(String id);
	
	// 닉네임 중복체크
	int nickChk(String nickname);

	MemberVO selectByMemberId(@Param("username") String id);
}
