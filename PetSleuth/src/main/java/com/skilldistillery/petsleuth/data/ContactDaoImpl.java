package com.skilldistillery.petsleuth.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.User;

@Service
@Transactional
public class ContactDaoImpl implements ContactDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Contact addContact(Contact contact, int userId) {
		contact.setUser(findUserById(userId));
		contact.setActive(true);
		em.persist(contact);
		em.flush();
		return contact;
	}
	
	@Override
	public List<Contact> findByUserId(int userId) {
		String query = "SELECT contact FROM Contact contact WHERE contact.user.id = :userId";
		List<Contact> contacts = em.createQuery(query, Contact.class).setParameter("userId", userId).getResultList();		
		return contacts;
	}

	@Override
	public boolean destroyContact(int contactId) {
		boolean removeContact = false;
		Contact deactivatedContact = em.find(Contact.class, contactId);
		if(deactivatedContact.getActive()) {
			deactivatedContact.setActive(false);
		}
		return removeContact;
	}

	@Override
	public Contact updateContact(int contactId, Contact contact) {
		Contact updateContact = em.find(Contact.class, contactId);
		updateContact.setContactPreference(contact.getContactPreference());
		updateContact.setContactInfo(contact.getContactInfo());
		updateContact.setEmail(contact.getEmail());
		updateContact.setPhoneNumber(contact.getPhoneNumber());
		return updateContact;
	}

	public User findUserById(int userId) {
		return em.find(User.class, userId);
	}
}
