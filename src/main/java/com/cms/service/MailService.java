package com.cms.service;

public interface MailService {
	
			public boolean sendMail(String to,String recepients,String bcc,String subject, String content);
	
}
