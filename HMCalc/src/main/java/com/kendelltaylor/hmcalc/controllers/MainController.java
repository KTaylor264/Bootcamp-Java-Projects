package com.kendelltaylor.hmcalc.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kendelltaylor.hmcalc.models.Attribute;
import com.kendelltaylor.hmcalc.models.Digimon;
import com.kendelltaylor.hmcalc.models.GrowthType;
import com.kendelltaylor.hmcalc.models.Item;
import com.kendelltaylor.hmcalc.models.Stage;
import com.kendelltaylor.hmcalc.models.SupportSkill;
import com.kendelltaylor.hmcalc.models.Type;
import com.kendelltaylor.hmcalc.services.AttributeService;
import com.kendelltaylor.hmcalc.services.DigimonService;
import com.kendelltaylor.hmcalc.services.GrowthTypeService;
import com.kendelltaylor.hmcalc.services.ItemService;
import com.kendelltaylor.hmcalc.services.StageService;
import com.kendelltaylor.hmcalc.services.SupportSkillService;
import com.kendelltaylor.hmcalc.services.TypeService;

@Controller
public class MainController {
	private final DigimonService digiServ;
	private final GrowthTypeService growthServ;
	private final StageService stageServ;
	private final TypeService typeServ;
	private final AttributeService attribServ;
	private final SupportSkillService suppServ;
	private final ItemService itemServ;
	
	public MainController(DigimonService digiServ, GrowthTypeService growthServ, StageService stageServ,
			TypeService typeServ, AttributeService attribServ, SupportSkillService suppServ,
			ItemService itemServ) {
		this.digiServ = digiServ;
		this.growthServ = growthServ;
		this.stageServ = stageServ;
		this.typeServ = typeServ;
		this.attribServ = attribServ;
		this.suppServ = suppServ;
		this.itemServ = itemServ;
	}
	
	@GetMapping("/")
	public String index(Model model)
	{
		List<Digimon> digimons = digiServ.findAll();
		List<GrowthType> growthTypes = growthServ.findAll();
		List<Stage> stages = stageServ.findAll();
		List<Type> types = typeServ.findAll();
		List<Attribute> attributes = attribServ.findAll();
		List<SupportSkill> supports = suppServ.findAll();
		List<Item> items = itemServ.findAll();
		
		model.addAttribute("digimons", digimons);
		model.addAttribute("growthTypes", growthTypes);
		model.addAttribute("stages", stages);
		model.addAttribute("types", types);
		model.addAttribute("attributes", attributes);
		model.addAttribute("supports", supports);
		model.addAttribute("items", items);
		
		return "index.jsp";
	}
}
