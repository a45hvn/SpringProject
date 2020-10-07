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
	
	@Override
	public int getPosition(FormationDTO x) {
		// TODO Auto-generated method stub
		System.out.println(x.getTeam_seq());
		System.out.println(x.getStrategy());
		List<String> list=template.selectList("sql.getPosition",x);
		int result=0; // 전략 없음 -> insert
		if(list.contains(x.getStrategy())) {
			result=1; //전략 있음 -> update
		}
		return result;
	}//getPosition
	
	@Override
	public void insertPositition(List<FormationDTO> list) {
		// TODO Auto-generated method stub
		for(FormationDTO dto:list) {
			template.update("sql.insertPosition",dto);			
		}
	}//insertPosition
	
	@Override
	public void updatePosition(List<FormationDTO> list) {
		// TODO Auto-generated method stub
		FormationDTO fdto=list.get(0);
		System.out.printf("%s,%s",fdto.getStrategy(),fdto.getTeam_seq());
		template.delete("sql.deletePosition",fdto);
		
		
		for(FormationDTO dto:list) {
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			template.update("sql.insertPosition",dto);			
		}
	}//updatePosition
	
}// DAO
