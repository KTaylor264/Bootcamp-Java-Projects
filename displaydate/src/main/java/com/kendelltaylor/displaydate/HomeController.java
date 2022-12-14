package com.kendelltaylor.displaydate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String home()
	{
		   return "index.jsp";
	}
	
	@RequestMapping("/date")
	public String date(Model model)
	{
		String day = "Saturday";
		String date = "22";
		String month = "January";
		String year = "2028";
		
		model.addAttribute("day", day);
		model.addAttribute("date", date);
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		
		return "date.jsp";
	}
	
	@RequestMapping("/time")
	public String time(Model model)
	{
		String time = "11:30 PM";
		
		model.addAttribute("time", time);
		
		return "time.jsp";
	}
}
