package com.hotelreservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotelreservation.dataobject.Room;
import com.hotelreservation.repository.RoomSearchRepository;

@Service
public class AdminService {
	@Autowired
	RoomSearchRepository roomSearchRepository;
	
	public List<Room> getRoomDetails(){
		List<Room> roomList = roomSearchRepository.findAll();
		return roomList;
	}
	
}
