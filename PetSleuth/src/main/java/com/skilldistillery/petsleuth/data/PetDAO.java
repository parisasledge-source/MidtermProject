package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.PetPhoto;

public interface PetDAO {

	List<Pet> findByUserId(int userId);

	public boolean hide(Integer id);

	public Pet updatePet(int petId, Pet pet);
	
	public void addPetPhoto(int petId, PetPhoto petPhoto);
	
	
}
