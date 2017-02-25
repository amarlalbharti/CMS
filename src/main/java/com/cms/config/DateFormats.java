package com.cms.config;
import java.text.SimpleDateFormat;



public class DateFormats
{
	
	public static SimpleDateFormat ddMMyyyy()
	{
		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		return df;
	}
	
	
	public static SimpleDateFormat ddMMMyyyy()
	{
		SimpleDateFormat df = new SimpleDateFormat("dd MMM yyyy");
		return df;
	}
	
	
	public static SimpleDateFormat fullformat()
	{
		SimpleDateFormat df = new SimpleDateFormat("dd MM yyyy 'at' hh:mm a");
		return df;
	}
	
	
	public static SimpleDateFormat fullformat2()
	{
		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
		return df;
	}
	
	
	public static SimpleDateFormat timeformat()
	{
		SimpleDateFormat df = new SimpleDateFormat("hh:mm a");
		return df;
	}
	
	
	public static SimpleDateFormat monthformat()
	{
		SimpleDateFormat df = new SimpleDateFormat("MM-yyyy");
		return df;
	}
	
	
	public static SimpleDateFormat MMMformat()
	{
		SimpleDateFormat df = new SimpleDateFormat("MMM yyyy");
		return df;
	}
	
	public static SimpleDateFormat ddMMMformat()
	{
		SimpleDateFormat df = new SimpleDateFormat("dd MMM");
		return df;
	}
	
	public static SimpleDateFormat yyyyMMdd()
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df;
	}
	
	
	public static String getMonthName(int month)
	{
		String monthName = "";
		switch (month) {
		case 1:
			monthName = "January";
			break;
		case 2:
			monthName = "February";
			break;
		case 3:
			monthName = "March";
			break;
		case 4:
			monthName = "April";
			break;
		case 5:
			monthName = "May";
			break;
		case 6:
			monthName = "June";
			break;
		case 7:
			monthName = "July";
			break;
		case 8:
			monthName = "August";
			break;
		case 9:
			monthName = "September";
			break;
		case 10:
			monthName = "October";
			break;
		case 11:
			monthName = "November";
			break;
		case 12:
			monthName = "December";
			break;

		default:
			monthName = "NA";
			break;
		}
		
		return monthName;
	}
	
}
