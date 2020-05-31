package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MemberDTO;

public class MemberDaoImp implements MemberDAO {
	private SqlSessionTemplate sqlSession;

	public MemberDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void join(MemberDTO dto) {
		sqlSession.insert("member.join", dto);
	}

	@Override
	public String nidc(String nid) {
		return sqlSession.selectOne("member.nidc", nid);
	}

	@Override
	public int login(MemberDTO dto) {
		return sqlSession.selectOne("member.login", dto);
	}

	@Override
	public String idc(String id) {
		return sqlSession.selectOne("member.idc", id);
	}

	@Override
	public String pwc(MemberDTO pw) {
		return sqlSession.selectOne("member.pwc", pw);
	}

	@Override
	public List<MemberDTO> findid(MemberDTO dto) {
		
		return sqlSession.selectList("member.email", dto);
	}

	@Override
	public String fnick(MemberDTO dto) {
		return sqlSession.selectOne("member.fnick", dto);
	}
	
	@Override
	public String femail(MemberDTO dto) {
		return sqlSession.selectOne("member.femail", dto);
	}

	@Override
	public String emailChk(String email) {
		return sqlSession.selectOne("member.emailc", email);
	}

	@Override
	public void pwUpdate(MemberDTO dto) {
		sqlSession.update("member.pwUdt",dto);
	}

	@Override
	public void setnewPass(MemberDTO dto) {
		sqlSession.update("member.nPassword", dto);
	}

	@Override
	public int existCheck(MemberDTO dto) {
		return sqlSession.selectOne("member.existchk", dto);
	}
}// end class
