package com.munhwa.prj.ticketList.service;

import java.util.List;

import com.munhwa.prj.ticketList.vo.TicketListVO;

public interface TicketListService {
	List<TicketListVO> ticketListSelectList();
	int ticketListInsert(TicketListVO vo);
	TicketListVO ticketListSelect(TicketListVO vo);
}
