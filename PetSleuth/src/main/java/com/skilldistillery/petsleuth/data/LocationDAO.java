package com.skilldistillery.petsleuth.data;


import com.skilldistillery.petsleuth.entities.Location;




public interface LocationDAO {
	
	Location findLocationById(int locationId);
	
	Location createNewLocation(Location location);
	
	Location findExistingLocation(String city, String state);
	
	Location updateLocation(int locationId, Location location);
	
}
