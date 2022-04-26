package com.skilldistillery.petsleuth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.petsleuth.data.LocationDAO;
import com.skilldistillery.petsleuth.entities.Location;

import com.skilldistillery.petsleuth.entities.User;

@Controller
public class LocationController {
	
	@Autowired
	private LocationDAO locationDao;

	@RequestMapping( path = {"displayLocations.do"})
	public String displayLocations(Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("locations", locationDao.findLocationById(user.getId()));
		return "location";
		
	}	
	@RequestMapping( path = {"updateLocations.do"}, method = RequestMethod.POST)
	public String updateLocations(Model model, HttpSession session, Location location) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("locations",locationDao.updateLocation(user.getId(), location));
		return "location";
		
	}	
	
}
