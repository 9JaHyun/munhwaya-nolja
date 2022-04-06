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

	// 개인정보 업데이트
	int updateInfo(MemberVO vo);
	
	// 비밀번호 업데이트
	int updatePassword(MemberVO vo);
	
	// 회원탈퇴
	int deleteMember(MemberVO vo);

	MemberVO selectByMemberId(@Param("username") String id);
}
