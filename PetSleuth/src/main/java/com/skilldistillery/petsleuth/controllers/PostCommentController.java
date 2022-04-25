package com.skilldistillery.petsleuth.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.petsleuth.data.PostCommentDAO;

@Controller
public class PostCommentController {

	@Autowired
	private PostCommentDAO postCommentDao;
}
