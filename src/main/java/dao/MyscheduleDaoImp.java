package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MyscheduleDTO;
import dto.ScheduleNumDTO;



public class MyscheduleDaoImp implements MyscheduleDao{
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MyscheduleDaoImp() {
		
	}
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<MyscheduleDTO> list() {
		return sqlSessionTemplate.selectList("schedule.list");
	}// list()

	@Override
	public void insertMethod(MyscheduleDTO dto) {
		sqlSessionTemplate.insert("schedule.ins", dto);
	}//insert()

	@Override
	public List<MyscheduleDTO> schduleList(MyscheduleDTO dto) {
		return sqlSessionTemplate.selectList("schedule.scheduleList",dto);
	}

	@Override
	public List<Object> maxNum(MyscheduleDTO dto) {
		return sqlSessionTemplate.selectList("schedule.maxNum",dto);
	}

	@Override
	public List<MyscheduleDTO> fullschedule(MyscheduleDTO dto) {
		return sqlSessionTemplate.selectList("schedule.fullschedule",dto);
	}

	@Override
	public List<MyscheduleDTO> day(MyscheduleDTO dto) {
		return sqlSessionTemplate.selectList("schedule.day",dto);
	}

	@Override
	public void delschedule(MyscheduleDTO dto) {
		sqlSessionTemplate.delete("schedule.delschedule",dto);
	}

	@Override
	public void updschedule(ScheduleNumDTO sdto) {
		sqlSessionTemplate.update("schedule.updschedule",sdto);
	}

	@Override
	public void selectDelete(MyscheduleDTO dto) {
		sqlSessionTemplate.delete("schedule.selectdel", dto);
	}

	@Override
	public int checkname(String title) {
		return sqlSessionTemplate.selectOne("schedule.checkname", title.trim());
	}
}// dao
