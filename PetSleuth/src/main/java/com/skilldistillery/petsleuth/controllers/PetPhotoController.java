package com.skilldistillery.petsleuth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.petsleuth.data.PetPhotoDAO;
import com.skilldistillery.petsleuth.entities.PetPhoto;
import com.skilldistillery.petsleuth.entities.User;

@Controller
public class PetPhotoController {
	
	@Autowired
	private PetPhotoDAO petPhotoDao;
	
//	@RequestMapping( path = {"displayPetPhotos.do"})
//	public String displayPetPhotos(Model model, HttpSession session) {
//		User user = (User)session.getAttribute("user");
//		model.addAttribute("user", session.getAttribute("user"));
//		model.addAttribute("petPhotos", petPhotoDao.findByUserId(user.getId()));
//		return "displayPets";
//		
//	}	
//	
//	@RequestMapping( path = {"updatePetPhoto.do"}, method = RequestMethod.POST)
//	public String updatePetPhoto(int petPhotoId, Model model, HttpSession session, PetPhoto petPhoto) {
//		User user = (User)session.getAttribute("user");
//		model.addAttribute("user", session.getAttribute("user"));
//		model.addAttribute("petPhoto", petPhotoDao.updatePetPhoto(petPhotoId, petPhoto));
//		return "displayPet";
//		
//	}	
//
//	
//	@RequestMapping(path = {"hidePetPhoto.do"})
//	public String hidePetPhoto(Integer petPhotoId, Model model, HttpSession session) {
//		petPhotoDao.removePetPhoto(petPhotoId);
//		User user = (User)session.getAttribute("user");
//		//model.addAttribute("user", session.getAttribute("user"));
//		model.addAttribute("petPhotos", petPhotoDao.findByUserId(user.getId()));
////		model.addAttribute("petPhoto", petPhoto);
//		return "displayPets";
//	}
}
