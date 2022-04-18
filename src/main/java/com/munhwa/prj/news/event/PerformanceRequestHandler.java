package com.munhwa.prj.news.event;

import com.munhwa.prj.likeArtist.service.LikeArtistService;
import com.munhwa.prj.news.event.entity.PerformancePublishEvent;
import com.munhwa.prj.news.service.NewsService;
import com.munhwa.prj.news.vo.NewsVO;
import java.util.Date;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Slf4j
@RequiredArgsConstructor
@Component
public class PerformanceRequestHandler {

    private final NewsService newsService;
    private final LikeArtistService likeArtistService;

    @EventListener
    public void sendPerformanceUploadNews(PerformancePublishEvent event) {
        List<String> followerIds = likeArtistService.searchFollowers(event.getArtistId());
        log.info("send News to ={}", followerIds);
        followerIds.stream()
              .map(id -> {
                  NewsVO news = new NewsVO();
                  news.setMemberId(id);
                  news.setPks(event.getPerformanceId());
                  news.setCode("N03");
                  news.setCreatedAt(new Date());
                  return news;
              })
              .forEach(newsService::save);
    }
}
