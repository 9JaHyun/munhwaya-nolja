package com.munhwa.prj.artist.web;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class SmsResponse {
	private String requestId;
	private LocalDateTime requestTime;
	private String statusCode;
	private String statusName;
}
