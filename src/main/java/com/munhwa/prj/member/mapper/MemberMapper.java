package com.munhwa.prj.member.mapper;


import com.munhwa.prj.member.vo.MemberVO;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

public interface MemberMapper {

    // 회원가입
    int insertMember(MemberVO memberVO);

    int insertMemberByProc(Map<String, String> map);

    // 아이디 중복체크
    int chkId(String id);

    // 닉네임 중복체크
    int chkNick(String nickname);

    // 프로필 업데이트
    int updateProfile(MemberVO vo);

    // 마일리지 충전 22/04/04 류기태
    int plusMileage(MemberVO vo);

    // 마일리지 사용 22/04/04 류기태
    int minusMileage(MemberVO vo);

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

    // 프로시저 곡 구매 마일리지 22/04/08 류기태
    int updateMileageMusic(Map<String, Object> vo);

    // 프로시저 공연 구매 마일리지 22/04/08 류기태
    int updateMileagePerformance(Map<String, Object> vo);
}
