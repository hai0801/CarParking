package com.carparking.commons;

import org.apache.commons.lang3.StringUtils;

import com.carparking.entities.TripEntitty;


/**
* TrimUtils.java
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
public class TrimUtils {
    
    /**
     * Trim trip.
     *
     * @param trip the trip
     * @return the trip entitty
     */
    public static TripEntitty trimTrip(TripEntitty trip) {
        if(trip != null) {
            trip.setDestination(StringUtils.trimToNull(trip.getDestination()));
            trip.setDepartureTime(StringUtils.trimToNull(trip.getDepartureTime()));
            trip.setDriver(StringUtils.trimToNull(trip.getDriver()));
            trip.setCarType(StringUtils.trimToNull(trip.getCarType()));
        }
        return trip;
    }
}
