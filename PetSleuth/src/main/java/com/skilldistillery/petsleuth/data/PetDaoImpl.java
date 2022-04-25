package com.skilldistillery.petsleuth.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class PetDaoImpl implements PetDAO {
	
	@PersistenceContext
	private EntityManager em;

}
