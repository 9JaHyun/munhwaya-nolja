package com.munhwa.prj.ticketList.mapper;

import java.util.List;

import com.munhwa.prj.ticketList.vo.TicketListVO;

public interface TicketListMapper {
	List<TicketListVO> ticketListSelectList();
	int ticketListInsert(TicketListVO vo);
	TicketListVO ticketListSelect(TicketListVO vo);
}
