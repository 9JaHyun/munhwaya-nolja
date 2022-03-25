package com.munhwa.prj.member.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.member.service.MemberMapper;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;


@Repository("memberDao")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper map;

	@Override
	public int idChk(MemberVO vo) {
		return 0;
	}

}
