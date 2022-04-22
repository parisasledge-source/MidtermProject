package com.skilldistillery.petsleuth.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.petsleuth.data.UserDAO;
import com.skilldistillery.petsleuth.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping( path = {"signup.do"}, method = RequestMethod.POST)
	public String user(Model model) {
		return "signup";
		
	}	
	
	@RequestMapping( path = {"signupPage.do"})
	public String home(Model model, User user) {
		model.addAttribute("user", userDao.createNewUser(user));
		return "signupResult";
	}	
	
}
