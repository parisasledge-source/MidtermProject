package com.skilldistillery.petsleuth.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ContactTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Contact contact;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		 emf = Persistence.createEntityManagerFactory("JPAPetSleuth");

	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		 emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		   em = emf.createEntityManager();
		   contact = em.find(Contact.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		contact = null;
	}

	@Test
	@DisplayName("Testing SQL connection")
	void test() {

//		mysql> SELECT * FROM contact;
//		+----+--------------------+-------+--------------+---------+--------------+
//		| id | contact_preference | email | phone_number | user_id | contact_info |
//		+----+--------------------+-------+--------------+---------+--------------+
//		|  1 | phone              | NULL  | NULL         |       1 | NULL         |
//		+----+--------------------+-------+--------------+---------+--------------+
		
		assertNotNull(contact);
		assertEquals("phone", contact.getContacPreference());
		assertEquals("admin", contact.getEmail());
		assertEquals(null, contact.getPhotoNumber());
		assertEquals(null, contact.getContactInfo());
		
	}
}
