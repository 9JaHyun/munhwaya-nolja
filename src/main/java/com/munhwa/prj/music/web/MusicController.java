package com.munhwa.prj.music.web;

import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.common.file.entity.UploadFileVO;
import com.munhwa.prj.common.file.service.FileUtils;
import com.munhwa.prj.common.file.service.UploadFileService;
import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.common.paging.entity.PageDTO;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.music.service.AlbumService;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.service.PurchaseService;
import com.munhwa.prj.music.vo.AlbumVO;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.music.vo.PurchaseVO2;
import com.munhwa.prj.music.vo.etc.MusicChartDto;
import com.munhwa.prj.wishlist.service.WishlistService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MusicController {

    @Autowired
    private MusicService musicService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private WishlistService wishlistService;
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private UploadFileService uploadService;
    @Autowired
    private ArtistService artistService;
    @Autowired
    private FileUtils fileUtils;

    @GetMapping("/musicMain")
    public String musicMain(@LoginUser SessionUser user, Model model, Criteria cri) {

        String id = user.getId();
        model.addAttribute("musicRnBList", musicService.musicSelectListByGenre("G04"));
        model.addAttribute("musicRapList", musicService.musicSelectListByGenre("G03"));
        model.addAttribute("musicDanceList", musicService.musicSelectListByGenre("G02"));
        model.addAttribute("musicBalladList", musicService.musicSelectListByGenre("G01"));

        model.addAttribute("musicChartList", musicService.musicSelectList(cri));// 갯수지정
        model.addAttribute("releaseSoonAlbumList",
              albumService.albumSelectListByRelease(cri));// 갯수지정
        model.addAttribute("musicPersonalList", musicService.musicPersonalList(id, cri));

        return "music/musicMain";
    }

    @GetMapping("/searchResult")
    public String searchResult(String title, Model model, Criteria cri) {
        title = title.trim();
        if (title.isEmpty()) {
            model.addAttribute("checkM", 0);
            model.addAttribute("checkA", 0);
        } else {
            model.addAttribute("musicSelectListByTitle",
                  musicService.musicSelectByTitle(title, cri));
            if (musicService.musicSelectByTitle(title, cri).size() == 0) {
                model.addAttribute("checkM", 0);
            } else {
                model.addAttribute("checkM", 1);
            }
            model.addAttribute("albumSelectListByTitle",
                  albumService.albumSelectByTitle(title, cri));
            if (albumService.albumSelectByTitle(title, cri).size() == 0) {
                model.addAttribute("checkA", 0);
            } else {
                model.addAttribute("checkA", 1);
            }
        }

        model.addAttribute("title", title);
        return "music/searchResult";
    }

    @GetMapping("/searchResultMusic")
    public String searchResultMusic(@LoginUser SessionUser user, Model model, String title,
          Criteria cri) {
        model.addAttribute("title", title);

        List<MusicVO> list = musicService.musicSelectByTitle(title, cri);

        List<Integer> musicList = purchaseService.purchaseSelectList(user.getId());

        List<MusicChartDto> chartList = checkPurchasedMusic(list, musicList);
        model.addAttribute("musicSelectListByTitle1", chartList);

        int total = musicService.getCountByList3(title);
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);
        return "music/searchResultMusic";
    }

    private List<MusicChartDto> checkPurchasedMusic(List<MusicVO> list, List<Integer> musicList) {
        List<MusicChartDto> chartList = new ArrayList<>();

        for (MusicVO vo : list) {

            MusicChartDto dto = new MusicChartDto(vo);
            int ids = dto.getId();
            boolean isPurchased = false;

            for (int id : musicList) {
                if (ids == id) {
                    isPurchased = true;
                    break;
                }
            }
            dto.setPurchase(isPurchased);
            dto.setArtId(artistService.artIdByAlbId(dto.getAlbumId()));
            chartList.add(dto);//구입여부가 들어잇는 vo2를 jsp에 표시할 리스트모델에 담음
        }
        return chartList;
    }

    @GetMapping("/searchResultAlbum")
    public String searchResultAlbum(Model model, String title, Criteria cri) {
        model.addAttribute("title", title);
        model.addAttribute("albumSelectListByTitle1", albumService.albumSelectByTitle(title, cri));

        int total = albumService.getCountByList4(title);
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);

        return "music/searchResultAlbum";
    }

    @GetMapping("/chart")
    public String chart(@LoginUser SessionUser user, Model model, Criteria cri) {
        //원래 차트에 표시될 음원의 리스트
        List<MusicVO> list = musicService.musicSelectList(
              cri); //여기서 페이징처리후 다가져온다?  1-10까지검색 => 11-20까지 검색

        //아이디 넣으면 구매한 음원의 아이디 목록 나옴
        List<Integer> musicList = purchaseService.purchaseSelectList(user.getId());

        //차트에 표시할 Dto를 담을 리스트
        List<MusicChartDto> chartList = checkPurchasedMusic(list, musicList);
        int total = 50;
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);

        model.addAttribute("musicChartList", chartList);// 갯수지정
        return "music/chart";
    }

    @GetMapping("/releaseSoon")
    public String releaseSoon(Model model, Criteria cri) {
        List<AlbumVO> list = albumService.albumSelectListByRelease(cri);
        model.addAttribute("releaseSoonAlbumList", list);

        int total = 20;
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);
        return "music/releaseSoon";
    }

    // 아티스트 앨범 폼 호출
    @RequestMapping("/insertAlbumForm.do")
    public String albumForm(@LoginUser SessionUser user, Model model) {
        model.addAttribute("albums", albumService.albumSelectListByMemberId(user.getId()));
        return "insertAlbumForm-artist";
    }

    @GetMapping("/albumInfo")
    public String albumInfo(@LoginUser SessionUser user, Model model, int id) {

        //원래 차트에 표시될 음원의 리스트
        List<MusicVO> list = musicService.musicSelectByAlBum(id);

        //아이디 넣으면 구매한 음원의 아이디 목록 나옴
        List<Integer> musicList = purchaseService.purchaseSelectList(user.getId());

        //차트에 표시할 Dto를 담을 리스트
        List<MusicChartDto> chartList = checkPurchasedMusic(list, musicList);

        model.addAttribute("selectAlbum", albumService.albumSelect(id));
        model.addAttribute("selectMusicByAlbum", chartList);
        model.addAttribute("wishlists", wishlistService.wishlistList(user.getId()));
        return "music/albumInfo";
    }

    @GetMapping("/streaming")
    public String streaming(Model model, int id, @LoginUser SessionUser user) {

        MusicVO vo = musicService.musicSelect(id);

        List<Integer> musicList = purchaseService.purchaseSelectList(user.getId());

        for (int id1 : musicList) {
            if (id == id1) {
                model.addAttribute("buyButton", '1');
                break;
            } else {
                model.addAttribute("buyButton", '2');
            }
        }

        model.addAttribute("musicSelect", vo);
        model.addAttribute("AlbumSelectByMusicId", albumService.albumSelectByMusicId(id));
        model.addAttribute("wishlists", wishlistService.wishlistList(user.getId()));
        return "music/streaming";
    }

    @RequestMapping("/streamingList")
    public String streamingList(@RequestParam("musicIdList") List<Integer> musicIdList, Model model,
          @LoginUser SessionUser user) {
        int first = musicIdList.get(0);
        model.addAttribute("album", albumService.albumSelectByMusicId(first));

        Map<String, List<Integer>> paramMap = new HashMap<>();
        paramMap.put("musicIdList", musicIdList);
        model.addAttribute("musicList", musicService.musicSelectListByMusicId(paramMap));

        model.addAttribute("wishlists", wishlistService.wishlistList(user.getId()));

        return "music/streamingList";
    }

    @GetMapping("/streamingWishList")
    public String streamingWishList(Model model, @RequestParam int id) {
        model.addAttribute("musicSelectListByWishList", musicService.musicSelectListByWishList(id));
        model.addAttribute("albumSelectListByWishList", albumService.albumSelectListByWishList(id));
        model.addAttribute("albumSelectByWishList",
              albumService.albumSelectByWishList(id)); // 위시리스트의 첫번째 곡의 앨범정보
        return "music/streamingWishList";
    }

    @GetMapping("/personalResult")
    public String personalResult(Model model, @LoginUser SessionUser user, Criteria cri) {
        List<MusicVO> list = musicService.musicPersonalList(user.getId(), cri);

        List<Integer> musicList = purchaseService.purchaseSelectList(user.getId());

        List<MusicChartDto> chartList = checkPurchasedMusic(list, musicList);

        model.addAttribute("musicPersonalList", chartList);

        int total = musicService.getCountByList(user.getId());
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);

        return "music/personalResult";
    }

    @GetMapping("/genre")
    public String genre(Model model) {
        model.addAttribute("musicRnBList", musicService.musicSelectListByGenre("G04"));
        model.addAttribute("musicRapList", musicService.musicSelectListByGenre("G03"));
        model.addAttribute("musicDanceList", musicService.musicSelectListByGenre("G02"));
        model.addAttribute("musicBalladList", musicService.musicSelectListByGenre("G01"));
        return "music/genre";
    }

    @GetMapping("/playAllAlbum")
    public String playAllAlbum(Model model) {
        model.addAttribute("musicRnBList", musicService.musicSelectListByGenre("G04"));
        model.addAttribute("musicRapList", musicService.musicSelectListByGenre("G03"));
        model.addAttribute("musicDanceList", musicService.musicSelectListByGenre("G02"));
        model.addAttribute("musicBalladList", musicService.musicSelectListByGenre("G01"));
        return "music/genre";
    }

    // 내가 구매한 음원 목록
    @GetMapping("/purchase")
    public String purchase(@LoginUser SessionUser user, Model model, Criteria cri) {
        String id = user.getId();
        List<PurchaseVO2> list = purchaseService.purchaseSelectList2(id, cri);
        for (PurchaseVO2 vo : list) {
            vo.setArtId(artistService.artIdByAlbId(vo.getAlbId()));
        }
        model.addAttribute("purchasedList", list);
        int total = purchaseService.getCountByList5(id);
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);
        return "music/purchase";
    }

    @ResponseBody
    @GetMapping("/musicSelectByArtName")
    public Map<String, Object> musicSelectByArtName(@LoginUser SessionUser user,
          @RequestParam String title, @RequestParam String artName) {
        Map<String, Object> map = new HashMap<>();
        MusicVO vo = musicService.musicSelectByArtName(title, artName);
        int id = vo.getId();
        map.put("id", id);
        List<Integer> musicList = purchaseService.purchaseSelectList(user.getId());
        for (int ids : musicList) {
            if (id == ids) {
                map.put("purchased", 1);
                break;
            }
        }
        return map;
    }

    @ResponseBody
    @GetMapping("/musicSelectBymusicId/{musicId}")
    public MusicVO musicList(@PathVariable int musicId, Model model) {
        return musicService.musicSelect(musicId);
    }

    @ResponseBody
    @GetMapping("/albumSelectBymusicId/{musicId}")
    public AlbumVO albumSelectBymusicId(@PathVariable int musicId, Model model,
          @LoginUser SessionUser user) {
        return albumService.albumSelectByMusicId(musicId);
    }

    @ResponseBody
    @GetMapping("/getFiles/{fileId}")
    public UploadFileVO getFileSname(@PathVariable int fileId) {
        return uploadService.findById(fileId);
    }

    @ResponseBody
    @PostMapping("/statusUpdate")
    public void statusUpdate(@RequestParam int musicId, @LoginUser SessionUser user) {
        Map<String, Object> map = new HashMap<>();
        map.put("V_MUSIC_ID", musicId);
        map.put("V_MEMBER_ID", user.getId());

        musicService.statusUpdate(map);
    }

}
