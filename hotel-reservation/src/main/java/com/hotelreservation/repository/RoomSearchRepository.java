package com.hotelreservation.repository;


import java.util.Date;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hotelreservation.dataobject.Room;
@Repository
public interface RoomSearchRepository extends JpaRepository<Room, Long>{

	
	  @Query("SELECT r FROM Room r WHERE r.id NOT IN "
	  		+ "(SELECT res.room.id from r.reservation res "
	  		+ "where  TO_CHAR(res.checkInDate,'MM/dd/yyyy') BETWEEN :checkInDate and :checkOutDate OR TO_CHAR(res.checkOutDate,'MM/dd/yyyy') BETWEEN :checkInDate and :checkOutDate)")
	  Set<Room> getRoomDetails(@Param("checkInDate") String checkInDate, @Param("checkOutDate") String checkOutDate);
	  
	  Optional<Room> findById(Long id);
}