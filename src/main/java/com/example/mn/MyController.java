package com.example.mn;

import org.springframework.stereotype.Controller;

@Controller
public class MyController {

	@RequestMapping("/")
	public String display()
	{
		return "index";
	}

}
