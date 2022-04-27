package com.skilldistillery.petsleuth.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.PetPhoto;

@Service
@Transactional
public class PetPhotoDaoImpl implements PetPhotoDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<PetPhoto> findByUserId(int userId) {
		String sql = "SELECT p FROM PetPhoto p WHERE p.pet.user.id = :userId";
		List<PetPhoto> petPhotos = em.createQuery(sql, PetPhoto.class).setParameter("userId", userId).getResultList();
		return petPhotos;
	}
	
	@Override
	public void removePetPhoto(Integer petPhotoId) {
		PetPhoto petPhoto = em.find(PetPhoto.class, petPhotoId);
		em.remove(petPhoto);
		
	}
	
//	@Override
//	public boolean hide(Integer id) {
//		PetPhoto deactivatedPetPhoto = em.find(PetPhoto.class, id);
//		if (deactivatedPetPhoto.getActive()) {
//			deactivatedPetPhoto.setActive(false);
//		}
//		return removePetPhoto;
//	}

	@Override
	public PetPhoto updatePetPhoto(int petPhotoId, PetPhoto petPhoto) {
		PetPhoto updatePetPhoto = em.find(PetPhoto.class, petPhotoId);
		
		updatePetPhoto.setPhotoUrl(petPhoto.getPhotoUrl());
		
		return updatePetPhoto;
		
	}

}
