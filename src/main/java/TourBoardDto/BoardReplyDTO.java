package TourBoardDto;

import java.sql.Date;

public class BoardReplyDTO {
	private int board_num,reply_num;
	private String member_reply_nick,reply_content;
	private Date reply_date;

	
	public BoardReplyDTO() {
		
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getMember_reply_nick() {
		return member_reply_nick;
	}

	public void setMember_reply_nick(String member_reply_nick) {
		this.member_reply_nick = member_reply_nick;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
}
