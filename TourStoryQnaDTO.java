package dto;

import java.util.Date;

public class TourStoryQnaDTO {
	private int qna_num;
	private String member_qna_nick;
	private String qna_subject;
	private String qna_content;
	private Date qna_date;
	private int qna_readcount;
	private int qna_ref_num;
	private int qna_re_level;
	private int qna_re_step;
	private String qna_category;

	public TourStoryQnaDTO() {

	}

	public int getQna_re_step() {
		return qna_re_step;
	}

	public void setQna_re_step(int qna_re_step) {
		this.qna_re_step = qna_re_step;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}


	public String getMember_qna_nick() {
		return member_qna_nick;
	}

	public void setMember_qna_nick(String member_qna_nick) {
		this.member_qna_nick = member_qna_nick;
	}

	public String getQna_subject() {
		return qna_subject;
	}

	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public int getQna_readcount() {
		return qna_readcount;
	}

	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}

	public int getQna_ref_num() {
		return qna_ref_num;
	}

	public void setQna_ref_num(int qna_ref_num) {
		this.qna_ref_num = qna_ref_num;
	}

	public int getQna_re_level() {
		return qna_re_level;
	}

	public void setQna_re_level(int qna_re_level) {
		this.qna_re_level = qna_re_level;
	}

	public String getQna_category() {
		return qna_category;
	}

	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}

}
