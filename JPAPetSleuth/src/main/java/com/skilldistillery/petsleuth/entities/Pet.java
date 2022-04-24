package com.skilldistillery.petsleuth.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Pet {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String species;
	
	private String name;
	
	private String breed;

	private String description;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	private Boolean chip;
	
	private String color;
	
	private String gender;

	private Boolean neutered;
	
	private String age;
	
	@OneToMany(mappedBy = "petId")
	private List<PetPhoto> photos;

	//Default Constructor
	public Pet() {
		super();
	}

	//Getters and Setters
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getSpecies() {
		return species;
	}


	public void setSpecies(String species) {
		this.species = species;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBreed() {
		return breed;
	}


	public void setBreed(String breed) {
		this.breed = breed;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Boolean getChip() {
		return chip;
	}


	public void setChip(Boolean chip) {
		this.chip = chip;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public Boolean getNeutered() {
		return neutered;
	}


	public void setNeutered(Boolean neutered) {
		this.neutered = neutered;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Pet [id=" + id + ", species=" + species + ", name=" + name + ", breed=" + breed + ", description="
				+ description + ", chip=" + chip + ", color=" + color + ", gender=" + gender + ", neutered=" + neutered
				+ ", age=" + age + ", user=" + user + "]";
	}

	//hashCode & equals
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pet other = (Pet) obj;
		return id == other.id;
	}
	
	
	
}


