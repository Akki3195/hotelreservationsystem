package com.hotelreservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hotelreservation.dataobject.Reservation;
import com.hotelreservation.dataobject.Room;
import com.hotelreservation.service.AdminService;
import com.hotelreservation.service.ReservationDetailService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ReservationDetailService reservationDetailService;
	
	@GetMapping("getroomdetails")
	public ModelAndView getAllRoomsDetail() {
		ModelAndView mv = new ModelAndView("adminpage");
		List<Room> roomList = adminService.getRoomDetails();
		mv.addObject(roomList);
		return mv;
	}
	
	@GetMapping("viewreport")
	public ModelAndView getReportDetails() {
		ModelAndView mv = new ModelAndView("adminpage");
		List<Reservation> reservationList = reservationDetailService.getAllReservationDetail();
		mv.addObject(reservationList);
		return mv;
	}
	
	@GetMapping("filterreport")
	public ModelAndView getFilterReport(@RequestParam String fromDate,@RequestParam String toDate)  {
		ModelAndView mv = new ModelAndView("adminpage");
		List<Reservation> reservationDetails = reservationDetailService.filterReservationDetail(fromDate, toDate);
		mv.addObject("reservationList",reservationDetails);
		return mv;
	}
	
	@GetMapping("addnewroom")
	public ModelAndView newRoom()  {
		ModelAndView mv = new ModelAndView("addnewroom");
		mv.addObject("room",new Room());
		return mv;
	}
	
	@PostMapping("addnewroom")
	public ModelAndView addNewRoom(@ModelAttribute Room roomDetail)  {
		  adminService.addNewRoomService(roomDetail);
		  ModelAndView mv = new ModelAndView("adminpage");
		  mv.addObject("roomMessage", "success");
		return mv;
	}
	
	

}
