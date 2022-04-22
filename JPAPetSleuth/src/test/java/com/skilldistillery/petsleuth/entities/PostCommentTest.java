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

class PostCommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PostComment postComment;
	
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
		postComment = em.find(PostComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		postComment = null;
	}

	@Test
	void test() {
		fail("Not yet implemented");
	}

}
