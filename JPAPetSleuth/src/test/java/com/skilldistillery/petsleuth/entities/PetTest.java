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
	@DisplayName("Testing basic pet mapping")
	void test() {
		/*
		 * SELECT * FROM pet where id = 1;
+----+---------+------+-------+-------------+---------+------+-------+--------+----------+------+
| id | species | name | breed | description | user_id | chip | color | gender | neutered | age  |
+----+---------+------+-------+-------------+---------+------+-------+--------+----------+------+
|  1 | Dog     | Max  | NULL  | NULL        |       1 | NULL | NULL  | NULL   |     NULL | NULL |
		 */
		assertNotNull(pet);
		assertEquals("Dog",pet.getSpecies());
		assertEquals("Max",pet.getName());
		
		;
	}

}
