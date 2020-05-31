package TourController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import TourBoardDto.BoardReplyDTO;
import TourBoardDto.PageDTO;
import TourBoardDto.ReplyDTO;
import TourBoardDto.TourBoardDTO;
import TourService.TourBoardService;
import dto.MyscheduleDTO;

@Controller
public class TourBoardController {
	private TourBoardService Tourservice;
	private int currentPage;
	private int currentReply;
	private PageDTO pv;
	private ReplyDTO rv;

	public TourBoardController() {
		
	}

	public void setTourservice(TourBoardService tourservice) {
		Tourservice = tourservice;
	}

	

	@RequestMapping("/navi.go")
	public ModelAndView naviMethod(){
		ModelAndView mav = new ModelAndView();
		
		List<TourBoardDTO> kList= Tourservice.klike();
		List<TourBoardDTO> rList= Tourservice.rlike();
		List<TourBoardDTO> hList= Tourservice.hlike();
		List<TourBoardDTO> tList= Tourservice.tlike();
		
		mav.addObject("kList",kList);
		mav.addObject("rList",rList);
		mav.addObject("hList",hList);
		mav.addObject("tList",tList);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping("/index.go")
	public ModelAndView mainMethod(){
		ModelAndView mav = new ModelAndView();
		
		List<TourBoardDTO> aList= Tourservice.bestlikePro();
		mav.addObject("aList",aList);
		mav.addObject("size",aList.size());
		
		mav.setViewName("list");
		return mav;
	}
	
	@RequestMapping("/closed.go")
	public ModelAndView closedMethod(int num, int currentPage, 
			                    HttpServletRequest request,TourBoardDTO dto,String category){
		ModelAndView mav = new ModelAndView();
		dto.setBoard_num(num);
		Tourservice.closeProcess(dto);
		dto.setBoard_category(category);
		PageDTO pv = new PageDTO(Tourservice.countProcess(dto));
		
		if (pv.getTotalPage() < currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		else		
		mav.addObject("currentPage", currentPage);	
		
	
		mav.setViewName("redirect:/list.go?board_category="+category);
		
		return mav;
	}
	
	@RequestMapping(value="/search.go", method=RequestMethod.POST)
	public ModelAndView searchproc(PageDTO pv,TourBoardDTO dto,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		
	    List<TourBoardDTO> aList;
	    int totalRecord;
		
		//dto.setSearch_category(dto.getSearch_category());
		
		
		
		totalRecord = Tourservice.countsbPro(dto);
			if (totalRecord >= 1) {
				if (pv.getCurrentPage() == 0)
					currentPage = 1;
				else
					currentPage = pv.getCurrentPage();
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setSearchKey(pv.getSearchKey());
				aList= Tourservice.searchsbProcess(this.pv);
				mav.addObject("pv", this.pv);
				mav.addObject("aList",aList );
				mav.addObject("length",aList.size());
				mav.addObject("sessionNick", session.getAttribute("nick"));
				mav.addObject("cate",dto.getBoard_category());
				mav.setViewName("tour_view");
			}else{
				if (pv.getCurrentPage() == 0)
					currentPage = 1;
				else
					currentPage = pv.getCurrentPage();
				this.pv = new PageDTO(currentPage, totalRecord);
				this.pv.setSearchKey(pv.getSearchKey());
				aList= Tourservice.searchsbProcess(this.pv);
				mav.addObject("pv", this.pv);
				mav.addObject("aList",aList );
				mav.addObject("length",aList.size());
				mav.addObject("sessionNick", session.getAttribute("nick"));
				mav.addObject("cate",dto.getBoard_category());
				mav.setViewName("tour_thema");
			}

		return mav;
		
	}//end searchMethod()/////////////////////////////////
	
	// 안드로이드에서 게시판 처리 부분
	@RequestMapping("/appBoard.go")
	public ModelAndView appBoard(PageDTO pv, TourBoardDTO dto){
		ModelAndView mav = new ModelAndView();
		System.out.println("appBoard.go category !!!="+dto.getBoard_category());
		
		int totalRecord = Tourservice.countProcess(dto);
		String jsonTxt="{\"board\":{\"item\":[";
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();
			this.pv = new PageDTO(currentPage, totalRecord);
			this.pv.setCategory(dto.getBoard_category());
			
			List<TourBoardDTO> aList = Tourservice.listProcess(this.pv);
			for(int i=0; i<aList.size(); i++){
				if(i == aList.size()-1){
					jsonTxt +="{\"board_num\":\""+aList.get(i).getBoard_num()+"\", \"subject\":\""+aList.get(i).getBoard_subject()+"\", \"writer\":\""+aList.get(i).getMember_board_nick()+"\", \"date\":\""+aList.get(i).getBoard_date()+"\", \"readcount\":\""+aList.get(i).getBoard_readcount()+"\", \"category\":\""+aList.get(i).getBoard_category()+"\"}";
				}else{
					jsonTxt +="{\"board_num\":\""+aList.get(i).getBoard_num()+"\", \"subject\":\""+aList.get(i).getBoard_subject()+"\" , \"writer\":\""+aList.get(i).getMember_board_nick()+"\", \"date\":\""+aList.get(i).getBoard_date()+"\", \"readcount\":\""+aList.get(i).getBoard_readcount()+"\", \"category\":\""+aList.get(i).getBoard_category()+"\"},";
				}
			}
			jsonTxt +="]}}";
		}
		System.out.println("appBoard.go jsonTxt값 확인!!!!!!!!"+jsonTxt);
		mav.addObject("jsonTxt", jsonTxt);
		mav.setViewName("jsontest");
		return mav;
	}// appBoard()
	
	
	@RequestMapping("/list.go")
	public ModelAndView listMethod(PageDTO pv, HttpServletRequest request, TourBoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		int totalRecord = Tourservice.countProcess(dto);

		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();
			this.pv = new PageDTO(currentPage, totalRecord);
			this.pv.setCategory(dto.getBoard_category());
			
			List<TourBoardDTO> aList = Tourservice.listProcess(this.pv);
			 
			mav.addObject("pv", this.pv);
			mav.addObject("aList",aList );
			mav.addObject("length",aList.size());
			mav.addObject("sessionNick", session.getAttribute("nick"));		
		}
		mav.addObject("cate",dto.getBoard_category());
		mav.setViewName("tour_view");
	
		return mav;
	}// end listMethod()///////////////////

