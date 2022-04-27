package com.skilldistillery.petsleuth.data;


import com.skilldistillery.petsleuth.entities.Location;
import com.skilldistillery.petsleuth.entities.User;




public interface LocationDAO {
	
	Location findLocationById(int locationId);
	
	Location createNewLocation(Location location, int locationId, User user);
	
	Location findExistingLocation(String city, String state);
	
	Location updateLocation(int locationId, Location location);
	
	boolean deleteLocation(Integer id);
	
	public User findUserById(int userId);
	
}
