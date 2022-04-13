package com.munhwa.prj.member.mapper;


import com.munhwa.prj.member.vo.MemberVO;

import java.util.List;
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
	
	// 프로필 업데이트
	int updateProfile(MemberVO vo);
	
	// 마일리지 충전 22/04/04 류기태
	int plusMileage(MemberVO vo);
		
	// 마일리지 사용 22/04/04 류기태
	int minusMileage(MemberVO vo);
	
	// 아티스트 마일리지 수익 22/04/05 류기태 
	int plusMileageOfArtist(MemberVO vo);

	// 개인정보 업데이트
	int updateInfo(MemberVO vo);
	
	// 비밀번호 업데이트
	int updatePassword(MemberVO vo);
	
	// 비밀번호 찾기 시 회원 권한 변경
	int updatePassword2(MemberVO vo);
	
	// 회원탈퇴
	int deleteMember(MemberVO vo);

	// 마이페이지 회원정보
	MemberVO selectByMemberId(@Param("username") String id);
	
	// 아이디 찾기 (계정 리스트)
	List<MemberVO> findIdList(MemberVO vo);
}
