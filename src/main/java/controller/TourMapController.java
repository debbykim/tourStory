package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.MyscheduleDaoImp;

@Controller
public class TourMapController {
	
	
	private MyscheduleDaoImp dao;
	public TourMapController() {
	}

	public void setDao(MyscheduleDaoImp dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/tourMap.go", method = RequestMethod.GET)
	public String getproc() {
		return "calendar";
	}// end

	
	
	@RequestMapping(value = "/tour_callMap.go", method = RequestMethod.GET)
	public String callMap() {
		return "tour_map";
	}// end
}// end class
