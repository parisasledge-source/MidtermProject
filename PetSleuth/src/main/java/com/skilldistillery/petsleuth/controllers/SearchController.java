package com.skilldistillery.petsleuth.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.petsleuth.data.SearchDAO;
import com.skilldistillery.petsleuth.entities.Post;

@Controller
public class SearchController {

	@Autowired
	private SearchDAO searchDao;

	@PostMapping("search.do")
	public String search(String word, Model model, RedirectAttributes redir) {
		String map = "";

		String keyword = word;
		
		if (word.length() == 0) {
			List<Post> list = searchDao.displayAllPosts();
			redir.addFlashAttribute("posts", list);
			map = "redirect:searchedList.do";
			return map;
		}

		try {

			int newId = Integer.parseInt(word);
			List<Post> post = searchDao.findById(newId);
			redir.addFlashAttribute("posts", post);
			map = "redirect:searchedList.do";

		} catch (Exception e) {

			List<Post> list = searchDao.findByLocation(keyword);
			
			if (list.size() == 0) {
				list = searchDao.findByPet(keyword);
				if (list.size() == 0) {
					list = searchDao.findByPost(keyword);
					if (list.size() == 0) {
						redir.addFlashAttribute("posts", null);
						
					} else {
						redir.addFlashAttribute("posts", list);
					}
				} else {
					redir.addFlashAttribute("posts", list);
				}
			} else {
				redir.addFlashAttribute("posts", list);
			}
			
			map = "redirect:searchedList.do";
		}
		return map;
	}

	@GetMapping("searched.do")
	public String searched(Model model) {
		return "displayPost";
	}
	
	@GetMapping("searchedList.do")
	public String searchedList(Model model) {
		return "displayPosts";
	}

}
