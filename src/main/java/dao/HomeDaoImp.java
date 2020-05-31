package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import TourBoardDto.TourBoardDTO;

public class HomeDaoImp implements HomeDAO {
private SqlSessionTemplate sqlSessionTemplate;

	public HomeDaoImp() {
		
	}
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<TourBoardDTO> mainProcess() {
		return sqlSessionTemplate.selectList("scinfo.best_like");
	}

}
