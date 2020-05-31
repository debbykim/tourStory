package controller;


import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import javax.mail.MessagingException;

import dao.MemberDaoImp;
import dto.MemberDTO;

@Controller
public class TourLoginController {
	private MemberDaoImp dao;

	public TourLoginController() {
	}

	public void setDao(MemberDaoImp dao) {
		this.dao = dao;
	}

	// 로그인
	@RequestMapping(value = "/tourLogin.do", method = RequestMethod.GET)
	public String proc() {
		return "login";
	}

	// 로그인 프로세스
	@RequestMapping(value = "/tourloginProcess.do", method = RequestMethod.POST)
	public ModelAndView post(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDTO dto = new MemberDTO();
		dto.setMember_id(id);
		dto.setMember_pass(pw);

		String nick = dao.fnick(dto);
		String email = dao.femail(dto);

		dto.setMember_nickname(nick);
		dto.setMember_email(email);

		int che = dao.login(dto);

		if (che == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("nick", nick);
			session.setAttribute("email", email);
			session.setMaxInactiveInterval(30 * 60);
			mav.setViewName("redirect:/");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	@RequestMapping("/appLogin.do")
	public ModelAndView appLoginProc(MemberDTO dto){
		ModelAndView mav = new ModelAndView();
		
		System.out.println("appLogin.do !!!DTO!!! id="+dto.getMember_id()+"////pass="+dto.getMember_pass());
		
		String jsonTxt="";
		String msg="";
		int chk = dao.login(dto);
		
		if(chk == 1){
			msg = "로그인승인";
			String nick = dao.fnick(dto);
			String email = dao.femail(dto);
			jsonTxt = "{\"result\":[{\"id\":\""+dto.getMember_id()+"\"},{\"nick\":\""+nick+"\"},{\"email\":\""+email+"\"},{\"msg\":\""+msg+"\"}]}";
			
		}else{
			msg = "등록요망";
			jsonTxt = "{\"result\":[{\"id\":\""+dto.getMember_id()+"\"},{\"msg\":\""+msg+"\"}]}";
		}
		
		mav.addObject("jsonTxt", jsonTxt);
		mav.setViewName("jsontest");
		return mav;
	}// appLoginProc
	
	// 로그아웃 처리
	@RequestMapping("/tourlogoutProcess.do")
	public ModelAndView sessionRemove(HttpServletRequest request) {
		System.out.println("logout");

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("nick");
		session.removeAttribute("email");

		session.invalidate();
		mav.setViewName("redirect:/");

		return mav;
	}

	// 회원가입화면
	@RequestMapping("/tourForm.do")
	public String doget() {
		return "MemberLoing";
	}

	// 회원가입 인서트
	@RequestMapping(value = "/tourJoin.do", method = RequestMethod.POST)
	public ModelAndView neu(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		dao.join(dto);
		
		mav.setViewName("redirect:/");		
		return mav;
	}

	// 닉네임 중복확인
	@RequestMapping("/nidCheck.do")
	public ModelAndView nidc(String join_name) {
		ModelAndView mav = new ModelAndView();

		String nidC = dao.nidc(join_name);

		int chk = 0;

		if (!(join_name.equals(nidC))) {
			chk = 0;
		} else if (join_name.equals(nidC)) {
			chk = 1;
		}

		mav.addObject("check_name", chk);
		mav.setViewName("jsonView");

		return mav;
	}

	// 아이디 중복확인
	@RequestMapping("/idCheck.do")
	public ModelAndView idc(String join_id) {
		ModelAndView mav = new ModelAndView();

		String idC = dao.idc(join_id);

		int chk = 0;

		if (!(join_id.equals(idC))) {
			chk = 0;
		} else if (join_id.equals(idC)) {
			chk = 1;
		}
		mav.addObject("check_id", chk);
		mav.setViewName("jsonView");
		return mav;
	}

	// 이메일 중복확인
	@RequestMapping("/emailCheck.do")
	public ModelAndView emailChk(String join_email) {
		ModelAndView mav = new ModelAndView();

		String mailChk = dao.emailChk(join_email);

		int chk = 0;

		if (!(join_email.equals(mailChk))) {
			chk = 0;
		} else if (join_email.equals(mailChk)) {
			chk = 1;
		}

		mav.addObject("check_id", chk);
		mav.setViewName("jsonView");
		return mav;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/pwHelp.do", method = RequestMethod.POST)
	public ModelAndView pw(MemberDTO dto) throws MessagingException{
		ModelAndView mav = new ModelAndView();
		int pw = 0;
		int id = 0;

		if (dto.getMember_email() != null) {

			List<MemberDTO> fid = dao.findid(dto);
			
			//메일발송
			
			  String host = "smtp.gmail.com";
		         String username = "tourstory1111@gmail.com";
		         String password = "tourstory";
		          
		         // 메일 내용
		         String recipient = dto.getMember_email();
		         String subject = "TourStory에서 발송한 메일입니다.";
		         String body = fid.get(0).getMember_nickname()+"님의 아이디는 "+fid.get(0).getMember_id()+" 입니다.";
		          
		         //properties 설정
		         Properties props = new Properties();
		         props.put("mail.smtps.auth", "true");
		         // 메일 세션
		         Session session = Session.getDefaultInstance(props);
		         MimeMessage msg = new MimeMessage(session);
		  
		         // 메일 관련
		         msg.setSubject(subject);
		         msg.setText(body);
		         msg.setFrom(new InternetAddress(username));
		         msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		  
		         // 발송 처리
		         Transport transport = session.getTransport("smtps");
		         transport.connect(host, username, password);
		         transport.sendMessage(msg, msg.getAllRecipients());
		         transport.close(); 

			if (fid.get(0).getMember_id() == null || fid.get(0).getMember_id().length() == 0) {
				id = 0;
			} else {
				id = 1;
			}
		} else {
			if (dto.getMember_id() == null || dto.getMember_id().equals("") || dto.getMember_id().equals("null"))
				dto.setMember_id("00");

			String pwdto = dao.pwc(dto);

			if (pwdto == null || pwdto.length() == 0) {
				pw = 0;
			} else {
				pw = 1;
			}

		} // end if~else
		
		
		
		     
	         

		mav.addObject("id", id);
		mav.addObject("password", pw);
		mav.setViewName("jsonView");
		return mav;
	}// end pw()
	
	// 마이페이지에서 비밀번호 수정
	@RequestMapping(value = "/pwUpdate.do", method = RequestMethod.POST)
	public ModelAndView pwUpdate(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		dao.pwUpdate(dto);
		mav.setViewName("jsonView");
		return mav;
	}//end pwUpdate()
	
	
	// 비밀번호 찾기 시 아이디, 이메일 존재 확인
	@RequestMapping(value = "/findpass_check.do", method = RequestMethod.POST)
	public ModelAndView existCheck(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();	
		int ex = dao.existCheck(dto);
		
		mav.addObject("exid", dto.getMember_id());
		mav.addObject("exemail", dto.getMember_email());
		mav.addObject("exist", ex);
		mav.setViewName("jsonView");
		return mav;
	}//end setnewPass()
	
	// 비밀번호 찾기 시 새비밀번호 설정
	@RequestMapping(value = "/findpass_update.do", method = RequestMethod.POST)
	public ModelAndView setnewPass(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		dao.setnewPass(dto);
		mav.setViewName("jsonView");
		return mav;
	}//end setnewPass()
}// end class
