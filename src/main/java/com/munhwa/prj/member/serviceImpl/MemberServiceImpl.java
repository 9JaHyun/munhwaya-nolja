package com.munhwa.prj.member.serviceImpl;

import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	// 아티스트 마일리지 수익 22/04/05 류기태
	@Override
	public int plusMileageOfArtist(MemberVO vo) {
		return map.plusMileageOfArtist(vo);
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
}
