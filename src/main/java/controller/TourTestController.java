package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import TourBoardDto.PageDTO;
import TourService.TourBoardService;

@Controller
public class TourTestController {
	
	public TourBoardService Tourservi;
	private int currentPage;
	private PageDTO pv;
	
	@RequestMapping(value="/tourTest.go", method=RequestMethod.GET)
	public String getproc(){
		return "calendar";
	}//end
	

	@RequestMapping(value="/tourTest.go", method=RequestMethod.POST)
	public ModelAndView proc(String tripdate, String schedulename) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("tripdate", tripdate);
		mav.addObject("schedulename", schedulename);
		mav.setViewName("mapLoad");
		return mav;
	}
	
	@RequestMapping("consul.go")
	public ModelAndView consul(String name,String email,String message){
		ModelAndView mav = new ModelAndView();
		System.out.println(name+"///"+email+"..."+message);
		mav.setViewName("jsonView");
		return mav;
	}
}//end class
