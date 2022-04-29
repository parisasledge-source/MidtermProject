package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.Contact;

public interface ContactDAO {

	public List<Contact> findByUserId(Integer userId);
	
	public boolean destroyContact(int contactId);
	
	public Contact updateContact(Integer contactId, Contact contact);

	public Contact addContact(Contact contact, int userId);

	public Contact findContactById(Integer contactId);

}
