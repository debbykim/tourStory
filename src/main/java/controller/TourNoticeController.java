package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TourNoticeController {
	@RequestMapping(value="/tourNotice.go", method=RequestMethod.GET)
	public String getproc(){
		return "tour_notice";
	}//end 
	
	@RequestMapping(value="/tourNotice.go", method=RequestMethod.POST)
	public String proc() {
		return "tour_notice";
	}
}//end class
