package TourBoardDao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import TourBoardDto.BoardReplyDTO;
import TourBoardDto.PageDTO;
import TourBoardDto.ReplyDTO;
import TourBoardDto.TourBoardDTO;

public class TourBoardDaoImp implements TourBoardDAO{
	
	private SqlSessionTemplate sql;
	public TourBoardDaoImp() {
			
	}
	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	@Override
	public int count(TourBoardDTO dto) {
		return sql.selectOne("scinfo.count",dto);
	}
	@Override
	public int countAll() {
		return sql.selectOne("scinfo.countAll");
	}
	
	@Override
	public int replycount(int num) {
		return sql.selectOne("scinfo.replycount",num);
	}
	
	@Override
	public List<TourBoardDTO> list(PageDTO pv) {
		return sql.selectList("scinfo.blist",pv);
	}
	
	@Override
	public List<BoardReplyDTO> replylist(ReplyDTO rv) {
		return sql.selectList("scinfo.replylist",rv);
	}
	
	@Override
	public void readCount(int num) {
		sql.update("scinfo.readCount",num);
		
	}
	
	@Override
	public TourBoardDTO content(int num) {
		return sql.selectOne("scinfo.content",num);
	}
	
	@Override
	public void save(TourBoardDTO dto) {
		sql.insert("scinfo.save",dto);
	}
	
	@Override
	public TourBoardDTO updateNum(int num) {
		return sql.selectOne("scinfo.content",num);
	}
	
	@Override
	public void update(TourBoardDTO dto) {
		sql.update("scinfo.update",dto);
		
	}
	
	@Override
	public void delete(int num) {
		sql.delete("scinfo.delete",num);
		
	}
	
	@Override
	public String getFile(int num) {
		return sql.selectOne("scinfo.getfile",num);
	}
	public String getSubject(int num){
		return sql.selectOne("scinfo.getsubject",num);
	}
	
	@Override
	public void reply(BoardReplyDTO dto) {
		sql.insert("scinfo.reply",dto);
	}
	
	@Override
	public int like(int num) {
		sql.update("scinfo.likeup",num);
		return sql.selectOne("scinfo.like",num);
	}
	@Override
	public List<TourBoardDTO> search_sb(PageDTO pv) {
		return sql.selectList("scinfo.search_sb", pv);
		
	}
	@Override
	public int count_sb(TourBoardDTO dto) {
		return sql.selectOne("scinfo.count_sb",dto);
	}
	@Override
	public List<TourBoardDTO> mytour(PageDTO pv) {
		return sql.selectList("scinfo.nicklist", pv);
	}
	@Override
	public int myCount(TourBoardDTO dto) {
		return sql.selectOne("scinfo.mycount", dto);
	}
	@Override
	public List<TourBoardDTO> checktour(PageDTO pv) {
		return sql.selectList("scinfo.checktour", pv);
	}
	@Override
	public void close(TourBoardDTO dto) {
		sql.update("scinfo.close",dto);
	}
	@Override
	public List<TourBoardDTO> bestlike() {
		return sql.selectList("scinfo.bestlike");
	}
	@Override
	public void replydelete(int num) {
		sql.delete("scinfo.replydelete",num);
		
	}
	@Override
	public void image(TourBoardDTO dto) {
		sql.insert("scinfo.image",dto);
		
	}
	@Override
	public List<TourBoardDTO> imagecheck(String subject) {
		return sql.selectList("scinfo.imagecheck",subject);
	}
	@Override
	public void deleteimage(String image) {
		sql.delete("scinfo.deleteimage",image);
	}
	@Override
	public String contentload(int num) {
		return sql.selectOne("scinfo.contentload",num);
	}
	@Override
	public List<TourBoardDTO> klike() {
		return sql.selectList("scinfo.klike");
	}
	@Override
	public List<TourBoardDTO> rlike() {
		return sql.selectList("scinfo.rlike");
	}
	@Override
	public List<TourBoardDTO> hlike() {
		return sql.selectList("scinfo.hlike");
	}
	@Override
	public List<TourBoardDTO> tlike() {
		return sql.selectList("scinfo.tlike");
	}
}//end class
