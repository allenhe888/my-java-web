package com.ld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ld.entity.Job;
import com.ld.service.JobService;

@Controller
public class JobController {

	@Autowired
	private JobService objectService;
	
	@RequestMapping("job/find/{id}")
	@ResponseBody
	public Job findObjectById(@PathVariable Long id) {
		return objectService.findObjectById(id);
	}
	
	/*
	@RequestMapping("index")
	public String index() {
		System.out.println("this is index!");
		return "index";
	}
	*/
	
	
}
