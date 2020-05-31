package dao;

import java.util.List;

import dto.MyscheduleDTO;
import dto.ScheduleNumDTO;


public interface MyscheduleDao {
	public List<MyscheduleDTO> list();
	public List<MyscheduleDTO> fullschedule(MyscheduleDTO dto);
	public void insertMethod(MyscheduleDTO dto);
	public void selectDelete(MyscheduleDTO dto);
	public List<MyscheduleDTO> schduleList(MyscheduleDTO dto);
	public List<Object> maxNum(MyscheduleDTO dto);
	public List<MyscheduleDTO> day(MyscheduleDTO dto);
	public void delschedule(MyscheduleDTO dto);
	public void updschedule(ScheduleNumDTO sdto);
	public int checkname(String title);
}//end interface
