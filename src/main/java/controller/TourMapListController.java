package controller;

import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import TourBoardDto.TourBoardDTO;
import TourService.TourBoardService;
import dao.MyscheduleDaoImp;
import dto.MyscheduleDTO;
import dto.ScheduleNumDTO;

@Controller
public class TourMapListController {
	private MyscheduleDaoImp dao;
	private TourBoardService boardservice;
	
	public TourMapListController() {
	}

	public void setDao(MyscheduleDaoImp dao) {
		this.dao = dao;
	}

	public void setBoardservice(TourBoardService boardservice) {
		this.boardservice = boardservice;
	}

	@RequestMapping(value = "/tour_map.go", method = RequestMethod.POST)
	public ModelAndView proc(String tripdate, String schedulename, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("tripdate", tripdate);
		session.setAttribute("schedulename", schedulename);
		//System.out.println("tour_map.go post !! session 저장완료"+tripdate+", "+schedulename);
		//System.out.println(dao.checkname());
		int chk = dao.checkname(schedulename);
		if(chk==0){
			mv.addObject("schedule_chk","0");
		}else{
			mv.addObject("schedule_chk","1");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/tourMapList.go")
	public ModelAndView proc(MyscheduleDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		dto.setMember_schedule_nick((String) session.getAttribute("nick"));

		if (dto.getSchedule_tel().equals("")) {
			dto.setSchedule_tel("02");
		}
		List<Object> obj = dao.maxNum(dto);
		for (Object aa : obj) {
			if (aa == null || aa.equals("")) {
				aa = 1;
				dto.setSchedule_num((Integer) aa);
			} else {
				dto.setSchedule_num((Integer) aa + 1);
			}
		} // end for

		dao.insertMethod(dto);

		List<MyscheduleDTO> alist = dao.schduleList(dto);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("alist", alist);

		mav.addObject("dto", dto);
		mav.addAllObjects(map);
		mav.setViewName("jsonView");

		return mav;
	}// proc

	@RequestMapping(value = "/deletList.go", method = RequestMethod.POST)
	public ModelAndView selectDelete(MyscheduleDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		dto.setMember_schedule_nick((String) session.getAttribute("nick"));

		dao.selectDelete(dto);
		int cnt = 1;
		List<MyscheduleDTO> getList = dao.schduleList(dto);
		for (int i = 0; i < getList.size(); i++) {
			ScheduleNumDTO number = new ScheduleNumDTO();
			number.setBnum(getList.get(i).getSchedule_num());
			number.setDay(dto.getSchedule_day());
			number.setName(dto.getSchedule_name());

			getList.get(i).setSchedule_num(cnt);
			number.setFnum(getList.get(i).getSchedule_num());

			cnt++;
			dao.updschedule(number);
		}
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/dayList.go", method = RequestMethod.POST)
	public ModelAndView dayList(MyscheduleDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		dto.setMember_schedule_nick((String) session.getAttribute("nick"));
		
		List<MyscheduleDTO> markerList = dao.schduleList(dto);
		mav.addObject("markerList", markerList);

		List<MyscheduleDTO> dayList = dao.schduleList(dto);
		mav.addObject("dayList", dayList);
		mav.setViewName("jsonView");
		return mav;
	}// end dayList

	@RequestMapping("/imageMap.go")
	public ModelAndView imgMap(MyscheduleDTO dto) {
		ModelAndView mav = new ModelAndView();
		dto.setSchedule_day(dto.getSchedule_day().replace("_", " "));
		dto.setSchedule_name(dto.getSchedule_name().replace("_", " "));
		
		List<MyscheduleDTO> markerList = dao.schduleList(dto);
		mav.addObject("markerList", markerList);		
		mav.addObject("length", markerList.size());
		mav.addObject("day", dto.getSchedule_day());

		mav.setViewName("imageMapEX");

		return mav;
	}// end imageMap

	@RequestMapping("/fullschedule.go")
	public ModelAndView fullschedule(MyscheduleDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		dto.setMember_schedule_nick((String) session.getAttribute("nick"));
		List<MyscheduleDTO> fullschedule = dao.fullschedule(dto);
		List<MyscheduleDTO> day = dao.day(dto);
		mav.addObject("day", day);
		mav.addObject("length", day.size());
		mav.addObject("fullschedule", fullschedule);
		mav.setViewName("fullschedule");

		return mav;
	}

	@RequestMapping("/updatesch.go")
	public ModelAndView delschedule(MyscheduleDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		dto.setMember_schedule_nick((String) session.getAttribute("nick"));
		dao.delschedule(dto);

		int cnt = 1;
		List<MyscheduleDTO> getList = dao.schduleList(dto);

		for (int i = 0; i < getList.size(); i++) {
			ScheduleNumDTO number = new ScheduleNumDTO();
			number.setBnum(getList.get(i).getSchedule_num());
			number.setDay(dto.getSchedule_day());
			number.setName(dto.getSchedule_name());

			getList.get(i).setSchedule_num(cnt);
			number.setFnum(getList.get(i).getSchedule_num());

			cnt++;
			dao.updschedule(number);
		}

		List<MyscheduleDTO> chk = dao.schduleList(dto);
		List<MyscheduleDTO> markerList = dao.schduleList(dto);

		mav.addObject("markerList", markerList);
		mav.addObject("dayList", chk);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping("/saveSchedule.go")
	public ModelAndView saveProcess(MyscheduleDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		dto.setMember_schedule_nick((String) session.getAttribute("nick"));
		List<MyscheduleDTO> full = dao.fullschedule(dto);
		List<MyscheduleDTO> days = dao.day(dto);

		String content = "";
		for (MyscheduleDTO day : days) {
			for (MyscheduleDTO one : full) {
				if(day.getSchedule_day().equals(one.getSchedule_day())){
					content += "@@<b>["+day.getSchedule_day() + "]</b>&nbsp;&nbsp;&nbsp;"+one.getSchedule_num()+".&nbsp;" + one.getSchedule_title()+"<br/>";
				}
			}
			String over="overflow:hidden";
			String wpx ="100%";
			String hpx ="350px";
			String link ="http://syronia.iptime.org/tourstory/imageMap.go?schedule_day="+day.getSchedule_day().replace(" ", "_")+"&schedule_name="+full.get(0).getSchedule_name().replace(" ", "_")+
					"&member_schedule_nick="+dto.getMember_schedule_nick();
			content += "<iframe src="+link+" style="+over+" width="+wpx+" height="+hpx+"></iframe><br/>";
		}
		mav.addObject("subject", dto.getSchedule_name());
		session.setAttribute("subject", dto.getSchedule_name());
		mav.addObject("content", content);
		mav.setViewName("write");
		return mav;
	}// end saveProcess
	

	@RequestMapping("/updateSchedule.go")
	public ModelAndView updateProcess(MyscheduleDTO dto, HttpServletRequest request, TourBoardDTO board,int currentPage,String tripdate) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		dto.setMember_schedule_nick((String) session.getAttribute("nick"));	
		String conn = boardservice.contentload(board.getBoard_num());

		List<MyscheduleDTO> full = dao.fullschedule(dto);
		List<MyscheduleDTO> days = dao.day(dto);

		String conten = "";
		for (MyscheduleDTO day : days) {
			for (MyscheduleDTO one : full) {
				if(day.getSchedule_day().equals(one.getSchedule_day())){
					conten += "@@<b>["+day.getSchedule_day() + "]</b>&nbsp;&nbsp;&nbsp;"+one.getSchedule_num()+".&nbsp;" + one.getSchedule_title()+"<br/>";
				}
			}
			String over="overflow:hidden";
			String wpx ="100%";
			String hpx = "350px";
			String link ="http://syronia.iptime.org/tourstory/imageMap.go?schedule_day="+day.getSchedule_day().replace(" ", "_")+"&schedule_name="+full.get(0).getSchedule_name().replace(" ", "_")+
					"&member_schedule_nick="+dto.getMember_schedule_nick();
			conten += "<iframe src="+link+" style="+over+" width="+wpx+" height="+hpx+"></iframe>";
		}
		//System.out.println("자르기전의값"+conten);
		String[] array = conn.split("@");
		String[] array2 = conten.split("@");
		String con;
		String conten1="";
		String content="";
		int se = 0 ;
		content+=array[0];
		
		for(String arr : array){
			
			if(!(arr.equals(""))){
		//System.out.println("이것이 에랑라"+arr);
		//System.out.println("이것은"+array2[se]);
		//System.out.println("arry  길이 : "+arr.length());
		
		Pattern patt = Pattern.compile("<b>.+</iframe>");
		//System.out.println("에알알"+arr);
		Matcher m = patt.matcher(arr);
		
		if(m.find()){
			//System.out.println("이거시다 "+m.group().length());
			//System.out.println(arr);
				con = arr.substring(m.group().length(), arr.length());
				conten1 = array2[se]+con;			
			//System.out.println("컨텐츠값이시다"+con);
			//System.out.println("컨텐츠값"+conten1);
				if(se!=0){
			content+=conten1;
				}
			}else if(!m.find()){
		
			content+=array2[se];
		}
		
		}
			se++;
		}
		se = 0;
		board.setBoard_content(content);

		boardservice.updateScheduleProc(board);
		
		TourBoardDTO bto = boardservice.contentProcess(board.getBoard_num());
	
		mav.addObject("subject", dto.getSchedule_name());
		mav.addObject("content", bto.getBoard_content());
		
		mav.addObject("cate", bto.getBoard_category());
		mav.addObject("dto", bto);
		mav.addObject("currentPage", currentPage);
		mav.addObject("conn",content);
		mav.setViewName("update_schedule");
		return mav;
	}// end saveProcess
	
	/* 수정 버튼 클릭시 첫번째 처리 컨트롤러 */
	@RequestMapping("/updateMap.go")
	public ModelAndView updateMap(MyscheduleDTO dto, TourBoardDTO board, int num, String category, int currentPage){
		ModelAndView mav = new ModelAndView();
		List<MyscheduleDTO> days = dao.day(dto);
		if(dto.getSchedule_day() == null){
			dto.setSchedule_day(days.get(0).getSchedule_day());
		}
		String con = boardservice.contentload(num);
		board.setBoard_num(num);
		board.setBoard_category(category);
		
		List<MyscheduleDTO> dayList = dao.schduleList(dto);
		List<MyscheduleDTO> markerList = dao.schduleList(dto);
		mav.addObject("boardDTO", board);
		mav.addObject("uptmarkerList", markerList);
		mav.addObject("uptdayList", dayList);
		mav.addObject("uptName", dto.getSchedule_name());
		mav.addObject("days", days);
		mav.addObject("curr",currentPage);
		mav.addObject("con",con);
		mav.setViewName("update_map");
		return mav;
	}// updateMap.go get
}// end class
