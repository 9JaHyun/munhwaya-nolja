package com.munhwa.prj.likeArtist.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.likeArtist.mapper.LikeArtistMapper;
import com.munhwa.prj.likeArtist.service.LikeArtistService;
import com.munhwa.prj.likeArtist.vo.LikeArtistVO;

@Repository("likeArtistDao")
public class LikeArtistServiceImpl implements LikeArtistService {
	
	@Autowired
	private LikeArtistMapper map;

	@Override
	public List<LikeArtistVO> likeArtistList(String memberId) {
		return map.likeArtistList(memberId);
	}


	@Override
	public int deleteLikeArtist(LikeArtistVO vo) {
		return map.deleteLikeArtist(vo);
	}

}
