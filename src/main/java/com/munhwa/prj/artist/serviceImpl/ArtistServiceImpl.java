package com.munhwa.prj.artist.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.artist.mapper.ArtistMapper;
import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.vo.ArtistVO;

@Repository("artistDao")
public class ArtistServiceImpl implements ArtistService {

@Autowired
private ArtistMapper map;
	
	@Override
	public List<ArtistVO> artistSelectList() {
		// TODO Auto-generated method stub
		return map.artistSelectList();
	}

	@Override
	public ArtistVO artistSelect(ArtistVO vo) {
		// TODO Auto-generated method stub
		return map.artistSelect(vo);
	}

	@Override
	public int artistInsert(ArtistVO vo) {
		// TODO Auto-generated method stub
		return map.artistInsert(vo);
	}

	@Override
	public int artistUpdate(ArtistVO vo) {
		// TODO Auto-generated method stub
		return map.artistUpdate(vo);
	}

	@Override
	public ArtistVO artistContent(ArtistVO vo) {
		return map.artistContent(vo);
	}
	
}
