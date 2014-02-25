package com.template.bo;

import java.util.List;

import com.template.vo.CityVO;
import com.template.vo.RegionVO;
import com.template.vo.StateVO;

public interface LocationService {

	StateVO findStateById(int id);	
	void insertStateVO(StateVO stateVO);
	void updateStateVO(StateVO stateVO);
	void removeStateVO(StateVO stateVO);
	List<StateVO> getAllStateVOs();
	
	RegionVO findRegionById(int id);	
	void insertRegionVO(RegionVO regionVO);
	void updateRegionVO(RegionVO regionVO);
	void removeRegionVO(RegionVO regionVO);
	List<RegionVO> getAllRegionVOs();
	List<RegionVO> getAllRegionByState(int idState);
	
	CityVO findCityById(int id);	
	void insertCityVO(CityVO cityVO);
	void updateCityVO(CityVO cityVO);
	void removeCityVO(CityVO cityVO);
	List<CityVO> getAllCityVOs();
	List<CityVO> getAllCityByRegion(int idRegion);
}
