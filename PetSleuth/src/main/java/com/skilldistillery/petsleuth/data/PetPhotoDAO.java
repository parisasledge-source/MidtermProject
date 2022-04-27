package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.PetPhoto;

public interface PetPhotoDAO {

	
	List<PetPhoto> findByUserId(int userId);

//	public boolean hide(Integer id);
	
	
	public void removePetPhoto(Integer petPhotoId);

	PetPhoto updatePetPhoto(int petPhotoId, PetPhoto petPhoto);

}
