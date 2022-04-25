package com.skilldistillery.petsleuth.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class PetPhotoDaoImpl implements PetPhotoDAO {
	
	@PersistenceContext
	private EntityManager em;

}
