package com.test.spring;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JaiDAO implements IJaiDAO {

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int updateComment() {
		// TODO Auto-generated method stub

		// return template.update("mapper", );
		return 0;
	}// updateComment

	@Override
	public List<PlayerDTO> getPlayerInfo(String team_seq) {
		// TODO Auto-generated method stub
		
		return template.selectList("sql.PlayerInfo", team_seq);
	}//getPlayerInfo
}// DAO
