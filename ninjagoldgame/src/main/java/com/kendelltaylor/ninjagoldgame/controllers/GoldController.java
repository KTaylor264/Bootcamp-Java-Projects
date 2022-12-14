package com.kendelltaylor.ninjagoldgame.controllers;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GoldController {

	@RequestMapping("/gold")
	public String goldGame(HttpSession session)
	{
		if (session.getAttribute("gold") == null)
		{
			session.setAttribute("gold", 0);
		}
		
		if (session.getAttribute("quest") == null)
		{
			ArrayList<String> quests = new ArrayList<String>();
			session.setAttribute("quest", quests);
		}
		
		return "gold.jsp";
	}
	
	@RequestMapping("/embark")
	public String journey(@RequestParam(value="quest") String quest, @RequestParam(value="minGold") String minGold,
			@RequestParam(value="maxGold") String maxGold, HttpSession session)
	{
		String action = "";
		
		// if player is attempting quest
		if (quest.equals("quest"))
		{
			int randomQuest = (int) (Math.random() * 1000);
			
			// quest failed
			if (randomQuest % 2 == 0)
			{
				int randomGold = (int)((Math.random() * (Integer.parseInt(maxGold)) - (Integer.parseInt(minGold))) + (Integer.parseInt(minGold)));
				int newValue = (int) session.getAttribute("gold") - randomGold;
				session.setAttribute("gold", newValue);
				
				action = "You failed a " + quest + " and lost " + String.valueOf(randomGold) + " gold. Ouch. " + new Date();
			}
			// quest completed
			else
			{
				int randomGold = (int)((Math.random() * (Integer.parseInt(maxGold)) - (Integer.parseInt(minGold))) + (Integer.parseInt(minGold)));
				int newValue = (int) session.getAttribute("gold") + randomGold;
				session.setAttribute("gold", newValue);
				
				action = "You completed a " + quest + " and lost " + String.valueOf(randomGold) + " gold. " + new Date();
			}
		}
		else
		// else player isn't attempting a quest
		{
			// add random value of gold depending on the action
			int randomGold = (int)((Math.random() * (Integer.parseInt(maxGold)) - (Integer.parseInt(minGold))) + (Integer.parseInt(minGold)));
			int newValue = (int) session.getAttribute("gold") + randomGold;
			session.setAttribute("gold", newValue);
			
			action = "You entered a " + quest + " and earned " + String.valueOf(randomGold) + " gold. " + new Date();
		}
		
		try
		{
			ArrayList<String> newQuests = (ArrayList<String>)session.getAttribute("quest");
			
			// add quest dialogue and colorType
			newQuests.add(action);
			
			session.setAttribute("quest", newQuests);
		}
		catch (Exception e)
		{
			System.out.println("Session was not created correctly!");
		}

		

		
		return "redirect:/gold";
	}
}
