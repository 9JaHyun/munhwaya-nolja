package com.munhwa.prj.member.serviceImpl;

import java.util.List;
import java.util.Map;

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
	public int updateInfo(MemberVO vo) {
		return map.updateInfo(vo);
	}

	@Override
	public int updatePassword(MemberVO vo) {
		return map.updatePassword(vo);
	}

	@Override
	public int deleteMember(MemberVO vo) {
		return map.deleteMember(vo);
	}

	public MemberVO findById(String id) {
		return map.selectByMemberId(id);
	}
	// 마일리지 충전 22/04/04 류기태
	@Override
	public int plusMileage(MemberVO vo) {
		return map.plusMileage(vo);
	}

	// 마일리지 사용 22/04/04 류기태
	@Override
	public int minusMileage(List<MemberVO> vo) {
		int cnt = 0;
		for (MemberVO memberVO : vo) {
			map.minusMileage(memberVO);
		}
		return cnt;
	}

	@Override
	public int updateProfile(MemberVO vo) {
		return map.updateProfile(vo);
	}
	
	// 프로시저 곡 구매 마일리지 22/04/08 류기태 
	@Override
	public int updateMileageMusic(Map<String, Object> vo) {
		return map.updateMileageMusic(vo);
	}
	
	// 프로시저 공연 구매 마일리지 22/04/08 류기태
	@Override
	public int updateMileagePerformance(Map<String, Object> vo) {
		return map.updateMileagePerformance(vo);
	}
}