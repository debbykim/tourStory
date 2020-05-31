package TourBoardDao;

import java.util.List;

import TourBoardDto.BoardReplyDTO;
import TourBoardDto.PageDTO;
import TourBoardDto.ReplyDTO;
import TourBoardDto.TourBoardDTO;



public interface TourBoardDAO {
	public int count(TourBoardDTO dto);
	public int countAll();
	public int count_sb(TourBoardDTO dto);
	public int replycount(int num);
	public int myCount(TourBoardDTO dto);
	public List<TourBoardDTO> list(PageDTO pv);
	public List<BoardReplyDTO> replylist(ReplyDTO rv);
	public void readCount(int num);
	public TourBoardDTO content(int num);
	public void save(TourBoardDTO dto);
	public TourBoardDTO updateNum(int num);
	public void update(TourBoardDTO dto);
	public void delete(int num);
	public void deleteimage(String image);
	public String getFile(int num);
	public String getSubject(int num);
	public void reply(BoardReplyDTO dto);
	public List<TourBoardDTO> search_sb(PageDTO pv);
	public int like(int num);
	public List<TourBoardDTO> mytour(PageDTO pv);
	public List<TourBoardDTO> checktour(PageDTO pv);
	public void close(TourBoardDTO dto);
	public List<TourBoardDTO> bestlike();
	public void replydelete(int num);
	public void image(TourBoardDTO dto);
	public List<TourBoardDTO> imagecheck(String subject);
	public String contentload(int num);
	public List<TourBoardDTO> klike();
	public List<TourBoardDTO> rlike();
	public List<TourBoardDTO> hlike();
	public List<TourBoardDTO> tlike();
}
