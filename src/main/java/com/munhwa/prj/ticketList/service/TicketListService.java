package com.munhwa.prj.ticketList.service;

import java.util.List;
import java.util.Map;

import com.munhwa.prj.ticketList.vo.TicketListVO;

public interface TicketListService {
	List<TicketListVO> ticketListSelectList(String id);
	int ticketListInsert(Map<String, Object> paramMap);
	TicketListVO ticketListSelect(TicketListVO vo);
	int ticketListDelete(Map<String, Object> paramMap);
	
	int qrcodeUpdate(TicketListVO vo);
	
	
	int qrcodeAttendance(Map<String, Object> paramMapt);
}
