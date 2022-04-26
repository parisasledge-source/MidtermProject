package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.Contact;

public interface ContactDAO {

	public List<Contact> findByUserId(int userId);
	
	public boolean destroyContact(int contactId);
	
	Contact updateContact(int contactId, Contact contact);

	Contact addContact(Contact contact, int userId);

}
