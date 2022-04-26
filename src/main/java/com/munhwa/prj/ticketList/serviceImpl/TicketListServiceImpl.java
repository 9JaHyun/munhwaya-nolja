package com.munhwa.prj.ticketList.serviceImpl;

import com.munhwa.prj.ticketList.mapper.TicketListMapper;
import com.munhwa.prj.ticketList.service.TicketListService;
import com.munhwa.prj.ticketList.vo.TicketListVO;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketListServiceImpl implements TicketListService {

	@Autowired
	private TicketListMapper mapper;
	
	@Override
	public List<TicketListVO> ticketListSelectList(String id) {
		return mapper.ticketListSelectList(id);
	}

	@Override
	public int ticketListInsert(Map<String, Object> paramMap) {
		mapper.ticketListInsert(paramMap);
		return (int) paramMap.get("v_ticket_id");
	}

	@Override
	public TicketListVO ticketListSelect(TicketListVO vo) {
		return mapper.ticketListSelect(vo);
	}

	@Override
	public int qrcodeUpdate(TicketListVO vo) {
		return mapper.qrcodeUpdate(vo);
	}

	@Override
	public int qrcodeAttendance(Map<String, Object> paramMapt) {
		return mapper.qrcodeAttendance(paramMapt);
	}

	@Override
	public int ticketListDelete(Map<String, Object> paramMap) {
		return mapper.ticketListDelete(paramMap);
	}

}
