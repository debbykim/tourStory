package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TourUserinfoController {
	@RequestMapping(value="/tourUserinfo.go", method=RequestMethod.GET)
	public String getproc(){
		return "tour_userinfo";
	}//end 
	
	@RequestMapping(value="/tourUserinfo.go", method=RequestMethod.POST)
	public ModelAndView proc(String tripdate, String schedulename) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping(value="/userInfo.go", method=RequestMethod.GET)
	public String getprocess(){
		return "user_info";
	}
}//end class
