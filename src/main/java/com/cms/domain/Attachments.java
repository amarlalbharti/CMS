package com.cms.domain;

import java.io.File;

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
@Table(name="attachments")
public class Attachments {
	
	private int attachmentId;
	
	private File attachment;
	
	private ComplainDetail complainDetatil;

	
	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(int attachmentId) {
		this.attachmentId = attachmentId;
	}

	
	@Column
	public File getAttachment() {
		return attachment;
	}

	public void setAttachment(File attachment) {
		this.attachment = attachment;
	}

	
	@ManyToOne(cascade=CascadeType.ALL) 
	@JoinColumn(name="tokenNumber", referencedColumnName="tokenNumber")
	public ComplainDetail getComplainDetatil() {
		return complainDetatil;
	}

	public void setComplainDetatil(ComplainDetail complainDetatil) {
		this.complainDetatil = complainDetatil;
	}
	
	
	
	

}
