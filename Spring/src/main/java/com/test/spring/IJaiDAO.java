package com.test.spring;

import java.util.ArrayList;
import java.util.List;

public interface IJaiDAO {

	int updateComment();

	List<PlayerDTO> getPlayerInfo(String team_seq);

}//IDAO
