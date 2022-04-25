package com.skilldistillery.petsleuth.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.petsleuth.data.PetPhotoDAO;

@Controller
public class PetPhotoController {
	
	@Autowired
	private PetPhotoDAO petPhotoDao;
}
