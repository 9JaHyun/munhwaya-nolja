package com.munhwa.prj.artist.serviceImpl;

import com.munhwa.prj.artist.mapper.ArtistMapper;
import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.vo.ArtDetailVO;
import com.munhwa.prj.artist.vo.ArtDetailVO2;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.common.paging.entity.Criteria;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArtistServiceImpl implements ArtistService {

    @Autowired
    private ArtistMapper map;

    @Override
    public int getTotal(Criteria cri, int id) {
        return map.getTotal(cri, id);
    }

    @Override
    public List<ArtistVO> selectArtistList() {
        return map.selectArtistList();
    }

    @Override
    public int insertArtist(ArtistVO vo) {
        return map.insertArtist(vo);
    }

    @Override
    public int updateArtist(ArtistVO vo) {
        return map.updateArtist(vo);
    }

    @Override
    public List<ArtDetailVO> findMusic(Criteria cri, int id) {
        return map.findMusic(cri, id);
    }

    @Override
    public int checkBuy(String id, int musicId) {
        return map.checkBuy(id, musicId);
    }

    @Override
    public int musicCnt(int vo) {
        return map.musicCnt(vo);
    }

    @Override
    public int albumCnt(int vo) {
        return map.albumCnt(vo);
    }

    @Override
    public List<ArtDetailVO2> albumInfo(Criteria cri, int artistId) {
        return map.albumInfo(cri, artistId);
    }

    @Override
    public int getTotal2(Criteria cri, int artistId) {
        return map.getTotal2(cri, artistId);
    }

    @Override
    public ArtistVO findByArtistId(int artId) {
        return map.findByArtistId(artId);
    }

    @Override
    public ArtistVO findByMemberId(String id) {
        return map.findByMemberId(id);
    }

    @Override
    public String getStatus(String memberId) {
        return map.getStatus(memberId);
    }

    @Override
    public int artIdByAlbId(int albumId) {
        return map.artIdByAlbId(albumId);
    }
}