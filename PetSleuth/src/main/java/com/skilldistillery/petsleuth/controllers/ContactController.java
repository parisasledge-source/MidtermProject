package com.skilldistillery.petsleuth.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.petsleuth.data.ContactDAO;

@Controller
public class ContactController {
	
	@Autowired
	private ContactDAO contactDao;

}
