package com.munhwa.prj.wallet.web;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.common.vo.PageDTO;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;
import com.munhwa.prj.music.service.PurchaseService;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.music.vo.PurchaseVO;
import com.munhwa.prj.wallet.service.ProfitService;
import com.munhwa.prj.wallet.service.UsageService;
import com.munhwa.prj.wallet.vo.ProfitVO;
import com.munhwa.prj.wallet.vo.UsageVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class WalletController {
	@Autowired
	private UsageService usageDao;
	
	@Autowired
	private ChargeService chargeDao;
	
	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private ProfitService profitDao;
	
	@Autowired
	private PurchaseService purchaseDao;
	
	//카트 결제
	@Transactional
	@PostMapping("/payCart")
	@ResponseBody
	public String payCart(@LoginUser SessionUser user, @RequestBody List<MusicVO> musics) {
		Date useDate = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());

		String memberId = user.getId();
		// musics -> 1. 마일리지 합계 구하기
		//			 2. 곡 ID를 수집 => 구매음원, 사용, 수익 내역에 전달
		
		/** 마일리지
		 * 	1st. 회원에서 차감
		 *  2nd. 아티스트에게 추가
		 */
		int sum = 0;
		List<UsageVO> resultUsageList = new ArrayList<>();
		List<PurchaseVO> resultPurchaseList = new ArrayList<>();
		List<ProfitVO> resultProfitByArtist = new ArrayList<>();
		Map<String,Object> param = new HashMap<String, Object>();
		for(MusicVO music : musics) {
			sum += music.getPrice();
			System.out.println("뮤직아이디" + music.getId());
			UsageVO usageVO = new UsageVO();
			usageVO.setMileage(music.getPrice());
			usageVO.setUseAt(useDate);
			usageVO.setPlace("U01");
			usageVO.setMemberId(memberId);
			usageVO.setPks(music.getId());
			
			resultUsageList.add(usageVO);
			            
			PurchaseVO purchaseVO = new PurchaseVO();
			purchaseVO.setMusicId(music.getId());
			purchaseVO.setMemberId(memberId);
			
			resultPurchaseList.add(purchaseVO);
			
			ProfitVO profitVO = new ProfitVO();
			profitVO.setProfitAt(useDate);
			profitVO.setMileage(music.getPrice());
			profitVO.setPlace("U01");
			profitVO.setId(music.getId());
			profitVO.setPks(music.getId());
			
			resultProfitByArtist.add(profitVO);
								
			param.put("v_member_id", memberId);
			param.put("v_mileage", music.getPrice());
			param.put("v_title", music.getTitle());
		}	

			// 사용내역 남기기 
			usageDao.insertUsage(resultUsageList);
			// 구매한 음원리스트에 담기
			purchaseDao.purchaseInsert(resultPurchaseList);
			// 곡 구매시 아티스트 수익 내역에 찍기
			profitDao.insertProfit(resultProfitByArtist);
			// 곡 구매한 회원 마일리지 차감, 아티스트 수익 추가 프로시저 
			memberDao.updateMileageMusic(param);
			
			user.getCart().clear();
			user.setMileage(user.getMileage()-sum);
			return "success";
	}
	
	
	// 마이페이지 지갑 정보 리스트 페이지
	@GetMapping("/walletInfo.do")
	public String walletInfo(@LoginUser SessionUser user,  Model model) {
		String memberId = user.getId();
		model.addAttribute("memberId", memberId);
		model.addAttribute("role", user.getRole());
		return "walletInfo-memberWallet";
	}
	
	// 지갑 정보 상세 페이지
	@RequestMapping("/walletInfoSelect.do")
	public String walletInfoSelect(@LoginUser SessionUser user, Model model, Criteria cri) {
		String memberId = user.getId();
		List<ChargeVO> list = chargeDao.findByMemberId(memberId, cri);
		model.addAttribute("charges", list);
		model.addAttribute("mileage", user.getMileage());
		int total = chargeDao.getCountByChargeId(memberId);
	    PageDTO pageMake = new PageDTO(cri, total);
	    model.addAttribute("pageMaker", pageMake);
		return "walletInfoSelect-memberWallet";
	}
	
	// 마일리지 사용 내역 페이지
	@GetMapping("/usageHistory.do")
	public String usageHistory(@LoginUser SessionUser user, Model model, Criteria cri) {
		String memberId = user.getId();
		List<UsageVO> list = usageDao.findByMemberId(memberId, cri);
		model.addAttribute("usages",list);
		int total = usageDao.getCountByUsageId(memberId);
		PageDTO pageMake = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "usageHistory-memberWallet";
	}
	
	// 마일리지 충전 페이지
	@GetMapping("/chargeForm.do")
	public String chargeForm( @LoginUser SessionUser user, Model model) {
		String memberId = user.getId();
		model.addAttribute("memberId", memberId);
		return "chargeForm-memberWallet";
	}
	
	// 마일리지 출금 페이지
	@GetMapping("/withdrawForm.do")
	public String withdrawForm() {
		return "withdrawForm-memberWallet";
	}
	
	// 아티스트 수익 내역 페이지
	@GetMapping("/profitHistory.do")
	public String profitHistory(@LoginUser SessionUser user, Model model, Criteria cri) {
		String memberId = user.getId();
		List<ProfitVO> list = profitDao.findByMemberId(memberId, cri);
		model.addAttribute("profits", list);
		int total = profitDao.getCountByProfitId(memberId);
		PageDTO pageMake = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "profitHistory-memberWallet";
	}
		
	
	
}
