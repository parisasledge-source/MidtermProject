package com.skilldistillery.petsleuth.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.petsleuth.data.LocationDAO;
import com.skilldistillery.petsleuth.data.PostDAO;

@Controller
public class LocationController {
	
	@Autowired
	private LocationDAO locationDao;

}
