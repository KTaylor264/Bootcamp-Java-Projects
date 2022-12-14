package com.kendelltaylor.hellohuman;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class HomeController {
	@RequestMapping("")
	public String index()
	{
		return "Hello Human";
	}
	
    // @RequestMapping("/")
    // public String greetFirstName(@RequestParam(value="name") String firstName) {
    //     return "Hello " + firstName;
    // }
	
    // @RequestMapping("/")
    // public String greetFirstName(@RequestParam(value="name") String firstName, @RequestParam(value="last_name") String lastName) {
    //     return "Hello " + firstName + " " + lastName;
    // }
    
    @RequestMapping("/")
    public String greetFirstName(@RequestParam(value="name") String firstName, @RequestParam(value="times") int multiply) {
        String output = "";
        
        for (int i = 0; i < multiply; i++)
        {
        	output = output.concat("Hello " + firstName + " ");
        }
        
        return output;
    }
}
