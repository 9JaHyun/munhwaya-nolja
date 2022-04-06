package com.munhwa.prj.member.serviceImpl;

import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;
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
}
