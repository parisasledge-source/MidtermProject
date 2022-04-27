package com.skilldistillery.petsleuth.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.petsleuth.data.PostCommentDAO;
import com.skilldistillery.petsleuth.data.UserDAO;
import com.skilldistillery.petsleuth.entities.Post;
import com.skilldistillery.petsleuth.entities.PostComment;
import com.skilldistillery.petsleuth.entities.User;

@Controller
public class PostCommentController {

	@Autowired
	private PostCommentDAO postCommentDao;
	
	@Autowired
	private UserDAO userDao;
	
	@PostMapping( path = "displayPostComment.do")
	public ModelAndView display(int id, int userId, String content, Integer inReplyToCommentId, RedirectAttributes redir, HttpSession session) {
		User user = (User)session.getAttribute("user");
		ModelAndView mv = new ModelAndView();
		PostComment pc = postCommentDao.createNewComment(id, userId, content, inReplyToCommentId);
		mv.addObject("success", pc);
		mv.addObject("user", user);
		mv.addObject("post", userDao.findPostById(id));
		mv.addObject("postcomments", postCommentDao.findPostCommentByPostId(id));
		mv.addObject("pets", userDao.findPetsByUserId(user.getId()));
		mv.addObject("contacts", userDao.findContactsByUserId(user.getId()));
		mv.addObject("locations", userDao.findLocationsByUserId(user.getId()));
		mv.setViewName("displayPost");
		return mv;
	}
	
//	@GetMapping( path = "displayPostCommentRedir.do")
//	public ModelAndView display2() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("displayPost");
//		return mv;
//	}
}
