package kr.co.tourstory;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import TourBoardDao.TourBoardDAO;
import TourBoardDao.TourBoardDaoImp;
import TourBoardDto.TourBoardDTO;
import TourService.HomeService;
import dao.HomeDAO;
import dao.HomeDaoImp;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private HomeService service;
	
	public void setService(HomeService service) {
		this.service = service;
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		logger.info("Welcome home! The client locale is {}.", locale);
		 HomeDaoImp dao = new HomeDaoImp();
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		/*List<TourBoardDTO> aList = dao.mainProcess();*/
		model.addAttribute("serverTime", formattedDate );
		/*System.out.println("aList값확인 :"+aList.get(0).getBoard_subject());
		mav.addObject("aList",aList);
		
		mav.setViewName("index");*/
		return "index";
	}
	
}
