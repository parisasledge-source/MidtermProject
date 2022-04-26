package com.skilldistillery.petsleuth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.petsleuth.data.PetDAO;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.User;

@Controller
public class PetController {
	
	@Autowired
	private PetDAO petDao;
	
	@RequestMapping( path = {"displayPets.do"})
	public String displayPets(Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("pets", petDao.findByUserId(user.getId()));
		return "displayPets";
		
	}	
	
	@RequestMapping( path = {"updatePet.do"}, method = RequestMethod.POST)
	public String updatePet(int petId, Model model, HttpSession session, Pet pet) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("pet", petDao.updatePet(petId, pet));
		return "displayPet";
		
	}	

	
	@RequestMapping(path = {"hidePet.do"})
	public String hidePet(Integer petId, Model model, HttpSession session) {
		boolean pet = petDao.hide(petId);
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("pets", petDao.findByUserId(user.getId()));
		model.addAttribute("pet", pet);
		return "displayPets";
	}

}
