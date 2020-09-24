package com.test.spring;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JaiDAO implements IJaiDAO{

	private SqlSessionTemplate template;
	
}//DAO
