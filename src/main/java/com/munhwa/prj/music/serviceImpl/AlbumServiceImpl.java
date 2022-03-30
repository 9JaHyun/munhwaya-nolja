package com.munhwa.prj.music.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.music.mapper.AlbumMapper;
import com.munhwa.prj.music.service.AlbumService;
import com.munhwa.prj.music.vo.AlbumVO;

@Repository("AlbumDAO")
public class AlbumServiceImpl implements AlbumService{
	@Autowired
	private AlbumMapper map;

	@Override
	public List<AlbumVO> albumSelectList() {
		return map.albumSelectList();
	}
	
		
	@Override
	public AlbumVO albumSelect(int id) {
		return map.albumSelect(id);
	}
	
	@Override
		public AlbumVO albumSelectByMusicId(int id) {
			return map.albumSelectByMusicId(id);
	}
	
	@Override
	public int albumInsert(AlbumVO vo) {
		return map.albumInsert(vo);
	}

	@Override
	public int albumUpdate(AlbumVO vo) {
		return map.albumUpdate(vo);
	}

	@Override
	public int albumDelete(AlbumVO vo) {
		return map.albumDelete(vo);
	}

	@Override
	public List<AlbumVO> albumSelectListByRelease() {
		return map.albumSelectListByRelease();
	}


	

	

}
