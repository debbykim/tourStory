package TourService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import TourBoardDto.BoardReplyDTO;
import TourBoardDto.PageDTO;
import TourBoardDto.ReplyDTO;
import TourBoardDto.TourBoardDTO;

public interface TourBoardService {
	public int countProcess(TourBoardDTO dto);
	public int myCountProcess(TourBoardDTO dto);
	public int countAllProcess();
	public int countsbPro(TourBoardDTO dto);
	public int replycountProcess(int num);
	public List<TourBoardDTO> mytourProcess(PageDTO pv);
	public List<TourBoardDTO> listProcess(PageDTO pv);
	public List<BoardReplyDTO> replylistProcess(ReplyDTO rv);
	public void insertProcess(TourBoardDTO dto);
	public TourBoardDTO contentProcess(int num);
	public void readProcess(int num);
	public TourBoardDTO updateSelectProcess(int num);
	public void updateProcess(TourBoardDTO dto,HttpServletRequest request);
	public String deleteProcess(int num,HttpServletRequest request);
	public void replyProcess(BoardReplyDTO dto);
	public List<TourBoardDTO> searchsbProcess(PageDTO pv);
	public int likeProcess(int num);
	public List<TourBoardDTO> tourcheckProcess(PageDTO pv);
	public void closeProcess(TourBoardDTO dto);
	public void updateScheduleProc(TourBoardDTO dto);
	public List<TourBoardDTO> bestlikePro();
	public void image(TourBoardDTO dto);
	public List<TourBoardDTO> imagecheck(String subject);
	public String contentload(int num);
	public List<TourBoardDTO> klike();
	public List<TourBoardDTO> rlike();
	public List<TourBoardDTO> hlike();
	public List<TourBoardDTO> tlike();
}
