package com.munhwa.prj.artist.mapper;

import java.util.List;

import com.munhwa.prj.artist.vo.ArtistVO;

public interface ArtistMapper {

    List<ArtistVO> selectArtistList();

    ArtistVO selectArtistByMemberId(String memberId);

    int insertArtist(ArtistVO vo);

    int updateArtist(ArtistVO vo);

    int chkName(String name);
}
