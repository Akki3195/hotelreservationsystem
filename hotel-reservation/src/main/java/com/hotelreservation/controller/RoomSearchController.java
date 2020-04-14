package com.hotelreservation.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotelreservation.dataobject.Room;
import com.hotelreservation.service.RoomSearchService;

@Controller
public class RoomSearchController {
	@Autowired
	RoomSearchService roomSearchService;
	
	@GetMapping("/viewRoomsDetails")
	public ModelAndView getAvailableRooms(@RequestParam String chkInDt,@RequestParam String chkOutDt)  {
		ModelAndView mv = new ModelAndView("welcome");
		Set<Room> roomList = roomSearchService.searchRoom(chkInDt, chkOutDt);
		mv.addObject("roomList",roomList);
		return mv;
	}
	
	@GetMapping("/bookroom")
	public @ResponseBody String bookRoom(@RequestParam String id,@RequestParam String fromDt,
			@RequestParam String toDt,@RequestParam String count,Principal principal) {
		
		try {
			Date fromDate = new SimpleDateFormat("yyyy-MM-dd").parse(fromDt);
			Date toDate = new SimpleDateFormat("yyyy-MM-dd").parse(toDt);
			roomSearchService.bookRoom(Long.parseLong(id), fromDate,
					toDate, Integer.parseInt(count),principal.getName());
		} catch (ParseException e) {
			e.printStackTrace();
			return "failed";
		}
		return "success";
		
	}
	
	@GetMapping("/admin/findroom")
	public  ModelAndView findRoomById(@RequestParam String id) {
			Room room = roomSearchService.findRoomById(Long.parseLong(id));
			ModelAndView mv = new ModelAndView("updateroomdetail");
			mv.addObject("roomDetail", room);
			return mv;
	}
	
	@PostMapping("/admin/updateroomdetail")
	public ModelAndView updateRoomDetail(@ModelAttribute("roomDetail") Room room) {
		ModelAndView mv = new ModelAndView("adminpage");
		if(roomSearchService.updateRoomDetail(room)) {
			mv.addObject("message", "success");
			return mv;
		}
		return mv;
	}
}
