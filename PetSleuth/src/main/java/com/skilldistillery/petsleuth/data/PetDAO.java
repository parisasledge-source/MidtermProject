package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.Pet;

public interface PetDAO {

	List<Pet> findByUserId(int userId);

	public boolean hide(Integer id);

	Pet updatePet(int petId, Pet pet);
}
