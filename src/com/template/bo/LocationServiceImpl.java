package com.template.bo;

import java.util.List;

import com.template.dao.LocationDao;
import com.template.vo.CityVO;
import com.template.vo.RegionVO;
import com.template.vo.StateVO;

public class LocationServiceImpl implements LocationService{

	LocationDao locationDao;
	
	public StateVO findStateById(final int id){
		return locationDao.findStateById(id);
	}
	public List<StateVO> getAllStateVOs() {
		return locationDao.getAllStateVOs();
	}
	public void insertStateVO(final StateVO stateVO) {
		locationDao.insertStateVO(stateVO);
	}
	public void removeStateVO(final StateVO stateVO) {
		locationDao.removeStateVO(stateVO);
	}
	public void updateStateVO(final StateVO stateVO) {
		locationDao.updateStateVO(stateVO);
	}
	
	public RegionVO findRegionById(final int id){
		return locationDao.findRegionById(id);
	}
	public List<RegionVO> getAllRegionVOs() {
		return locationDao.getAllRegionVOs();
	}
	public 	List<RegionVO> getAllRegionByState(int idState){
		return locationDao.getAllRegionByState(idState);

	}
	public void insertRegionVO(final RegionVO regionVO) {
		locationDao.insertRegionVO(regionVO);
	}
	public void removeRegionVO(final RegionVO regionVO) {
		locationDao.removeRegionVO(regionVO);
	}
	public void updateRegionVO(final RegionVO regionVO) {
		locationDao.updateRegionVO(regionVO);
	}
		
	public CityVO findCityById(final int id){
		return locationDao.findCityById(id);
	}
	public List<CityVO> getAllCityVOs() {
		return locationDao.getAllCityVOs();
	}
	public List<CityVO> getAllCityByRegion(int idRegion){
		return locationDao.getAllCityByRegion(idRegion);
	}
	public void insertCityVO(final CityVO cityVO) {
		locationDao.insertCityVO(cityVO);
	}
	public void removeCityVO(final CityVO cityVO) {
		locationDao.removeCityVO(cityVO);
	}
	public void updateCityVO(final CityVO cityVO) {
		locationDao.updateCityVO(cityVO);
	}
	
	public void setLocationDao(final LocationDao locationDao) {
		this.locationDao = locationDao;
	}
}
