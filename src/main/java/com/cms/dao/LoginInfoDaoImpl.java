package com.cms.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.cms.domain.LoginInfo;

@Repository
public class LoginInfoDaoImpl implements LoginInfoDao 
{
	@Autowired private SessionFactory sessionFactory;
	
	public boolean addLoginInfo(LoginInfo loginInfo)
	{
		//BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//loginInfo.setPassword(loginInfo.getPassword());
		try 
		{
			this.sessionFactory.getCurrentSession().save(loginInfo);
			this.sessionFactory.getCurrentSession().flush();
			loginInfo.getRegistration().setLog(loginInfo);
			this.sessionFactory.getCurrentSession().save(loginInfo.getRegistration());
			this.sessionFactory.getCurrentSession().flush();
			return true;
		}
		catch (Exception e) 
		{
			try
			{
				this.sessionFactory.getCurrentSession().delete(loginInfo.getRegistration());
				this.sessionFactory.getCurrentSession().delete(loginInfo);
				e.printStackTrace();
			}
			catch (Exception e2) 
			{
				e2.printStackTrace();
			}
		}
		return false;
	}
	
	
	@SuppressWarnings("unchecked")
	public LoginInfo getLoginInfoByUserid(String userid)
	{
		try
		{
			List<LoginInfo> list = this.sessionFactory.getCurrentSession().createCriteria(LoginInfo.class)
					.add(Restrictions.eq("userId", userid)).list();
			if(!list.isEmpty())
			{
				return list.get(0);
			}
		}
		catch(Exception ee)
		{
			ee.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public String changeUserPassword(String userid, String oldPassword, String newPassword)
	{
		String status = "";
		try 
		{
			List<LoginInfo> list = this.sessionFactory.getCurrentSession().createCriteria(LoginInfo.class)
					.add(Restrictions.eq("userId", userid)).list();
			if(list != null && !list.isEmpty())
			{
				LoginInfo loginInfo = list.get(0);
				if(oldPassword.equals(loginInfo.getPassword()))
				{
					//BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
					//String hashedPassword = passwordEncoder.encode(newPassword);
					loginInfo.setPassword(newPassword);
					
					this.sessionFactory.getCurrentSession().update(loginInfo);
					this.sessionFactory.getCurrentSession().flush();
					return "success";
				}
				return "notmatch";
			}
			status = "notexist";
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public boolean updateLoginInfo(LoginInfo loginInfo)
	{
		try 
		{
			this.sessionFactory.getCurrentSession().update(loginInfo);
			this.sessionFactory.getCurrentSession().flush();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	public boolean resetPassword(String userid, String newPassword)
	{
		try 
		{
			List<LoginInfo> list = this.sessionFactory.getCurrentSession().createCriteria(LoginInfo.class)
					.add(Restrictions.eq("userId", userid)).list();
			if(list != null && !list.isEmpty())
			{
				LoginInfo loginInfo = list.get(0);
				loginInfo.setForgotpwdid(null);
				//BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				//String hashedPassword = passwordEncoder.encode(newPassword);
				loginInfo.setPassword(newPassword);
				this.sessionFactory.getCurrentSession().update(loginInfo);
				this.sessionFactory.getCurrentSession().flush();
			}
			return true;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}

}
