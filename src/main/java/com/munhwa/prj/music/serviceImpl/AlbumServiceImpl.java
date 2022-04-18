package com.munhwa.prj.music.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.paging.entity.Criteria;
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
	public List<AlbumVO> albumSelectListByWishList(int id) {
		return map.albumSelectListByWishList(id);
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
	public AlbumVO albumSelectByWishList(int id) {
		return map.albumSelectByWishList(id);
	}
	
	@Override
	public List<AlbumVO> albumSelectByTitle(String title, Criteria cri) {
		return map.albumSelectByTitle(title, cri);
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
	public List<AlbumVO> albumSelectListByRelease(Criteria cri) {
		return map.albumSelectListByRelease(cri);
	}

	@Override
	public int getCountByList(int id) {
		return map.getCountByList(id);
	}

	@Override
	public int getCountByList4(String title) {
		return map.getCountByList4(title);
	}


}
