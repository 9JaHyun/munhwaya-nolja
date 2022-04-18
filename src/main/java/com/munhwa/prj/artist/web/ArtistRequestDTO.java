package com.munhwa.prj.artist.web;

import com.munhwa.prj.common.file.entity.UploadFile;

import lombok.Data;

@Data
public class ArtistRequestDTO {
	private String artwork;
	private UploadFile file;

}
