package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//최재성
@Controller
public class JaiController {
	
	@Autowired
	private IJaiDAO dao;
	
	@RequestMapping(value = "/Jai/test.action", method = (RequestMethod.GET))
	public String test(HttpServletRequest request, HttpServletResponse response) {

		

		return "Jai/test";
	}//Jai/test
	
	@RequestMapping(value = "/Jai/formation.action", method = (RequestMethod.GET))
	public String formation(HttpServletRequest request, HttpServletResponse response) {

		

		return "Jai/formation";
	}//Jai/formation
}//JaiController
