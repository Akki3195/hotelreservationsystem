package com.hotelreservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotelreservation.dataobject.Reservation;
import com.hotelreservation.repository.ReservationRepository;

@Service
public class ReservationDetailService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	public List<Reservation> getAllReservationDetail(){
		
		return reservationRepository.findAll();
	}
	
	public List<Reservation> searchReservationData(){
		
		return reservationRepository.findAll();
	}
	
public List<Reservation> filterReservationDetail(String fromDt, String toDate){
		
		return reservationRepository.filterReservationDetail(fromDt, toDate);
	}
	
	

}
