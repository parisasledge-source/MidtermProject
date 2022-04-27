package com.skilldistillery.petsleuth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.petsleuth.data.PetDAO;
import com.skilldistillery.petsleuth.data.UserDAO;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.User;

@Controller
public class PetController {
	
	@Autowired
	private PetDAO petDao;
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping( path = {"petPage.do"})
	public String pet(Model model, HttpSession session) {
		User newUser = (User)session.getAttribute("user");
		
		return "pet";
		
	}	
	
	@RequestMapping( path = {"pet.do"}, method = RequestMethod.POST)
	public String home(Model model, Pet pet, HttpSession session, RedirectAttributes redir) {
		User newUser = (User)session.getAttribute("user");
		pet.setUser(newUser);
		redir.addFlashAttribute("pet", userDao.addPet(pet));
		
		return "redirect:petRedir.do";
	}
	
	@RequestMapping( path = {"petRedir.do"}, method = RequestMethod.GET)
	public String petRedir() {
		return "petResult";
	}
		
	@RequestMapping( path = {"displayPet.do"})
	public String displayPet(Model model, HttpSession session, int id) {
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("pet", userDao.findPetById(id));
		
		return "displayPet";
		
	}	
	
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
