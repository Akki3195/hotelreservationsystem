package com.hotelreservation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.hotelreservation.dataobject.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long>{
	
	
	@Query("SELECT r FROM Reservation r WHERE TO_CHAR(r.createdTime,'MM/dd/yyyy') BETWEEN :fromDate AND :toDate")
	List<Reservation> filterReservationDetail(@Param("fromDate") String fromDate,@Param("toDate") String toDate);

}
