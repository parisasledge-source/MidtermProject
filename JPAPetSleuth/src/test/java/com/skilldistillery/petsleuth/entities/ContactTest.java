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

//		SELECT * FROM contact WHERE id = 1;
//		+----+--------------------+--------------------+--------------+---------+--------------+
//		| id | contact_preference | email              | phone_number | user_id | contact_info |
//		+----+--------------------+--------------------+--------------+---------+--------------+
//		|  1 | email              | admin@fakemail.com | 303-555-3278 |       1 | NULL         |
//		+----+--------------------+--------------------+--------------+---------+--------------+	+----+--------------------+-------+--------------+---------+--------------+
		assertNotNull(contact);
		assertEquals("email", contact.getContactPreference());
		assertEquals("admin@fakemail.com", contact.getEmail());
		assertEquals("303-555-3278", contact.getPhoneNumber());
		assertEquals(null, contact.getContactInfo());

	}

	@Test
	@DisplayName("Testing Contact to User ManyToOne mapping")
	void test2() {
		/*
		 * SELECT username FROM user JOIN contact ON user.id = contact.user_id WHERE
		 * user.id = 1; +----------+ | username | +----------+ | admin | +----------+
		 */
		assertNotNull(contact);
		assertEquals("admin", contact.getUser().getUsername());
	}

	@Test
	@DisplayName("Testing Contact to Post OneToMany mapping")
	void test3() {
		/*
		 * SELECT description FROM post WHERE id = 1;
		 * +-------------------------------------------------+ | description |
		 * +-------------------------------------------------+ | My dog got out of the
		 * house and hasn't returned |
		 * +-------------------------------------------------+
		 */
		assertNotNull(contact);
		assertNotNull(contact.getPosts());
		assertTrue(contact.getPosts().size() > 0);
	}
}
