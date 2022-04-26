package com.skilldistillery.petsleuth.controllers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.petsleuth.data.UserDAO;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.Post;
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
	public String homeLogin(String username, String password, HttpSession session) {
		User user = userDao.findExistingUser(username, password);
		session.setAttribute("user", user);
		return "home";
	}	
	
	@RequestMapping( path = {"postPage.do"})
	public String post(Model model, User user) {
		model.addAttribute("user", user);
		model.addAttribute("pet", user.getPets());
		model.addAttribute("contact", user.getContacts());
		model.addAttribute("location", user.getLocation());
		//model.addAttribute("finder", user.getFinderPosts());
		
		return "post";
		
	}	
	
	@RequestMapping( path = {"post.do"}, method = RequestMethod.POST)
	public String home(@RequestParam(name = "last") String lastSeen, Model model, Post post, int petId, int contactId, int locationId, HttpSession session) {
		User newUser = (User)session.getAttribute("user");
		//User newUser = userDao.findById(userId);
		post.setUser(newUser);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date = LocalDate.parse(lastSeen, formatter);
		post.setLastSeen(date);
		model.addAttribute("post", userDao.addPost(post, petId, contactId, locationId));
		//model.addAttribute("user", newUser);
		return "postResult";
	}
	
	
	@RequestMapping( path = {"displayPost.do"})
	public String displayPost(Model model, HttpSession session, int id) {
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("post", userDao.findPostById(id));
		return "displayPost";
	}	
	
	@RequestMapping( path = {"petPage.do"})
	public String pet(Model model, HttpSession session) {
		User newUser = (User)session.getAttribute("user");
		
		return "pet";
		
	}	
	
	@RequestMapping( path = {"pet.do"}, method = RequestMethod.POST)
	public String home(Model model, Pet pet, HttpSession session) {
		User newUser = (User)session.getAttribute("user");
		pet.setUser(newUser);
		model.addAttribute("pet", userDao.addPet(pet));
		
		return "petResult";
	}
		
	@RequestMapping( path = {"displayPet.do"})
	public String displayPet(Model model, HttpSession session, int id) {
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("pet", userDao.findPetById(id));
		
		return "displayPet";
		
	}	
}
