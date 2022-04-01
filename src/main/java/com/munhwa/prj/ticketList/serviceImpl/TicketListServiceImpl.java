package com.munhwa.prj.ticketList.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.ticketList.mapper.TicketListMapper;
import com.munhwa.prj.ticketList.service.TicketListService;
import com.munhwa.prj.ticketList.vo.TicketListVO;

@Repository("ticketListDao")
public class TicketListServiceImpl implements TicketListService {

	@Autowired
	private TicketListMapper map;
	
	@Override
	public List<TicketListVO> ticketListSelectList(String id) {
		return map.ticketListSelectList(id);
	}

	@Override
	public int ticketListInsert(Map<String, Object> paramMap) {
		return map.ticketListInsert(paramMap);
	}

	@Override
	public TicketListVO ticketListSelect(TicketListVO vo) {
		return map.ticketListSelect(vo);
	}

}
