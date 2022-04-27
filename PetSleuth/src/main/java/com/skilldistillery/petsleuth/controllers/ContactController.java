package com.skilldistillery.petsleuth.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String addContact(Model model, Contact contact, HttpSession session, int userId, RedirectAttributes redir) {
		User newUser = (User)session.getAttribute("user");
		contact.setUser(newUser);
		redir.addFlashAttribute("contact", contactDao.addContact(contact, userId));
		return "redirect:addContactRedir.do";
	}
	
	@RequestMapping( path = {"addContactRedir.do"}, method = RequestMethod.GET)
	public String addContactRedir() {
		return "contactResult";
	}

	@RequestMapping( path = {"displayContact.do"})
	public String displayContact(Model model, HttpSession session, Integer id) {
		model.addAttribute("user", session.getAttribute("user"));
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
	public String updateContact(Integer userId, Model model, HttpSession session, Contact contact, RedirectAttributes redir) {
		User user = (User) session.getAttribute("user");
		redir.addFlashAttribute("user", session.getAttribute("user"));
		redir.addFlashAttribute("contact", contactDao.updateContact(userId, contact));
		return "redirect:updateContactRedir.do";
	}
	
	@RequestMapping( path = {"updateContactRedir.do"}, method = RequestMethod.GET)
	public String updateContactRedir() {
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
