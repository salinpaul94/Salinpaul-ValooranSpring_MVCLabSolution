package com.greatlearning.library;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.library.model.Form;
import com.greatlearning.library.service.FormService;

@Controller
public class FormController {

	@Autowired
	private FormService formService;
	
	@RequestMapping("/forms")
	public String getform(Model model) {
		
		// get data from DB
		List<Form> forms = formService.findForm();
		forms.forEach(System.out::print);
		
		//send the value to view
		model.addAttribute("Forms", forms);
		return "forms";
	}
	
	@RequestMapping(value = "/AddStudent")
	public String displayForm(Model model)
	{
		Form form = new Form();
		model.addAttribute("Form", form);
		return "DebateForm";
	}
	
	@PostMapping(value = "/save")
	public String saveBook(@RequestParam int id,
			@RequestParam String name,
			@RequestParam String department,
			@RequestParam String country) {
	
		if(id != 0) {
			Form form = new Form();
			form.setId(id);
			form.setName(name);
			form.setDepartment(department);
			form.setCountry(country);
			
			formService.saveForm(form);
		}
			
		
		return "redirect:/forms";
		
	}
	
	@RequestMapping("/delete")
	public String deleteBook(@RequestParam int id)
	{
		formService.deleteById(id);
		
		return "redirect:/forms";
	}
	
	@RequestMapping("/search")
	public String searchForm(@RequestParam String name, Model model)
	{
		List<Form> forms = formService.findBy(name);
		
		model.addAttribute("Forms", forms);
		return "forms";
	}
	
	@RequestMapping(value = "/Update")
	public String updateForm(@RequestParam int id, Model model)
	{
		
		// get data from DB
		Form form = formService.findById(id);
		//send the value to view
		model.addAttribute("Form", form);
		return "UpdateForm";
	}
	
	@PostMapping(value = "/updateForm")
	public String updateForm(@RequestParam int id, 
			@RequestParam String name, 
			@RequestParam String department, 
			@RequestParam String country, Model model) {
		
		formService.updateForm(id, name, department, country);
		
		return "redirect:/forms";
	}
}
