package com.hotelreservation.service;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotelreservation.dataobject.Reservation;
import com.hotelreservation.dataobject.Room;
import com.hotelreservation.repository.RoomSearchRepository;

@Service
public class RoomSearchService {
	@Autowired
	RoomSearchRepository roomSearchRespository;
	
	public Set<Room> searchRoom(String checkInDate, String checkOutDate){
		Set<Room> rooms = roomSearchRespository.getRoomDetails(checkInDate, checkOutDate);
		return rooms;
	}
	
	public Room bookRoom(Long id,Date fromDt, Date toDate,int guestCount,String userName) {
		Room room = roomSearchRespository.findById(id).get();
		if(room.getReservation().size()==0 || room.getReservation().isEmpty()) {
			Reservation reservation = new Reservation();
			reservation.setCheckInDate(fromDt);
			reservation.setCheckOutDate(toDate);
			reservation.setNoOfGuests(guestCount);
			reservation.setCreatedTime(LocalDateTime.now());
			reservation.setRoom(room);
			reservation.setUserName(userName);
			HashSet<Reservation> res = new HashSet<>();
			res.add(reservation);
			room.setReservation(res);
		}
		Room savedRoom = roomSearchRespository.save(room);
		return savedRoom;
	}
	
	public Room findRoomById(Long id) {
		Room room = roomSearchRespository.findById(id).get();
		if(room != null) {
			return room;
		}
		return new Room();
	}
	
	public boolean updateRoomDetail(Room room) {
		roomSearchRespository.save(room);
		return true;
	}

}
