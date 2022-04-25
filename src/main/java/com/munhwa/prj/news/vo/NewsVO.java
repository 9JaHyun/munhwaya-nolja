package com.munhwa.prj.news.vo;

import java.util.Date;
import lombok.Data;

@Data
public class NewsVO {

	private int id;
	private String memberId;
	private String code;
	private int pks;
	private int artistId;
	private String artistName;
	private Date createdAt;
}
