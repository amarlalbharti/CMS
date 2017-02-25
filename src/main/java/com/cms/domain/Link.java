package com.cms.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="link")
public class Link implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3957330286594584723L;

	private int linkId;
	
	private String linkName;
	
	private String userType;
	
	@Column
	private String newonecol; 
	
	@Column
	private String newcol;
	
	@Column
	private String newcoltwo;

	
	
	public String getNewonecol() {
		return newonecol;
	}

	public void setNewonecol(String newonecol) {
		this.newonecol = newonecol;
	}

	public String getNewcol() {
		return newcol;
	}

	public void setNewcol(String newcol) {
		this.newcol = newcol;
	}
	
	
	public String getNewcoltwo() {
		return newcoltwo;
	}

	public void setNewcoltwo(String newcoltwo) {
		this.newcoltwo = newcoltwo;
	}

	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getLinkId() {
		return linkId;
	}

	public void setLinkId(int linkId) {
		this.linkId = linkId;
	}

	@Column
	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	@Column
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
	

}
