package com.cms.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="priority")
public class Priority implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7633173125117321490L;

	private int priorityId;
	
	private String priorityName;

	
	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getPriorityId() {
		return priorityId;
	}

	public void setPriorityId(int priorityId) {
		this.priorityId = priorityId;
	}

	
	@Column(nullable=false)
	public String getPriorityName() {
		return priorityName;
	}

	public void setPriorityName(String priorityName) {
		this.priorityName = priorityName;
	}
	
	
	
	
	
	
	

}
