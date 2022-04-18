package com.munhwa.prj.news.event.entity;

import lombok.Getter;

@Getter
public class PerformancePublishEvent {

    private int performanceId;
    private int artistId;

    public PerformancePublishEvent(int performanceId, int artistId) {
        this.performanceId = performanceId;
        this.artistId = artistId;
    }
}
