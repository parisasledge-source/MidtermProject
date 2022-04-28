package com.skilldistillery.petsleuth.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.PetPhoto;

@Service
@Transactional
public class PetDaoImpl implements PetDAO {
	
	@PersistenceContext
	private EntityManager em;

	
	@Override
	public List<Pet> findByUserId(int userId) {
		
		String sql = "SELECT pet FROM Pet pet WHERE pet.user.id = :userId";
		List<Pet> pets = em.createQuery(sql, Pet.class).setParameter("userId", userId).getResultList();
		return pets;
	}


	@Override
	public boolean hide(Integer id) {
		boolean removePet = false;
		Pet deactivatedPet = em.find(Pet.class, id);
		if (deactivatedPet.getActive()) {
			deactivatedPet.setActive(false);
		}
		return removePet;
	}

	@Override
	public Pet updatePet(int petId, Pet pet) {
		
		Pet updatePet = em.find(Pet.class, petId);
		
		updatePet.setSpecies(pet.getSpecies());
		updatePet.setName(pet.getName());
		updatePet.setBreed(pet.getBreed());
		updatePet.setDescription(pet.getDescription());
		updatePet.setChip(pet.getChip());
		updatePet.setColor(pet.getColor());
		updatePet.setGender(pet.getGender());
		updatePet.setNeutered(pet.getNeutered());
		updatePet.setAge(pet.getAge());
		updatePet.setPhotos(findPetPhotoById(petId));
		
		return updatePet;
		
	}
	
	public List<PetPhoto> findPetPhotoById(int petId) {

		String sql = "SELECT pp FROM PetPhoto pp WHERE pp.pet.id = :id";

		List<PetPhoto> photos = em.createQuery(sql, PetPhoto.class).setParameter("id", petId).getResultList();
		
		return photos;
	}


	@Override
	public void addPetPhoto(int petId, PetPhoto petPhoto) {
		Pet pet = em.find(Pet.class, petId);
//		pet.addPetPhoto(petPhoto);
		petPhoto.setPet(pet);
		em.persist(petPhoto);
	}

	
	@Override
	public PetPhoto updatePetPhoto(int petPhotoId, PetPhoto petPhoto) {
		
		PetPhoto updatePetPhoto = em.find(PetPhoto.class, petPhotoId);
		
		updatePetPhoto.setPhotoUrl(petPhoto.getPhotoUrl());
		
		return updatePetPhoto;
		
	}
	

}
