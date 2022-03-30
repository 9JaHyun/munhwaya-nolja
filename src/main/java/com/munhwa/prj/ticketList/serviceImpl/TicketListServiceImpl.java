package com.munhwa.prj.ticketList.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.ticketList.service.TicketListMapper;
import com.munhwa.prj.ticketList.service.TicketListService;
import com.munhwa.prj.ticketList.vo.TicketListVO;

@Repository("ticketListDao")
public class TicketListServiceImpl implements TicketListService {

	@Autowired
	private TicketListMapper map;
	
	@Override
	public List<TicketListVO> ticketListSelectList() {
		return map.ticketListSelectList();
	}

	@Override
	public int ticketListInsert(TicketListVO vo) {
		return map.ticketListInsert(vo);
	}

	@Override
	public TicketListVO ticketListSelect(TicketListVO vo) {
		return map.ticketListSelect(vo);
	}

}
