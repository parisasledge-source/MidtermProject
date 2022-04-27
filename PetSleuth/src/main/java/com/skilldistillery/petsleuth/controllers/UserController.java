package com.skilldistillery.petsleuth.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String home(Model model, User user, RedirectAttributes redir, HttpSession session) {
		session.setAttribute("user", userDao.createNewUser(user));
		return "redirect:signupRedir.do";
	}
	
	@RequestMapping( path = {"signupRedir.do"}, method = RequestMethod.GET)
	public String signupRedir() {
		return "home";
	}
	
	@RequestMapping( path = {"loginPage.do"})
	public String userLogin(Model model) {
		return "login";
	}	
	
	@RequestMapping( path = {"login.do"}, method = RequestMethod.POST)
	public String homeLogin(String username, String password, HttpSession session) {
		User user = userDao.findExistingUser(username, password);
		session.setAttribute("user", user);
		return "redirect:loginRedir.do";
	}
	
	@RequestMapping( path = {"loginRedir.do"}, method = RequestMethod.GET)
	public String loginRedir() {
		return "home";
	}
	
	@RequestMapping( path = {"displayUserInfo.do"})
	public String displayUser(Model model) {
		return "displayUserInfo";
	}
	
	@RequestMapping( path = {"updateUser.do"}, method = RequestMethod.POST)
	public String updateUser(Model model, HttpSession session, User newUser) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", userDao.updateUser(newUser, user));
		return "displayUserInfo";
	}
}
