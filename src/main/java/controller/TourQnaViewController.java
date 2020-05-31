package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TourQnaViewController {

		@RequestMapping(value="/tourqnalist.go", method=RequestMethod.GET)
		public String getproc(){
			return "qnaviewpage";
		}//end 
}//end class
