package dao;

import java.util.List;

import TourBoardDto.PageDTO;
import dto.TourStoryQnaDTO;

public interface TourStoryQnaDAO {
	public int count(TourStoryQnaDTO dto);

	public List<TourStoryQnaDTO> noticelist(PageDTO pv);

	public void readCount(int num);

	public TourStoryQnaDTO content(int num);

	public void reStepCount(TourStoryQnaDTO dto);

	public void save(TourStoryQnaDTO dto);

	public TourStoryQnaDTO updateNum(int num);

	public void update(TourStoryQnaDTO dto);

	public void delete(int num);

}
