package TourService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import TourBoardDto.PageDTO;
import dto.TourStoryQnaDTO;

public interface TourStoryQnaService {
	public int countProcess(TourStoryQnaDTO dto);

	public List<TourStoryQnaDTO> listProcess(PageDTO pv);

	public void insertProcess(TourStoryQnaDTO dto);

	public TourStoryQnaDTO contentProcess(int num);

	public void reStepProcess(TourStoryQnaDTO dto);

	public TourStoryQnaDTO updateSelectProcess(int num);

	public void updateProcess(TourStoryQnaDTO dto);

	public String deleteProcess(int num, HttpServletRequest request);
}
