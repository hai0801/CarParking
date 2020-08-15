package com.carparking.repositories;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.carparking.entities.TripEntitty;

/**
* TripRepository.java
*
* Version 1.0
*
* Date: 23-03-2020
*
* Copyright 
*
* Modification Logs:
* DATE                 AUTHOR          DESCRIPTION
* -----------------------------------------------------------------------
* 01-04-2020        HaiNV28            Create
*/
/**
* @author HaiNV28
*
*/
@Repository
public interface TripRepository extends JpaRepository<TripEntitty, Long> {
    
    /**
     * Search by destination like.
     *
     * @param destination the destination
     * @param pageable the pageable
     * @return the page
     */
    @Query("SELECT t FROM TripEntitty t WHERE t.destination LIKE %:destination%")
    Page<TripEntitty> searchByDestinationLike(@Param("destination") String destination, Pageable pageable);
    
    /**
     * Search by departure time like.
     *
     * @param departureTime the departure time
     * @param pageable the pageable
     * @return the page
     */
    @Query("SELECT t FROM TripEntitty t WHERE t.departureTime LIKE %:departureTime%")
    Page<TripEntitty> searchByDepartureTimeLike(@Param("departureTime") String departureTime, Pageable pageable);
    
    /**
     * Search by driver like.
     *
     * @param driver the driver
     * @param pageable the pageable
     * @return the page
     */
    @Query("SELECT t FROM TripEntitty t WHERE t.driver LIKE %:driver%")
    Page<TripEntitty> searchByDriverLike(@Param("driver") String driver, Pageable pageable);
    
    /**
     * Search by car type.
     *
     * @param carType the car type
     * @param pageable the pageable
     * @return the page
     */
    @Query("SELECT t FROM TripEntitty t WHERE t.carType LIKE %:carType%")
    Page<TripEntitty> searchByCarType(@Param("carType") String carType, Pageable pageable);
    
    /**
     * Search by maximum online ticket number.
     *
     * @param maximumOnlineTicketNumber the maximum online ticket number
     * @param pageable the pageable
     * @return the page
     */
    @Query("SELECT t FROM TripEntitty t WHERE t.maximumOnlineTicketNumber = :maximumOnlineTicketNumber")
    Page<TripEntitty> searchByMaximumOnlineTicketNumber(@Param("maximumOnlineTicketNumber") Integer maximumOnlineTicketNumber, Pageable pageable);
//    Page<TripEntitty> findAllByMaximumOnlineTicketNumber(Integer maximumOnlineTicketNumber, Pageable pageable);
/**
 * Find all by departure date.
 *
 * @param departureDate the departure date
 * @param pageable the pageable
 * @return the page
 */
    Page<TripEntitty> findAllByDepartureDate(Date departureDate, Pageable pageable);

}
