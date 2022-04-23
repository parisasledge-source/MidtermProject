package com.skilldistillery.petsleuth.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("Testing SQL connection")
	void test() {

//		mysql> SELECT * FROM user;
//		+----+----------+----------+-------------+--------+------+------------+-----------+-----------+-----------+
//		| id | username | password | location_id | active | role | first_name | last_name | biography | photo_url |
//		+----+----------+----------+-------------+--------+------+------------+-----------+-----------+-----------+
//		|  1 | admin    | admin    |           1 |      1 | NULL | NULL       | NULL      | NULL      | NULL      |
//		+----+----------+----------+-------------+--------+------+------------+-----------+-----------+-----------+

		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("admin", user.getPassword());
		assertTrue(user.isActive());
		assertEquals(null, user.getRole());
		assertEquals(null, user.getFirstName());
		assertEquals(null, user.getLastName());
		assertEquals(null, user.getBiography());
		assertEquals(null, user.getPhotoURL());
	}
	
	@Test
	@DisplayName("Testing relationship from User to Location")
	void test2() {

		assertNotNull(user.getLocation());
		assertEquals(1, user.getLocation().getId());
	}
	
	@Test
	@DisplayName("Testing relationship from User to Contact")
	void test3() {

		assertTrue(user.getContacts().size() > 0);
		assertEquals(1, user.getContacts().size());
	}
	
	@Test
	@DisplayName("Testing relationship from User to Pet")
	void test4() {

		assertTrue(user.getPets().size() > 0);
		assertEquals(1, user.getPets().size());
	}
	
	@Test
	@DisplayName("Testing relationship from User to Post")
	void test5() {

		assertTrue(user.getPosts().size() > 0);
		assertEquals(1, user.getPosts().size());
	}

}
