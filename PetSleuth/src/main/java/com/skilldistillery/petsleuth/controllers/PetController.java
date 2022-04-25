package com.skilldistillery.petsleuth.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.petsleuth.data.PetDAO;

@Controller
public class PetController {
	
	@Autowired
	private PetDAO petDao;

}
