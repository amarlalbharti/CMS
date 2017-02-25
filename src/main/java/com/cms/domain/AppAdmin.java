
package com.cms.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="appAdmin")
public class AppAdmin implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4196353179708807440L;
	
	private int adminId;
	
	private String adminDesc;
	
	private String abc;
	
	
	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	
		
	@Column(nullable=false)
	public String getAdminDesc() {
		return adminDesc;
	}
	public void setAdminDesc(String adminDesc) {
		this.adminDesc = adminDesc;
	}
	
	@Column
	public String getAbc() {
		return abc;
	}
	public void setAbc(String abc) {
		this.abc = abc;
	}
	
	
}
