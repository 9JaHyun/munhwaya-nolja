package com.munhwa.prj.news.event;

import com.munhwa.prj.likeArtist.service.LikeArtistService;
import com.munhwa.prj.news.event.entity.AlbumRequestEvent;
import com.munhwa.prj.news.service.NewsService;
import com.munhwa.prj.news.vo.NewsVO;
import java.util.Date;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Slf4j
@RequiredArgsConstructor
@Component
public class AlbumRequestHandler {

    private final NewsService newsService;
    private final LikeArtistService likeArtistService;

    @Order(1)
    @EventListener
    public void sendMusicUploadNews(AlbumRequestEvent event) {
        List<String> followerIds = likeArtistService.searchFollowers(event.getArtistId());
        log.info("send News to ={}", followerIds);

        followerIds.stream()
              .map(id -> {
                  NewsVO news = new NewsVO();
                  news.setMemberId(id);
                  news.setPks(event.getAlbumId());
                  news.setCode("N02");
                  news.setCreatedAt(new Date());
                  return news;
              })
              .forEach(newsService::save);
    }
}
