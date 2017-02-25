package com.cms.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="complaintype")
public class ComplainType implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2023937888485263279L;

	private int typeId;
	
	private String complainType;
	
	private String complainDesc;
	
	private String remark;

	
	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	@Column(nullable=false)
	public String getComplainType() {
		return complainType;
	}

	public void setComplainType(String complainType) {
		this.complainType = complainType;
	}

	@Column
	public String getComplainDesc() {
		return complainDesc;
	}

	public void setComplainDesc(String complainDesc) {
		this.complainDesc = complainDesc;
	}

	@Column
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	

}
