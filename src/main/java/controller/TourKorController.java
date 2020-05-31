package controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class TourKorController {
	

	@RequestMapping(value="/tourKor.go", method=RequestMethod.POST)
	public ModelAndView proc(String tripdate, String schedulename) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}//end class
