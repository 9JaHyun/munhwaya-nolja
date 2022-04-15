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
	public List<ArtistVO> findAll() {
		// TODO Auto-generated method stub
		return map.selectArtistList();
	}

	@Override
	public ArtistVO findByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return map.selectArtistByMemberId(memberId);
	}

	@Override
	public int save(ArtistVO vo) {
		// TODO Auto-generated method stub
		return map.insertArtist(vo);
	}

	@Override
	public int update(ArtistVO vo) {
		// TODO Auto-generated method stub
		return map.updateArtist(vo);
	}

	@Override
	public int chkNick(String name) {
		// TODO Auto-generated method stub
		return map.chkName(name);
	}
	
}
