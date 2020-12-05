package com.carparking.service;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.carparking.commons.TrimUtils;
import com.carparking.entities.TripEntitty;
import com.carparking.repositories.TripRepository;
import com.microsoft.sqlserver.jdbc.StringUtils;

/**
* TripService.java
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
@Service
public class TripService {
    
    /** The trip repository. */
    @Autowired
    private TripRepository tripRepository;
    
    /** The data source. */
    @Autowired
    private DataSource dataSource;
    
    /**
     * Gets the trips.
     *
     * @return the trips
     */
    public List<TripEntitty> getTrips() {
        return (List<TripEntitty>) tripRepository.findAll();
    }
    
    /**
     * Check connect to Database.
     *
     * @return true, if successful
     */
    public boolean checkConnect() {
        try (Connection connection = dataSource.getConnection()) {
            return true;
        }catch (Exception e) {
           e.getStackTrace();
           return false;
        }
    }

    /**
     * Gets the limit trips.
     *
     * @param page the page
     * @param pageSize the page size
     * @param sort the sort
     * @param searchText the search text
     * @param filter the filter
     * @param date the date
     * @param time the time
     * @return the limit trips
     */
    public Page<TripEntitty> getLimitTrips(Integer page, Integer pageSize, String sort, String searchText,
            String filter,Date date,String time) {
        Sort sortable = null;
        if (sort.equals("ASC")) {
            sortable = new Sort(Sort.Direction.ASC, "tripId");
        }
        if (sort.equals("DESC")) {
            sortable = new Sort(Sort.Direction.DESC, "tripId");
        }
        Pageable paging = new PageRequest(page -1, pageSize, sortable);

        if ("destination".equalsIgnoreCase(filter) && searchText != null) {
            return tripRepository.searchByDestinationLike(searchText, paging);
        } else if ("departureTime".equalsIgnoreCase(filter) && time != null) {
            return tripRepository.searchByDepartureTimeLike(time, paging);
        } else if ("driver".equalsIgnoreCase(filter) && searchText != null) {
            return tripRepository.searchByDriverLike(searchText, paging);
        } else if ("carType".equalsIgnoreCase(filter) && searchText != null) {
            return tripRepository.searchByCarType(searchText, paging);
        } else if ("maximumOnlineTicketNumber".equalsIgnoreCase(filter) && StringUtils.isNumeric(searchText)) {
            return tripRepository.searchByMaximumOnlineTicketNumber(Integer.parseInt(searchText), paging);
        } else if ("DepartureDate".equalsIgnoreCase(filter) && date != null) {
                return tripRepository.findAllByDepartureDate(date, paging);
        } else if(searchText == null) {
            return tripRepository.findAll(paging);
        }else {
            return null;
        }
    }

    /**
     * Save.
     *
     * @param trip the trip
     * @return the trip entitty
     */
    public TripEntitty save(TripEntitty trip) {
        return tripRepository.save(TrimUtils.trimTrip(trip));
    }

    /**
     * Delete.
     *
     * @param tripId the trip id
     * @return true, if successful
     */
    public boolean delete(long tripId) {
        tripRepository.delete(tripId);
        return tripRepository.exists(tripId);
    }

}
