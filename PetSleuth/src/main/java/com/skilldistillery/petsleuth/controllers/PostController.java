package com.skilldistillery.petsleuth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.petsleuth.data.PostDAO;
import com.skilldistillery.petsleuth.entities.Post;
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
	
	@RequestMapping( path = {"updatePost.do"}, method = RequestMethod.POST)
	public String updatePost(int postId, Model model, HttpSession session, Post post) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("post", postDao.updatePost(postId, post));
		return "displayPost";
		
	}	
	
	@RequestMapping(path = {"destroyPost.do"})
	public String destroyPost(Integer postId, Model model, HttpSession session) {
		boolean post = postDao.destroy(postId);
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("posts", postDao.findByUserId(user.getId()));
		model.addAttribute("post", post);
		return "displayPosts";
	}

	
}
