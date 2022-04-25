package com.skilldistillery.petsleuth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.petsleuth.data.PostDAO;
import com.skilldistillery.petsleuth.entities.User;

@Controller
public class PostController {
	
	@Autowired
	private PostDAO postDao;
	
	@RequestMapping( path = {"displayPosts.do"})
	public String displayPosts(Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("posts", postDao.findByUserId(user.getId()));
		return "displayPosts";
		
	}	
	
//	@RequestMapping( path = {"displayPost.do"})
//	public String displayPost(Model model, HttpSession session, int id) {
//		model.addAttribute("user", session.getAttribute("user"));
//		model.addAttribute("post", userDao.findPostById(id));
//		
//		return "displayPost";
//		
//	}	

}
