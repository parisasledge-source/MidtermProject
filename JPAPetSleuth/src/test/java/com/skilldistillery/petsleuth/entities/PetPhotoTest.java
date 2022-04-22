package com.skilldistillery.petsleuth.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
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
	void test() {
		assertNotNull(petPhoto);
	}

}