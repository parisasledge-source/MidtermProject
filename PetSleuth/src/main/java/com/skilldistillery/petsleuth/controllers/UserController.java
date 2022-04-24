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
	
	@RequestMapping( path = {"signupPage.do"})
	public String user(Model model) {
		return "signup";
		
	}	
	
	@RequestMapping( path = {"signup.do"}, method = RequestMethod.POST)
	public String home(Model model, User user) {
		model.addAttribute("user", userDao.createNewUser(user));
		return "signupResult";
	}
	
	@RequestMapping( path = {"loginPage.do"})
	public String userLogin(Model model) {
		return "login";
		
	}	
	
	@RequestMapping( path = {"login.do"}, method = RequestMethod.POST)
	public String homeLogin(Model model, String username, String password) {
		User user = userDao.findExistingUser(username, password);
		model.addAttribute("user", user);
		return "loginResult";
	}	
	
}
