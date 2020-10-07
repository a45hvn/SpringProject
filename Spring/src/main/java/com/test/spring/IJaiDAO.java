package com.test.spring;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;

public interface IJaiDAO {

	int updateComment();

	List<PlayerDTO> getPlayerInfo(String team_seq);

	int getPosition(FormationDTO x);

	void updatePosition(List<FormationDTO> dtoList);

	void insertPositition(List<FormationDTO> dtoList);

	

}//IDAO
