package com.cms.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="atlevel")
public class AtLevel implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3014744282457154633L;

	private int levelId;
	
	private String atLevel;
	
	private Module module;

	private Date createDate;
	
	private Date updatedDate;
	
	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

	
	@Column(nullable=false)
	public String getAtLevel() {
		return atLevel;
	}

	public void setAtLevel(String atLevel) {
		this.atLevel = atLevel;
	}

	
	@Column
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	
	@ManyToOne(cascade=CascadeType.ALL) 
	@JoinColumn(name="moduleId", referencedColumnName="moduleId")
	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}
	
	@Column
	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}


}
