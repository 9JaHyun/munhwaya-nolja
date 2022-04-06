package com.munhwa.prj.ticketList.mapper;

import java.util.List;
import java.util.Map;

import com.munhwa.prj.ticketList.vo.TicketListVO;

public interface TicketListMapper {
	List<TicketListVO> ticketListSelectList(String id);
	Map<String, Object> ticketListInsert(Map<String, Object> paramMap);
	TicketListVO ticketListSelect(TicketListVO vo);
	int qrcodeUpdate(TicketListVO vo);
	int qrcodeAttendance(int id);
}
