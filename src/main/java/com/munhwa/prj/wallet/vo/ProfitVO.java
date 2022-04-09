package com.munhwa.prj.wallet.vo;

import java.util.Date;

import com.munhwa.prj.common.vo.CommonCodeVO;
import com.munhwa.prj.music.vo.MusicVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProfitVO {
	private int id;
	private Date profitAt;
	private int mileage;
	private String place;
	private String memberId;
	
	private CommonCodeVO commonCodevo;
	private MusicVO musicvo;
	private ArtistVO artistvo;
}
