package com.carparking.controller;

import java.util.ArrayList;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.routines.DateValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.carparking.entities.TripEntitty;
import com.carparking.service.TripService;

/**
* TripController.java
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
@Controller
public class TripController {
    
	/** The trip Service. */
    @Autowired
    private TripService tripService;
    
    @Autowired
    private TripEntitty tripEntitty;

    /**
     * View list trip.
     *
     * @param model the model
     * @param page the page
     * @param searchText the search text
     * @param filter the filter
     * @param departureTime the departure time
     * @param departureDate the departure date
     * @param sort the sort
     * @param status the status
     * @param message the message
     * @return the string
     */
    @RequestMapping(value = { "/", "/trip-list", "/home" }, method = RequestMethod.GET)
    public String viewListTrip(Model model,
            @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
            @RequestParam(value = "page", required = false, defaultValue = "5") Integer pageSize,
            @RequestParam(required = false, value = "searchText") String searchText,
            @RequestParam(required = false, value = "filter", defaultValue = "destination") String filter,
            @RequestParam(required = false, value = "departureTime") String departureTime,
            @RequestParam(required = false, value = "departureDate") String departureDate,
            @RequestParam(name = "sort", required = false, defaultValue = "ASC") String sort,
            @RequestParam(required = false, value = "status") String status,
            @RequestParam(required = false, value = "message") String message) {
        Page<TripEntitty> pagedResult = tripService.getLimitTrips(page, pageSize, sort, StringUtils.trimToNull(searchText), filter,
                DateValidator.getInstance().validate(departureDate, "dd-MM-yyyy"), StringUtils.trimToNull(departureTime));
        if (pagedResult != null && pagedResult.hasContent()) {
            model.addAttribute("trips", pagedResult.getContent());
            model.addAttribute("page", pagedResult.getNumber() + 1);
            model.addAttribute("totalPage", pagedResult.getTotalPages());
        } else {
            model.addAttribute("trips", new ArrayList<TripEntitty>());
            model.addAttribute("page", 1);
            model.addAttribute("totalPage", 0);
        }
        model.addAttribute("searchText", searchText);
        model.addAttribute("filter", filter);
        model.addAttribute("departureTime", departureTime);
        model.addAttribute("departureDate", departureDate);
        model.addAttribute("status", status);
        model.addAttribute("message", message);
        return "trip-list";
    }

    /**
     * View add trip.
     *
     * @param model the model
     * @return the string
     */
    @RequestMapping(value = { "/add-trip" }, method = RequestMethod.GET)
    public String viewAddTrip(Model model) {
        model.addAttribute("trip", tripEntitty);
        model.addAttribute("action", "add-trip");
        return "trip-add";
    }

    
    /**
     * View save trip.
     *
     * @param model the model
     * @param trip the trip
     * @param result the result
     * @param departureDate the departure date
     * @return the string
     */
    @RequestMapping(value = { "/add-trip" }, method = RequestMethod.POST)
    public String viewSaveTrip(Model model, @Valid @ModelAttribute("trip") TripEntitty trip, BindingResult result,
            @ModelAttribute("departureDate") String departureDate) {
        boolean disConnect = !tripService.checkConnect();
        if (result.hasErrors() || disConnect) {
            model.addAttribute("action", "add-trip");
            if(disConnect) {
                model.addAttribute("conect", "Database connection error.");
            }
            return "trip-add";
        } else {
            trip = tripService.save(trip);
            if (trip != null && trip.getTripId() > 0) {
                return "redirect:/trip-list?status=ok&message=Add trip successfully.";
            } else {
                return "redirect:/trip-list?status=fail&message=Add trip fail.";
            }
        }
    }

    /**
     * Redirect.
     *
     * @param searchText the search text
     * @param filter the filter
     * @param date the date
     * @param time the time
     * @param redirectAttributes the redirect attributes
     * @return the redirect view
     */
    @RequestMapping(value = { "/search-trip" }, method = RequestMethod.POST)
    public RedirectView redirect(@ModelAttribute("searchText") String searchText,
            @ModelAttribute("filter") String filter, @ModelAttribute("departureDate") String date,
            @ModelAttribute("departureTime") String time, RedirectAttributes redirectAttributes) {
        redirectAttributes.addAttribute("searchText", searchText);
        redirectAttributes.addAttribute("filter", filter);
        redirectAttributes.addAttribute("departureDate", date);
        redirectAttributes.addAttribute("departureTime", time);
        return new RedirectView("trip-list");
    }
    
    /**
     * Delete trip.
     *
     * @param model the model
     * @param tripId the trip id
     * @return the string
     */
    @RequestMapping(value = { "/delete-trip/{tripId}" }, method = RequestMethod.GET)
    public String deleteTrip(Model model, @PathVariable("tripId") long tripId) {
        boolean isDelete = tripService.delete(tripId);
        if (!isDelete) {
            return "redirect:/trip-list?status=ok&message=Success! delete success.";
        } else {
            return "redirect:/trip-list?status=fail&message=Fail! delete fail.";
        }
    }
}
