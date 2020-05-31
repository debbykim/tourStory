package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import TourBoardDto.PageDTO;
import TourService.TourStoryQnaService;
import dto.MemberDTO;
import dto.TourStoryQnaDTO;

@Controller
public class ToursotryQnaController {
	private TourStoryQnaService service;
	private int currentPage;
	private PageDTO pv;

	public ToursotryQnaController() {

	}

	public void setService(TourStoryQnaService service) {
		this.service = service;
	}
	
	// 카테고리별 페이지 처리
	@RequestMapping("/noticePage.go")
	public ModelAndView categoryPageMethod(PageDTO pv, TourStoryQnaDTO dto){
		ModelAndView mav = new ModelAndView();
		if (dto.getQna_category() == null ||dto.getQna_category().trim().length() == 0|| dto.getQna_category().equals("notice")) {
			dto.setQna_category("notice");
			int totalRecord = service.countProcess(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0) {
					currentPage = 1;
				} else {
					currentPage = pv.getCurrentPage();
				}
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setCategory(dto.getQna_category());
				List<TourStoryQnaDTO> noticeList = service.listProcess(this.pv);
				mav.addObject("pv", this.pv);
				mav.addObject("aList", noticeList);
				mav.addObject("current", currentPage);
				mav.addObject("length", noticeList.size());
			} // end if totalRecord >= 1
		}else if(dto.getQna_category().equals("cautious")){
			int totalRecord = service.countProcess(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0) {
					currentPage = 1;
				} else {
					currentPage = pv.getCurrentPage();
				}
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setCategory(dto.getQna_category());
				List<TourStoryQnaDTO> cautiousList = service.listProcess(this.pv);
				mav.addObject("pv", this.pv);
				mav.addObject("aList", cautiousList);
				mav.addObject("length", cautiousList.size());
			} // end if totalRecord >= 1
		}else if(dto.getQna_category().equals("tour_cautious")){
			int totalRecord = service.countProcess(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0) {
					currentPage = 1;
				} else {
					currentPage = pv.getCurrentPage();
				}
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setCategory(dto.getQna_category());				
				List<TourStoryQnaDTO> tourList = service.listProcess(this.pv);
				mav.addObject("pv", this.pv);
				mav.addObject("aList", tourList);
				mav.addObject("length", tourList.size());
			} // end if totalRecord >= 1
		}else{
			int totalRecord = service.countProcess(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0) {
					currentPage = 1;
				} else {
					currentPage = pv.getCurrentPage();
				}
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setCategory(dto.getQna_category());				
				List<TourStoryQnaDTO> tipsList = service.listProcess(this.pv);			
				mav.addObject("pv", this.pv);
				mav.addObject("aList", tipsList);
				mav.addObject("length", tipsList.size());
			} // end if totalRecord >= 1
		}//end if~else if
		mav.setViewName("tour_notice");
		return mav;
	}// end categoryPageMethod
	
	// 카테고리 버튼 누르면 해당 카테고리 리스트 처리부분
	@RequestMapping("/noticeList.go")
	public ModelAndView noticelistMethod(PageDTO pv, TourStoryQnaDTO dto) {
		ModelAndView mav = new ModelAndView();		
		if (dto.getQna_category() == null ||dto.getQna_category().trim().length() == 0|| dto.getQna_category().equals("notice")) {
			dto.setQna_category("notice");
			int totalRecord = service.countProcess(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0) {
					currentPage = 1;
				} else {
					currentPage = pv.getCurrentPage();
				}
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setCategory(dto.getQna_category());
				List<TourStoryQnaDTO> noticeList = service.listProcess(this.pv);
				mav.addObject("pv", this.pv);
				mav.addObject("aList", noticeList);
				mav.addObject("length", noticeList.size());
			} // end if totalRecord >= 1
		}else if(dto.getQna_category().equals("cautious")){
			int totalRecord = service.countProcess(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0) {
					currentPage = 1;
				} else {
					currentPage = pv.getCurrentPage();
				}
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setCategory(dto.getQna_category());
				List<TourStoryQnaDTO> cautiousList = service.listProcess(this.pv);
				mav.addObject("pv", this.pv);
				mav.addObject("aList", cautiousList);
				mav.addObject("length", cautiousList.size());
			} // end if totalRecord >= 1
		}else if(dto.getQna_category().equals("tour_cautious")){
			int totalRecord = service.countProcess(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0) {
					currentPage = 1;
				} else {
					currentPage = pv.getCurrentPage();
				}
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setCategory(dto.getQna_category());				
				List<TourStoryQnaDTO> tourList = service.listProcess(this.pv);
				mav.addObject("pv", this.pv);
				mav.addObject("aList", tourList);
				mav.addObject("length", tourList.size());
			} // end if totalRecord >= 1
		}else{
			int totalRecord = service.countProcess(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0) {
					currentPage = 1;
				} else {
					currentPage = pv.getCurrentPage();
				}
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setCategory(dto.getQna_category());				
				List<TourStoryQnaDTO> tipsList = service.listProcess(this.pv);			
				mav.addObject("pv", this.pv);
				mav.addObject("aList", tipsList);
				mav.addObject("length", tipsList.size());
			} // end if totalRecord >= 1
		}//end if~else if
		mav.setViewName("jsonView");
		return mav;
	}// end listMethod()

	@RequestMapping("/qnaview.go")
	public ModelAndView viewMethod(int currentPage, int qna_num, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		TourStoryQnaDTO dto = service.contentProcess(qna_num);

		HttpSession session = request.getSession();

		mav.addObject("sessionNick", session.getAttribute("nick"));
		mav.addObject("currentPage", currentPage);
		mav.addObject("dto", dto);
		mav.setViewName("jsonView");
		return mav;
	}// end viewMethod()

	@RequestMapping(value = "/qnawrite.go", method = RequestMethod.GET)
	public ModelAndView writeMethod(PageDTO pv, TourStoryQnaDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();		
		HttpSession session = request.getSession();
		mav.addObject("member_qna_nick", session.getAttribute("nick"));
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.addObject("dto", dto);
		mav.setViewName("tour_qna_write");
		return mav;
	}// end writeMethod()

	@RequestMapping(value = "/qnawrite.go", method = RequestMethod.POST)
	public String writeProMethod(PageDTO pv, TourStoryQnaDTO dto, HttpServletRequest request) {		
		// 답변글이면
		if (dto.getQna_ref_num() != 0) {
			service.reStepProcess(dto);
			// 제목글이면
		} else {
			service.insertProcess(dto);
		}
		return "redirect:/noticePage.go?currentPage=" + pv.getCurrentPage()+"&qna_category="+dto.getQna_category();
	}// end writeProMethod()

	@RequestMapping("/qnaupdate.go")
	public ModelAndView updateForm(int qna_num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		TourStoryQnaDTO dto = service.updateSelectProcess(qna_num);
		mav.addObject("dto", dto);
		mav.addObject("time", dto.getQna_date().getTime());
		mav.addObject("currentPage", currentPage);
		mav.setViewName("tour_qna_update");
		return mav;
	}// end updateForm()

	@RequestMapping(value = "/updateContent.go", method = RequestMethod.POST)
	public ModelAndView updateProc(TourStoryQnaDTO dto,int currentPage) {
		ModelAndView mav = new ModelAndView();
		service.updateProcess(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/noticePage.go?qna_category="+dto.getQna_category());
		return mav;
	}// end updateProc()

	@RequestMapping("/qnadelete.go")
	public ModelAndView deleteMethod(int qna_num, int currentPage, HttpServletRequest request, TourStoryQnaDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcess(qna_num, request);
		
		PageDTO pv = new PageDTO(service.countProcess(dto));
		if (pv.getTotalPage() < currentPage)
			mav.addObject("currentPage", currentPage - 1);
		else
			mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/noticePage.go");
		return mav;
	}// end deleteMethod()

}// end class
