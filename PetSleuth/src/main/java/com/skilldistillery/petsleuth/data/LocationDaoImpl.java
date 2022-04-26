package com.skilldistillery.petsleuth.data;





import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Location;



@Service
@Transactional
public class LocationDaoImpl implements LocationDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Location findLocationById(int locationId) {	
		return em.find(Location.class, locationId);
		}

	@Override
	public Location createNewLocation(Location location) {
		Location newLocation = location;
		em.persist(newLocation);
		return newLocation;
	}

	@Override
	public Location findExistingLocation(String city, String state) {
		String sql = "SELECT location FROM Location location WHERE location.city = :city AND location.state = :state ";
		Location location = em.createQuery(sql, Location.class).setParameter("city", city).setParameter("state", state).getSingleResult();
		return location;
	}
	
	@Override
	public Location updateLocation(int locationId, Location location) {
		Location updateLocation = em.find(Location.class, locationId);
		updateLocation.setState(location.getState());
		updateLocation.setCity(location.getCity());
		updateLocation.setStreet(location.getStreet());
		updateLocation.setZipcode(location.getZipcode());
		
		
		return updateLocation;
	}

	@Override
	public boolean deleteLocation(Integer id) {
		boolean removeLocation = false;
		Location deactivatedLocation = em.find(Location.class, id);
		if(deactivatedLocation.getActive()) {
			deactivatedLocation.setActive(false);
		}
		return removeLocation;
	}
	
}
