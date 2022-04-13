package com.munhwa.prj.artist.web;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

	@AllArgsConstructor
	@NoArgsConstructor
	@Setter
	@Getter
	public class ServerRequest {
	    private String recipientPhoneNumber;
	    private String title;
	    private String content;

	}
