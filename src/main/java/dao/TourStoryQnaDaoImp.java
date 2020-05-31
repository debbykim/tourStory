package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import TourBoardDto.PageDTO;
import dto.TourStoryQnaDTO;

public class TourStoryQnaDaoImp implements TourStoryQnaDAO {

	private SqlSessionTemplate sqlSession;

	public TourStoryQnaDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count(TourStoryQnaDTO dto) {
		return sqlSession.selectOne("notice.count", dto);
	}
	
	@Override
	public void readCount(int num) {
		sqlSession.update("notice.readCount", num);
	}

	@Override
	public TourStoryQnaDTO content(int num) {
		return sqlSession.selectOne("notice.content", num);
	}

	@Override
	public void reStepCount(TourStoryQnaDTO dto) {
		sqlSession.update("notice.reStepCount", dto);
	}

	// 제목글 저장
	@Override
	public void save(TourStoryQnaDTO dto) {
		sqlSession.insert("notice.save", dto);
	}

	@Override
	public TourStoryQnaDTO updateNum(int num) {
		return sqlSession.selectOne("notice.content", num);
	}

	@Override
	public void update(TourStoryQnaDTO dto) {
		sqlSession.update("notice.update", dto);
	}

	@Override
	public void delete(int num) {
		sqlSession.delete("notice.delete", num);
	}

	@Override
	public List<TourStoryQnaDTO> noticelist(PageDTO pv) {
		return sqlSession.selectList("notice.list",pv);
	}
}// end class
