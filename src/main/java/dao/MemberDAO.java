package dao;

import java.util.List;

import dto.MemberDTO;

public interface MemberDAO {
	public void join(MemberDTO dto);

	public String nidc(String nid);

	public String idc(String id);

	public String emailChk(String email);
	
	public int login(MemberDTO dto);

	public String pwc(MemberDTO pwc);
	
	public List<MemberDTO> findid(MemberDTO dto);
	
	public String fnick(MemberDTO dto);
	
	public String femail(MemberDTO dto);
	
	public void pwUpdate(MemberDTO dto);
	
	public int existCheck(MemberDTO dto);
	
	public void setnewPass(MemberDTO dto);
}
