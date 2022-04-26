package com.munhwa.prj.likeArtist.web;

import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.likeArtist.service.LikeArtistService;
import com.munhwa.prj.likeArtist.vo.LikeArtistVO;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class LikeArtistController {

	@Autowired
	private LikeArtistService likeArtistService;

	@ResponseBody
	@PostMapping("/follow")
	public ResponseEntity<String> followArtist(@LoginUser SessionUser user, int artistId) {
		log.info("artistId={}", artistId);
		List<LikeArtistVO> followArtists = likeArtistService.likeArtistList(user.getId());
		boolean alreadyFollowed = followArtists.stream()
			.map(LikeArtistVO::getArtistId)
			.anyMatch(id -> artistId == id);

		if (alreadyFollowed) {
			return ResponseEntity.badRequest().body("이미 팔로우한 아티스트입니다.");
		}

		LikeArtistVO vo = new LikeArtistVO();
		vo.setMemberId(user.getId());
		vo.setArtistId(artistId);

		int result = likeArtistService.follow(vo);
		if (result != 0) {
			return ResponseEntity.ok().body("등록 성공");
		}
		return ResponseEntity.badRequest().body("등록 실패");
	}

	// 좋아요 한 아티스트 리스트
	@GetMapping("/likeArtist.do")
	public String likeArtistList(@LoginUser SessionUser user, Model model) {
		model.addAttribute("likeArtists", likeArtistService.likeArtistList(user.getId()));
		return "likeArtist-member";
	}
	
	// 좋아요 한 아티스트 삭제
	@ResponseBody
    @RequestMapping("/deleteLikeArtist.do")
    public String deleteLikeArtist(@LoginUser SessionUser user, @RequestBody ArtistDeleteReqeustDto dto) {
    	LikeArtistVO vo = new LikeArtistVO();
    	vo.setMemberId(user.getId());
    	vo.setArtistId(dto.getArtistId());
    	
    	likeArtistService.deleteLikeArtist(vo);
    	return "redirect:likeArtist.do";
    }
}
