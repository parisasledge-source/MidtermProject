package com.skilldistillery.petsleuth.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PetPhotoTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PetPhoto petPhoto;

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
		petPhoto = em.find(PetPhoto.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		petPhoto = null;
	}

	@Test
	@DisplayName("Testing basic PetPhoto mapping")
	void test() {
	/*
	 * SELECT id, description, date_added, pet_id  FROM pet_photo WHERE id = 1;
+----+-------------+---------------------+--------+
| id | description | date_added          | pet_id |
+----+-------------+---------------------+--------+
|  1 | beagel      | 2022-04-20 00:00:00 |      1 |
+----+-------------+---------------------+--------+
	 */
		assertNotNull(petPhoto);
		assertEquals("beagel", petPhoto.getDescription());
	}
	
	@Test
	@DisplayName("Testing PetPhoto to Pet ManyToOne mapping")
	void test2() {
		/*
		 * SELECT pet.id FROM pet JOIN pet_photo ON pet.id = pet_photo.pet_id WHERE pet_photo.id = 1;
+----+
| id |
+----+
|  1 |
+----+
		 */
		assertNotNull(petPhoto);
		assertEquals(1, petPhoto.getPetId().getId());
	}

}
