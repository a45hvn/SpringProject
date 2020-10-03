package com.test.spring;

import java.util.ArrayList;
import java.util.List;

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
	public String formation(HttpServletRequest request, HttpServletResponse response,String team_seq) {
	
	List<PlayerDTO> list=new ArrayList<PlayerDTO>(); 
	list=dao.getPlayerInfo(team_seq);
	request.setAttribute("list", list);
	return "Jai/formation";
	}//Jai/formation
	
	@RequestMapping(value = "/Jai/comment.action", method = (RequestMethod.GET))
	public void comment(HttpServletRequest request, HttpServletResponse response,String seq) {

		
		int result=dao.updateComment();
	}//Jai/comment
	@RequestMapping(value = "/Jai/commentok.action", method = (RequestMethod.POST))
	public String commentok(HttpServletRequest request, HttpServletResponse response) {

		

		return "Jai/commentok";
	}//Jai/commentok
}//JaiController
