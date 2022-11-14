package com.kendelltaylor.counter;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CounterController {

	@RequestMapping("/")
	public String welcome(HttpSession session)
	{
		if (session.getAttribute("count") == null)
		{
			session.setAttribute("count", 0);
		}
		else
		{
			try
			{
				int newValue = (int) session.getAttribute("count") + 1;
				session.setAttribute("count", newValue);
			}
			catch (Exception e)
			{
				System.out.println("It didn't work. This is the current value");
			}
		}
		
		return "index.jsp";
	}
	
	@RequestMapping("/counter")
	public String counter(HttpSession session)
	{	
		if (session.getAttribute("count") == null)
		{
			session.setAttribute("count", 0);
		}
		
		return "counter.jsp";
	}
}
