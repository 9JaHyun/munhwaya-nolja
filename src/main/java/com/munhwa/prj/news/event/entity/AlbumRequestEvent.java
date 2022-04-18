package com.munhwa.prj.news.event.entity;

import lombok.Getter;

@Getter
public class AlbumRequestEvent {

    private int albumId;
    private int artistId;
    public AlbumRequestEvent(int albumId, int artistId) {
        this.albumId = albumId;
        this.artistId = artistId;
    }
}
