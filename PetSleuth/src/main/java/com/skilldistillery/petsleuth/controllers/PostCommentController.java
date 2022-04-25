package com.skilldistillery.petsleuth.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.petsleuth.data.PostCommentDAO;
import com.skilldistillery.petsleuth.data.UserDAO;

@Controller
public class PostCommentController {

	@Autowired
	private PostCommentDAO postCommentDao;
	
	@Autowired
	private UserDAO userDao;
	
	@PostMapping( path = "displayPostComment.do")
	public String display(Model model, int postId, int userId, String content, Integer inReplyToCommentId) {
		model.addAttribute("success", postCommentDao.createNewComment(postId, userId, content, inReplyToCommentId));
		model.addAttribute("post", userDao.findPostById(postId));
		return "displayPost";
	}
}
