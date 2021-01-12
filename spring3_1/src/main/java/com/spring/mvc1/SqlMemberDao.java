package com.spring.mvc1;

import java.util.Map;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class SqlMemberDao {
	Logger logger = Logger.getLogger(SqlMemberDao.class);
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public String login(Map<String,Object> pMap) {//프로시저의 파라미터 맵은 파라미터이면서 리절트 인식
		logger.info("login 호출 성공");
		String mem_name = null;
		try {
			sqlSessionTemplate.selectOne("proc_ajaxLogin",pMap);//parameter이면서 result IN과 OUT동시에 받아준다.
			logger.info("이름 : "+pMap.get("msg"));
			mem_name = pMap.get("msg").toString();
		} catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return mem_name;
	}
}
