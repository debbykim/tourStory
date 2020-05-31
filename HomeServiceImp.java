package TourService;

import java.util.List;

import TourBoardDto.TourBoardDTO;
import dao.HomeDAO;


public class HomeServiceImp implements HomeService{

	private HomeDAO dao;
	
	public void setDao(HomeDAO dao) {
		this.dao = dao;
	}
	
	public HomeServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<TourBoardDTO> mainPro() {
		return dao.mainProcess();
	}
}
