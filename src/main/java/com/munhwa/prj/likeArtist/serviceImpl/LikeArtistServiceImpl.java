package com.munhwa.prj.likeArtist.serviceImpl;

import com.munhwa.prj.likeArtist.mapper.LikeArtistMapper;
import com.munhwa.prj.likeArtist.service.LikeArtistService;
import com.munhwa.prj.likeArtist.vo.LikeArtistVO;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class LikeArtistServiceImpl implements LikeArtistService {

    private final LikeArtistMapper map;

    public LikeArtistServiceImpl(LikeArtistMapper map) {
        this.map = map;
    }

    @Override
    public int follow(LikeArtistVO vo) {
        return map.insertLikeArtist(vo);
    }

    @Override
    public List<LikeArtistVO> likeArtistList(String memberId) {
        return map.likeArtistList(memberId);
    }

    @Override
    public int deleteLikeArtist(LikeArtistVO vo) {
        return map.deleteLikeArtist(vo);
    }

    @Override
    public List<String> searchFollowers(int artistId) {
        return map.selectMemberListByArtistId(artistId);
    }

}
