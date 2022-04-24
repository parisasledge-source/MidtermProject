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

class PetTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Pet pet;

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
		   pet = em.find(Pet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pet = null;
	}

	@Test
	@DisplayName("Testing basic Pet mapping")
	void test() {
		/*
		 * SELECT * FROM pet where id = 1;
+----+---------+------+-------+-------------+---------+------+-------+--------+----------+------+
| id | species | name | breed | description | user_id | chip | color | gender | neutered | age  |
+----+---------+------+-------+-------------+---------+------+-------+--------+----------+------+
|  1 | Dog     | Max  | NULL  | NULL        |       1 | NULL | NULL  | NULL   |     NULL | NULL |
		 */
		assertNotNull(pet);
		assertEquals("Dog", pet.getSpecies());
		assertEquals("Max", pet.getName());
	}
	
	@Test
	@DisplayName("Testing Pet to User ManyToOne mapping")
	void test2() {
		/*
		 * SELECT username FROM user JOIN pet ON user.id = pet.user_id WHERE pet.id = 1;
+----------+
| username |
+----------+
| jiles    |
+----------+
		 */
		assertNotNull(pet);
		assertEquals("jiles", pet.getUser().getUsername());
	}

	@Test
	@DisplayName("Testing Pet to PetPhoto OneToMany mapping")
	void test3() {
		/*
		 * SELECT * FROM pet_photo WHERE id = 1;
+----+---------------------------------------------------------------------------------------------------------------------------------------------+-------------+---------------------+--------+
| id | photo_url                                                                                                                                   | description | date_added          | pet_id |
+----+---------------------------------------------------------------------------------------------------------------------------------------------+-------------+---------------------+--------+
|  1 | https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2016/06/24151048/Beagle-standing-in-a-frosty-field-on-a-cold-morning.jpg | beagel      | 2022-04-20 00:00:00 |      1 |
+----+---------------------------------------------------------------------------------------------------------------------------------------------+-------------+---------------------+--------+
		 */
		assertNotNull(pet);
		assertNotNull(pet.getPhotos());
		assertTrue(pet.getPhotos().size() > 0);
	}
	
	@Test
	@DisplayName("Testing Pet to Post OneToMany mapping")
	void test4() {
		/*
		 * SELECT description FROM post WHERE id = 1;
+-------------------------------------------------+
| description                                     |
+-------------------------------------------------+
| My dog got out of the house and hasn't returned |
+-------------------------------------------------+
		 */
		assertNotNull(pet);
		assertNotNull(pet.getPosts());
		assertTrue(pet.getPosts().size() > 0);
	}
	
}
