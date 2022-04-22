package com.munhwa.prj.artist.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.artist.mapper.ArtistMapper;
import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.vo.ArtDetailVO;
import com.munhwa.prj.artist.vo.ArtDetailVO2;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.common.paging.entity.Criteria;

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

	@Override
	public List<ArtDetailVO> findMusic(Criteria cri, int id) {
		// TODO Auto-generated method stub
		return map.findMusic(cri,id);
	}

	@Override
	public int checkBuy(String id, int musicId) {
		return map.checkBuy(id, musicId);
	}

	@Override
	public int musicCnt(int vo) {
		// TODO Auto-generated method stub
		return map.musicCnt(vo);
	}

	@Override
	public int albumCnt(int vo) {
		// TODO Auto-generated method stub
		return map.albumCnt(vo);
	}

//	@Override
//	public List<ArtDetailVO2> musicListPage(Criteria cri) {
//		// TODO Auto-generated method stub
//		return map.musicListPage(cri);
//	}

	@Override
	public int getTotal(Criteria cri, int id) {
		// TODO Auto-generated method stub
		return map.getTotal(cri,id);
	}

	@Override
	public int artIdByAlbId(int albumId) {
		// TODO Auto-generated method stub
		return map.artIdByAlbId(albumId);
	}
	
	
}
