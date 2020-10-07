package com.test.spring;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
	
	@RequestMapping(value = "/Jai/formationok.action", method = (RequestMethod.POST))
	public void formationok(HttpServletRequest request, HttpServletResponse response, String jsonArray, String team_seq) {
		System.out.println(jsonArray);
		 JSONParser parser = new JSONParser();
		 
		 JSONArray list=null;
		try {
			list = (JSONArray)parser.parse(jsonArray);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<FormationDTO> dtoList=new ArrayList<FormationDTO>();
		for(Object obj:list) {
			FormationDTO dto=new FormationDTO();
			dto.setPlayer(((JSONObject)obj).get("player").toString());
			dto.setPosition_x(((JSONObject)obj).get("left").toString().replace("px", ""));
			dto.setPosition_y(((JSONObject)obj).get("top").toString().replace("px", ""));
			dto.setPosition(((JSONObject)obj).get("position").toString());
			dto.setStrategy(((JSONObject)obj).get("strategy").toString());
			dto.setTeam_seq(team_seq);
			dtoList.add(dto);
		}
		
		FormationDTO x=dtoList.get(0);
		
		//String strategy=((JSONObject)x).get("strategy").toString();

		int check=dao.getPosition(x);
		if(check==1) {
			System.out.println("check=1");
			dao.updatePosition(dtoList);
		}else if(check==0) {
			System.out.println("insertPosition");
			dao.insertPositition(dtoList);
		}
	}//Jai/formationok
	
	@RequestMapping(value = "/Jai/comment.action", method = (RequestMethod.GET))
	public void comment(HttpServletRequest request, HttpServletResponse response,String seq) {

		
		int result=dao.updateComment();
	}//Jai/comment
	@RequestMapping(value = "/Jai/commentok.action", method = (RequestMethod.POST))
	public String commentok(HttpServletRequest request, HttpServletResponse response) {

		

		return "Jai/commentok";
	}//Jai/commentok
	
}//JaiController
