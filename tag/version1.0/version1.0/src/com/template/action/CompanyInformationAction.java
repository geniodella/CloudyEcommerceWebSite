package com.template.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.CompanyInformationService;
import com.template.vo.CompanyInformationVO;

public class CompanyInformationAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	CompanyInformationService companyInformationServiceBean;
	
	CompanyInformationVO companyInformationVO;

	public CompanyInformationService getCompanyInformationServiceBean() {
		return companyInformationServiceBean;
	}

	public void setCompanyInformationServiceBean(
			CompanyInformationService companyInformationServiceBean) {
		this.companyInformationServiceBean = companyInformationServiceBean;
	}
	
	private int idCompanyInformation;
	private String name;
	private String address;
	private String piva;
	private String phone;
	private String email;
	private String postalCode;
	private String city;
	private boolean success=true;
	
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public CompanyInformationVO getCompanyInformationVO() {
		return companyInformationVO;
	}

	public void setCompanyInformationVO(CompanyInformationVO companyInformationVO) {
		this.companyInformationVO = companyInformationVO;
	}

	public int getIdCompanyInformation() {
		return idCompanyInformation;
	}

	public void setIdCompanyInformation(int idCompanyInformation) {
		this.idCompanyInformation = idCompanyInformation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPiva() {
		return piva;
	}

	public void setPiva(String piva) {
		this.piva = piva;
	}



	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	private List<CompanyInformationVO> lista;

	public List<CompanyInformationVO> getLista() {
		return lista;
	}
	public void setLista(List<CompanyInformationVO> lista) {
		this.lista = lista;
	}
	
	

	
	public String populate(){
		lista=companyInformationServiceBean.getAllCompanyInformationVOs();
		
		
		return "populate";
	}
		
	
	public String execute(){

		companyInformationVO=companyInformationServiceBean.findCompanyInformationById(1);
		
		if(companyInformationVO!=null)		
			update();	
		
		companyInformationVO=new CompanyInformationVO();
		companyInformationVO.setName(name);
		companyInformationVO.setAddress(address);
		companyInformationVO.setEmail(email);
		companyInformationVO.setPiva(piva);
		companyInformationVO.setPhone(phone);
		companyInformationVO.setCity(city);
		companyInformationVO.setPostalCode(postalCode);
		companyInformationVO.setIdCompanyInformation(1);
		
		
		companyInformationServiceBean.insertCompanyInformationVO(companyInformationVO);
				
		return SUCCESS;
		
	}
	
	public String selectById(){		
	
			companyInformationVO=companyInformationServiceBean.findCompanyInformationById(1);
										
		return "selectById";		
		
	}
	
	public String update(){
		
		companyInformationVO.setName(name);
		companyInformationVO.setAddress(address);
		companyInformationVO.setEmail(email);
		companyInformationVO.setPiva(piva);
		companyInformationVO.setPhone(phone);
		companyInformationVO.setCity(city);
		companyInformationVO.setPostalCode(postalCode);
		companyInformationVO.setIdCompanyInformation(1);
		companyInformationServiceBean.updateCompanyInformation(companyInformationVO);
		
		return "update";
		
	}

	public String dareNome(){
		
		lista = new ArrayList();
		
		companyInformationVO=companyInformationServiceBean.findCompanyInformationById(1);
		
		lista.add(companyInformationVO);
		
		
		return "dareNome";
		
	}
}
