package com.template.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.LocationService;
import com.template.vo.CityVO;
import com.template.vo.RegionVO;
import com.template.vo.StateVO;

public class LocationInfoAction extends ActionSupport  {
	
	public LocationService getLocationServiceBean() {
		return locationServiceBean;
	}
	public void setLocationServiceBean(LocationService locationServiceBean) {
		this.locationServiceBean = locationServiceBean;
	}
	public List<StateVO> getListS() {
		return listS;
	}
	public void setListS(List<StateVO> listS) {
		this.listS = listS;
	}
	public List<RegionVO> getListR() {
		return listR;
	}
	public void setListR(List<RegionVO> listR) {
		this.listR = listR;
	}
	public List<CityVO> getListC() {
		return listC;
	}
	public void setListC(List<CityVO> listC) {
		this.listC = listC;
	}
	LocationService locationServiceBean;
	StateVO stateVO=new StateVO();
	RegionVO regionVO=new RegionVO();
	CityVO cityVO=new CityVO();
	
	private List<StateVO> listS;
	private List<RegionVO> listR;
	private List<CityVO> listC;
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	private static final long serialVersionUID = 1L;
	
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	public int getRegionId() {
		return regionId;
	}
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}
	
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	private String state;
	private int stateId;
	private String region;
	private int regionId;
	private String city;
	private int cityId;
	
	public String populate(){				

		listS=locationServiceBean.getAllStateVOs();	

		return "populate";
	}
	
	public String populateR(){				
		
		listR = locationServiceBean.getAllRegionByState(stateId);

		return "populateR";
	}
	
	public String populateC(){				

		listC=locationServiceBean.getAllCityByRegion(regionId);		

		return "populateC";
	}

	@Override
	public String execute() {

		stateVO.setNameState(state);	
		stateVO.setStateId(stateId);	
		regionVO.setNameRegion(region);
		regionVO.setRegionId(regionId);
		cityVO.setNameCity(city);
		cityVO.setCityId(cityId);
				
		locationServiceBean.insertStateVO(stateVO);
		locationServiceBean.insertRegionVO(regionVO);
		locationServiceBean.insertCityVO(cityVO);

		return SUCCESS;
	}

}
