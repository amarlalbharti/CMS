package com.cms.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="complaindetail")
public class ComplainDetail implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1631305441313030934L;

	private int complainId;
	
	private String status;
	
	private Date createDate;
	
	private Date updatedDate;
	
	private String tokenNumber;
	
	private String subject;
	
	private String remark;
	
	private AtLevel atLevel;
	
	private Set<Attachments> attachments = new HashSet<Attachments>();

	@Id
	@Column(nullable=false, name="complainId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getComplainId() {
		return complainId;
	}

	public void setComplainId(int complainId) {
		this.complainId = complainId;
	}

	@Column(name="status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Column
	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	@Column
	public String getTokenNumber() {
		return tokenNumber;
	}

	public void setTokenNumber(String tokenNumber) {
		this.tokenNumber = tokenNumber;
	}

	@Column
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Column
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="levelId", referencedColumnName="levelId")
	public AtLevel getAtLevel() {
		return atLevel;
	}

	public void setAtLevel(AtLevel atLevel) {
		this.atLevel = atLevel;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="complainDetatil" ) 
	public Set<Attachments> getAttachments() {
		return attachments;
	}

	public void setAttachments(Set<Attachments> attachments) {
		this.attachments = attachments;
	}


	
	
}