	@RequestMapping("/listTest.go")
	public ModelAndView listtestMethod(PageDTO pv ,HttpServletRequest request,TourBoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		dto.setMember_board_nick((String)session.getAttribute("nick"));
		int totalRecord = Tourservice.myCountProcess(dto);
		if (totalRecord >= 0) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();
			this.pv = new PageDTO(currentPage, totalRecord);
			this.pv.setNick(dto.getMember_board_nick());
			List<TourBoardDTO> aList = Tourservice.mytourProcess(this.pv);
			mav.addObject("pv", this.pv);
			mav.addObject("aList",aList );
			mav.addObject("length",aList.size());
			
			mav.addObject("sessionNick", session.getAttribute("nick"));
		}
		mav.addObject("cate",dto.getBoard_category());
		mav.setViewName("tour_history");
		return mav;
	}
	
	@RequestMapping("/view.go")
	public ModelAndView viewMethod(PageDTO pv,ReplyDTO rv,int currentPage, int num,BoardReplyDTO redto, HttpServletRequest request,TourBoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String reply = request.getParameter("reply");
		if(reply==null){
			Tourservice.readProcess(num);
		}else{
		}
		
		int totalRecord = Tourservice.countProcess(dto);

		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();
			this.pv = new PageDTO(currentPage, totalRecord);
			this.pv.setCategory(dto.getBoard_category());
			
			List<TourBoardDTO> pList = Tourservice.listProcess(this.pv);
			 
			mav.addObject("pv", this.pv);
			mav.addObject("pList",pList );
			mav.addObject("length",pList.size());
			mav.addObject("sessionNick", session.getAttribute("nick"));		
		}	
		
		dto = Tourservice.contentProcess(num);
		int totalReply = Tourservice.replycountProcess(num);
		
		if (totalReply >= 0) {
			
			if (rv.getCurrentReply() == 0)
				currentReply = 1;
			
			else
				currentReply = rv.getCurrentReply();
			
			this.rv = new ReplyDTO(currentReply, totalReply);

			this.rv.setNum(num);
			mav.addObject("rv", this.rv);
			mav.addObject("aList", Tourservice.replylistProcess(this.rv));

		}
		
		mav.addObject("dto", dto);
		mav.addObject("numc",dto.getBoard_num());
		mav.addObject("currentPage", currentPage);
		mav.addObject("nic",dto.getMember_board_nick());
		mav.addObject("cate",dto.getBoard_category());
		mav.addObject("close",dto.getBoard_close());
	
		mav.setViewName("boardview");
		return mav;
	}// end viewmethod()////////////////////////////
	
	@RequestMapping("/viewapp.go")
	public ModelAndView viewapp(PageDTO pv,ReplyDTO rv,int currentPage, int num,BoardReplyDTO redto, HttpServletRequest request,TourBoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String reply = request.getParameter("reply");
		if(reply==null){
			Tourservice.readProcess(num);
		}else{
		}
		
		int totalRecord = Tourservice.countProcess(dto);

		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();
			this.pv = new PageDTO(currentPage, totalRecord);
			this.pv.setCategory(dto.getBoard_category());
			
			List<TourBoardDTO> pList = Tourservice.listProcess(this.pv);
			 
			mav.addObject("pv", this.pv);
			mav.addObject("pList",pList );
			mav.addObject("length",pList.size());
			mav.addObject("sessionNick", session.getAttribute("nick"));		
		}	
		
		dto = Tourservice.contentProcess(num);
		int totalReply = Tourservice.replycountProcess(num);
		
		if (totalReply >= 0) {
			
			if (rv.getCurrentReply() == 0)
				currentReply = 1;
			
			else
				currentReply = rv.getCurrentReply();
			
			this.rv = new ReplyDTO(currentReply, totalReply);

			this.rv.setNum(num);
			mav.addObject("rv", this.rv);
			mav.addObject("aList", Tourservice.replylistProcess(this.rv));

		}
		
		mav.addObject("dto", dto);
		mav.addObject("numc",dto.getBoard_num());
		mav.addObject("currentPage", currentPage);
		mav.addObject("nic",dto.getMember_board_nick());
		mav.addObject("cate",dto.getBoard_category());
		mav.addObject("close",dto.getBoard_close());
	
		mav.setViewName("boardview_app");
		return mav;
	}// end viewapp()////////////////////////////
	
	@RequestMapping("/viewajax.go")
	public ModelAndView viewMethod(ReplyDTO rv,int currentPage, int num,BoardReplyDTO redto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String reply = request.getParameter("reply");
		if(reply==null){
			Tourservice.readProcess(num);
		}else{
		}		
		TourBoardDTO dto = Tourservice.contentProcess(num);
		int totalReply = Tourservice.replycountProcess(num);
		
		if (totalReply >= 0) {
			
			if (rv.getCurrentReply() == 0)
				currentReply = 1;
			
			else
				currentReply = rv.getCurrentReply();
			
			this.rv = new ReplyDTO(currentReply, totalReply);

			this.rv.setNum(num);
			mav.addObject("rv", this.rv);
			mav.addObject("aList", Tourservice.replylistProcess(this.rv));

		}
		
		mav.addObject("dto", dto);
		mav.addObject("numc",dto.getBoard_num());
		mav.addObject("currentPage", currentPage);
		mav.addObject("nic",dto.getMember_board_nick());
		mav.addObject("cate",dto.getBoard_category());
		mav.addObject("close",dto.getBoard_close());
	
		mav.setViewName("boardlist");
		return mav;
	}// end viewmethod()////////////////////////////

	@RequestMapping("/replyview.go")
	public ModelAndView replyviewMethod(ReplyDTO rv,int currentPage, int num ,String content,BoardReplyDTO redto, HttpServletRequest request){	
		ModelAndView mav = new ModelAndView();
		redto.setBoard_num(num);
		redto.setReply_content(content);
		HttpSession session = request.getSession();
		String nid= (String) session.getAttribute("nick");
		redto.setMember_reply_nick(nid);
		String reply = redto.getReply_content();
		int totalReply = Tourservice.replycountProcess(num);
		Tourservice.replyProcess(redto);
		
		if (totalReply >= 0) {
			if (rv.getCurrentReply() == 0)
				currentReply = 1;
			else
				currentReply = rv.getCurrentReply();
			
			this.rv = new ReplyDTO(currentReply, totalReply);
			this.rv.setNum(num);
						
			mav.addObject("rv", this.rv);
			mav.addObject("aList", Tourservice.replylistProcess(this.rv));
			
		}
		mav.addObject("numc",num);
		mav.setViewName("replycheck");
		
		return mav;
	}// end replyviewMethod()//////////////////////////////////////////
	
	@RequestMapping(value= "/replylistview.go" ,method = RequestMethod.GET)
	public ModelAndView replylistviewMethod(ReplyDTO rv,int Reply, int num ,BoardReplyDTO redto){
		ModelAndView mav = new ModelAndView();
		redto.setBoard_num(num);
		rv.setCurrentReply(Reply);
		int totalReply = Tourservice.replycountProcess(num);		
		
		if (totalReply >= 0) {
			if (rv.getCurrentReply() == 0)
				currentReply = 1;
			else
				currentReply = rv.getCurrentReply();
			

			this.rv = new ReplyDTO(currentReply, totalReply);
			this.rv.setNum(num);
			mav.addObject("rv", this.rv);
			mav.addObject("aList", Tourservice.replylistProcess(this.rv));
			
		}
		mav.addObject("numc",num);
		mav.setViewName("replycheck");
		
		return mav;
	}// end replylistviewMethod()//////////////////////////////////////////
	
	@RequestMapping(value= "/replylist.go" ,method = RequestMethod.GET)
	public ModelAndView replylistMethod(ReplyDTO rv,int Reply, int num ,BoardReplyDTO redto){
		ModelAndView mav = new ModelAndView();
		redto.setBoard_num(num);

		rv.setCurrentReply(Reply);
		int totalReply = Tourservice.replycountProcess(num);		
		
		if (totalReply >= 0) {
			if (rv.getCurrentReply() == 0)
				currentReply = 1;
			else
				currentReply = rv.getCurrentReply();
			
			this.rv = new ReplyDTO(currentReply, totalReply);
			this.rv.setNum(num);

			mav.addObject("rv", this.rv);
			mav.addObject("aList", Tourservice.replylistProcess(this.rv));
			
		}
		
		mav.setViewName("replylist");
		
		return mav;
	}// end replylistMethod()//////////////////////////////////////////
	
	
	@RequestMapping(value = "/write.go", method = RequestMethod.GET)	//write.sb를 GET방식으로 호출할때
	public ModelAndView writeMethod(PageDTO pv, TourBoardDTO dto,String category) {
		ModelAndView mav = new ModelAndView();
		dto.setBoard_category(category);
		
		mav.addObject("cate",dto.getBoard_category());
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.addObject("dto", dto);
		mav.setViewName("write");
		return mav;
	}// end writeMethod()/////////////////////////////
	
	@RequestMapping(value = "/write.go", method = RequestMethod.POST)
	public String writeProMethod(PageDTO pv, TourBoardDTO dto,HttpServletRequest request) {
		
		MultipartFile file = dto.getFilename();
		HttpSession session = request.getSession();		
		
		
		String nid= (String) session.getAttribute("nick");
		dto.setMember_board_nick(nid);
		
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();

			// 중복파일명을 처리하기 위해서 난수발생
			UUID random = UUID.randomUUID();
			String dd = (String)session.getAttribute("subject");
	        String root = request.getSession().getServletContext().getRealPath("/");
			String def = root.replace("tourstory", "tourimgs");
	        String saveDirectory = def + "temp"+ File.separator+dd+File.separator;
	      
			// String saveDirectory = root + "temp/" ;
			 
			File fe = new File(saveDirectory);
			if (!fe.exists())
				fe.mkdir();

			File ff = new File(saveDirectory, random + "_" + fileName);

			try {
				// 파라미터로 넘어온 파일첨부을 두번째 인자값에 출력한다.
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			dto.setBoard_upload(random + "_" + fileName);
		}
		
		Tourservice.insertProcess(dto);

		
		return "redirect:/list.go?currentPage="+pv.getCurrentPage()+"&board_category="+dto.getBoard_category();
	}// end writeProMethod()//////////////////////

	@RequestMapping(value = "/update.go", method = RequestMethod.GET)
	public ModelAndView updateForm(int num, int currentPage,String category, TourBoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cate",category);
		dto.setBoard_category(category);
		mav.addObject("dto", Tourservice.updateSelectProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("update");
		return mav;
	}// end updateForm//////////////////////

	@RequestMapping(value = "/update.go", method = RequestMethod.POST)
	public ModelAndView updateProc(TourBoardDTO dto, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		Tourservice.updateProcess(dto, request);
		//mav.addObject("dto", Tourservice.updateSelectProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/list.go?board_category="+dto.getBoard_category());
		return mav;
	}// end updateProc()//////////////////////////

	@RequestMapping("/delete.go")
	public ModelAndView deleteMethod(int num, int currentPage, 
			                    HttpServletRequest request,TourBoardDTO dto,String category) {
		ModelAndView mav = new ModelAndView();
		Tourservice.deleteProcess(num, request);
		
		dto.setBoard_category(category);
		PageDTO pv = new PageDTO(Tourservice.countProcess(dto));
		if (pv.getTotalPage() < currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		else		
		mav.addObject("currentPage", currentPage);		
		mav.setViewName("redirect:/list.go?board_category="+category);
		return mav;
	}//end deleteMethod()
	
	@RequestMapping("/imagePopup.go")
	public String imagePopip(){
		return "../../../resources/daumeditor/image";
	}//end imagePopip()/////////////////////////////////////////////////////
	
	@RequestMapping("/like.go")
	public ModelAndView likeMethod(int num, int currentPage){
		ModelAndView mav = new ModelAndView();
		int likecheck = Tourservice.likeProcess(num);
		mav.addObject("likecheck",likecheck);
		mav.setViewName("likecheck");
		
		return mav;
	}//end likeMethod()//////////////////////////////////////////////////
	
	
	// 단일 파일 업로드 Ajax
	@RequestMapping(value = "/Ajax.go", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> singleUploadImageAjax(@RequestParam("Filedata") MultipartFile multipartFile, HttpSession httpSession, HttpServletRequest request){
	    HashMap<String, Object> fileInfo = new HashMap<String, Object>(); //CallBack할 때 이미지 정보를 담을 Map
	    // 업로드 파일이 존재하면
	    
	    if(multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {
	         MyscheduleDTO dt = new MyscheduleDTO(); 
	        // 확장자 제한
	        String originalName = multipartFile.getOriginalFilename(); //실제 파일명
	        String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase(); //실제파일 확장자 (소문자변경)
	        if( !( (originalNameExtension.equals("jpg")) || (originalNameExtension.equals("gif")) || (originalNameExtension.equals("png")) || (originalNameExtension.equals("bmp")) ) ){
	            fileInfo.put("result", -1); //허용 확장자가 아닐 경우
	            return fileInfo;
	        }
	         
	        // 파일크기제한 (5MB)
	        long filesize = multipartFile.getSize(); //파일크기
	        long limitFileSize = 5*1024*1024; //5MB
	        if(limitFileSize < filesize){ //제한보다 파일크기가 클 경우
	            fileInfo.put("result", -2);
	            return fileInfo;
	        }
	         
	        // 저장경로
	        String  dd = (String)httpSession.getAttribute("subject");
	        String defaultPath = request.getSession().getServletContext().getRealPath("/");
	        String def = defaultPath.replace("tourstory", "tourimgs");
	        String path = def + "temp"+ File.separator + dd + File.separator;
	        //String path = "C:" + File.separator+"temp" + File.separator;
	        //String path = defaultPath + "resources" +File.separator+"temp"+File.separator;
	        //String path = "C:\\ym\\workspace_spring\\.metadataa\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\YM\\temp\\";
	        
	        // 저장경로 처리
	        File file = new File(path);
	        if(!file.exists()) { //디렉토리 존재하지 않을경우 디렉토리 생성
	            file.mkdirs();
	        }
	         
	        // 파일 저장명 처리 (20150702091941-fd8-db619e6040d5.확장자)
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String today= formatter.format(new Date());
	        String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) +"_"+ originalName +"." + originalNameExtension;
	        
	        TourBoardDTO dto = new TourBoardDTO();
	        dto.setBoard_subject(dd);
	        dto.setBoard_image(modifyName);
	        Tourservice.image(dto);
	        // Multipart 처리
	        try{
	            //서버에 파일 저장 (쓰기)
	            multipartFile.transferTo(new File(path + modifyName));
	             
	            // 로그
	            System.out.println("** upload 정보 **");
	            System.out.println("** path : " + path + " **");
	            System.out.println("** originalName : " + originalName + " **");
	            System.out.println("** modifyName : " + modifyName + " **");
	        }
	        catch (Exception e){
	            e.printStackTrace();
	            System.out.println("/ 이미지파일업로드 실패 - Ajax");
	        }
	         
	        // CallBack - Map에 담기
	        String imageurl = "/tourimgs/temp/"+dd+"/" + modifyName; //separator와는 다름!
	    
	        
	        fileInfo.put("imageurl", imageurl);     //상대파일경로(사이즈변환이나 변형된 파일)
	        fileInfo.put("filename", originalName);   //파일명
	        fileInfo.put("filesize", filesize);     //파일사이즈
	        fileInfo.put("imagealign", "C");        //이미지정렬(C:center)
	        fileInfo.put("originalurl", modifyName);  //실제파일경로   (변형된파일명으로수정)
	        fileInfo.put("thumburl", imageurl);     //썸네일파일경로(사이즈변환이나 변형된 파일)
	         
	        fileInfo.put("result", 1); //-1, -2를 제외한 아무거나 싣어도 됨
	    }
	     
	    return fileInfo; //@ResponseBody 어노테이션을 사용하여 Map을 JSON형태로 반환
	}


}// end class
