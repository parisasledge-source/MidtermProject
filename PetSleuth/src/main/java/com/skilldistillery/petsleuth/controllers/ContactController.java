package com.skilldistillery.petsleuth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.petsleuth.data.ContactDAO;
import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.User;

@Controller
public class ContactController {

	@Autowired
	private ContactDAO contactDao;
	
	@RequestMapping( path = {"contactPage.do"})
	public String user(Model model) {
		return "contact";
	}
	
	@RequestMapping( path = {"addContact.do"}, method = RequestMethod.POST)
	public String addContact(Model model, Contact contact, HttpSession session, int userId) {
		User newUser = (User)session.getAttribute("user");
		contact.setUser(newUser);
		model.addAttribute("contact", contactDao.addContact(contact, userId));
		return "contactResult";
	}

	@RequestMapping( path = {"displayContact.do"})
	public String displayContact(Model model, HttpSession session, Integer id) {
		model.addAttribute("user", session.getAttribute("user"));
		System.out.println(id+"*****************");
		model.addAttribute("contact", contactDao.findContactById(id));
		return "displayContact";
	}
	
	@RequestMapping(path = { "displayContacts.do" })
	public String displayContacts(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("contacts", contactDao.findByUserId(user.getId()));
		return "displayContacts";
	}

	@RequestMapping(path = { "updateContact.do" }, method = RequestMethod.POST)
	public String updateContact(int contactId, Model model, HttpSession session, Contact contact) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("contact", contactDao.updateContact(contactId, contact));
		return "displayContact";
	}

	@RequestMapping(path = { "destroyContact.do" })
	public String destroyContact(int contactId, Model model, HttpSession session) {
		boolean contact = contactDao.destroyContact(contactId);
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("contacts", contactDao.findByUserId(user.getId()));
		model.addAttribute("contact", contact);
		return "displayContacts";
	}

}
