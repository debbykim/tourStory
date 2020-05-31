package TourService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import TourBoardDto.PageDTO;
import dao.TourStoryQnaDAO;
import dto.TourStoryQnaDTO;

public class TourStoryQnaServiceImp implements TourStoryQnaService {
	private TourStoryQnaDAO bdao;

	public TourStoryQnaServiceImp() {

	}

	public void setBdao(TourStoryQnaDAO bdao) {
		this.bdao = bdao;
	}

	@Override
	public int countProcess(TourStoryQnaDTO dto) {
		return bdao.count(dto);
	}
	
	// 제목글
	@Override
	public void insertProcess(TourStoryQnaDTO dto) {
		bdao.save(dto);
	}

	@Override
	public TourStoryQnaDTO contentProcess(int num) {
		bdao.readCount(num);
		return bdao.content(num);
	}

	@Override
	public void reStepProcess(TourStoryQnaDTO dto) {
		bdao.reStepCount(dto);
		dto.setQna_re_level(dto.getQna_re_level() + 1);
		dto.setQna_re_step(dto.getQna_re_step() + 1);
		bdao.save(dto);
	}

	@Override
	public TourStoryQnaDTO updateSelectProcess(int num) {
		return bdao.updateNum(num);
	}

	@Override
	public void updateProcess(TourStoryQnaDTO dto) {
		bdao.update(dto);
	}

	@Override
	public String deleteProcess(int num, HttpServletRequest request) {
		bdao.delete(num);
		return null;
	}

	@Override
	public List<TourStoryQnaDTO> listProcess(PageDTO pv) {
		return bdao.noticelist(pv);
	}//end listProcess

}// end class
