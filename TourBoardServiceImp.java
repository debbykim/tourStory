package TourService;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import TourBoardDao.TourBoardDAO;
import TourBoardDto.BoardReplyDTO;
import TourBoardDto.PageDTO;
import TourBoardDto.ReplyDTO;
import TourBoardDto.TourBoardDTO;

public class TourBoardServiceImp implements TourBoardService{
	private TourBoardDAO Tourdao;
	
	public TourBoardServiceImp() {
		
	}
	
	public void setTourdao(TourBoardDAO tourdao) {
		this.Tourdao = tourdao;
	}

	@Override
	public int countProcess(TourBoardDTO dto) {
		return Tourdao.count(dto);
	}
	
	@Override
	public int countAllProcess() {	
		return Tourdao.countAll();
	}

	
	@Override
	public int replycountProcess(int num) {
		return Tourdao.replycount(num);
	}
	
	@Override
	public List<TourBoardDTO> listProcess(PageDTO pv) {
		return Tourdao.list(pv);
	}
	
	@Override
	public List<BoardReplyDTO> replylistProcess(ReplyDTO rv) {
		return Tourdao.replylist(rv);
	}
	
	@Override
	public void insertProcess(TourBoardDTO dto) {
		Tourdao.save(dto);
	}
	
	@Override
	public TourBoardDTO contentProcess(int num) {
		
		return Tourdao.content(num);
	}
	
	@Override
	public TourBoardDTO updateSelectProcess(int num) {
		return Tourdao.updateNum(num);
	}
	
	@Override
	public void updateProcess(TourBoardDTO dto, HttpServletRequest request) {
		String filename = Tourdao.getFile(dto.getBoard_num());
		System.out.println("파일이름"+filename);
		String root = request.getSession().getServletContext().getRealPath("/");
		String def = root.replace("tourstory", "tourimgs");
        String saveDirectory = def + "temp"+ File.separator+dto.getBoard_subject()+File.separator;
		File fdir = new File(saveDirectory);
		if (!fdir.exists())
			fdir.mkdir();

		MultipartFile file = dto.getFilename();

		// 수정할 첨부파일이 있으면....
		if (!file.isEmpty()) {
			// 중복파일명을 처리하기 위해서 난수발생
			UUID random = UUID.randomUUID();

			// 기존 첨부파일이 있으면....
			if (filename != null) {
				File fe = new File(saveDirectory, filename);
				fe.delete();
			}

			String fileName = file.getOriginalFilename();
			dto.setBoard_upload(random + "_" + fileName);

			File ff = new File(saveDirectory, random + "_" + fileName);
			// 파라미터로 넘어온 파일첨부을 두번째 인자값에 출력한다.
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Tourdao.update(dto);
	}

	@Override
	public String deleteProcess(int num, HttpServletRequest request) {
		Tourdao.replydelete(num);
		String subject = Tourdao.getSubject(num);
		String upload = Tourdao.getFile(num);
		String root = request.getSession().getServletContext().getRealPath("/");
		String def = root.replace("tourstory", "tourimgs");
        String saveDirectory = def + "temp"+ File.separator+subject+File.separator;
        String path = def + "temp"+File.separator;
        List<TourBoardDTO> ilist = Tourdao.imagecheck(subject);
        File fe = new File(saveDirectory);
        
		if (fe.exists()) {	
			File ff = new File(path,subject);
			File fu = new File(saveDirectory,upload);
			for(int i = 0 ; i<ilist.size();i++){
				File fi= new File(saveDirectory,ilist.get(i).getBoard_image());
				fi.delete();
			}
			if(fu.exists()){
				fu.delete();	
			}
			
			ff.delete();
		}
		Tourdao.delete(num);
		Tourdao.deleteimage(subject);
		return null;
	}

	@Override
	public void replyProcess(BoardReplyDTO dto) {
		Tourdao.reply(dto);
		
	}

	@Override
	public void readProcess(int num) {
		Tourdao.readCount(num);
	}
	

	@Override
	public int likeProcess(int num) {
		return Tourdao.like(num);
	}

	@Override
	public List<TourBoardDTO> searchsbProcess(PageDTO pv) {
		return Tourdao.search_sb(pv);
	}


	@Override
	public int countsbPro(TourBoardDTO dto) {
		return Tourdao.count_sb(dto);
	}

	@Override
	public List<TourBoardDTO> mytourProcess(PageDTO pv) {
		return Tourdao.mytour(pv);
	}

	@Override
	public int myCountProcess(TourBoardDTO dto) {
		return Tourdao.myCount(dto);
	}

	@Override
	public List<TourBoardDTO> tourcheckProcess(PageDTO pv) {
		return Tourdao.checktour(pv);
	}

	@Override
	public void closeProcess(TourBoardDTO dto) {
			Tourdao.close(dto);
	}
	@Override
	public void updateScheduleProc(TourBoardDTO dto) {
		Tourdao.update(dto);
	}

	@Override
	public List<TourBoardDTO> bestlikePro() {
		return Tourdao.bestlike();
	}

	@Override
	public void image(TourBoardDTO dto) {
		Tourdao.image(dto);
	}

	@Override
	public List<TourBoardDTO> imagecheck(String subject) {
		return Tourdao.imagecheck(subject);
	}

	@Override
	public String contentload(int num) {
		return Tourdao.contentload(num);
	}

	@Override
	public List<TourBoardDTO> klike() {
		return Tourdao.klike();
	}

	@Override
	public List<TourBoardDTO> rlike() {
		return Tourdao.rlike();
	}

	@Override
	public List<TourBoardDTO> hlike() {
		return Tourdao.hlike();
	}

	@Override
	public List<TourBoardDTO> tlike() {
		return Tourdao.tlike();
	}
}