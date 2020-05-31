package TourBoardDto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class TourBoardDTO {
	private int board_num, board_readcount,board_like,board_close;
	private String member_board_nick,board_subject,board_upload,board_content,board_category,board_image;
	private Date board_date;
	private MultipartFile filename;
	private String SearchKey,search_category;
	

	public TourBoardDTO() {
		
	}

	public String getBoard_image() {
		return board_image;
	}

	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}

	public int getBoard_close() {
		return board_close;
	}

	public void setBoard_close(int board_close) {
		this.board_close = board_close;
	}

	public String getSearch_category() {
		return search_category;
	}

	public void setSearch_category(String search_category) {
		this.search_category = search_category;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public String getMember_board_nick() {
		return member_board_nick;
	}

	public String getSearchKey() {
		return SearchKey;
	}

	public void setSearchKey(String searchKey) {
		SearchKey = searchKey;
	}

	public void setMember_board_nick(String member_board_nick) {
		this.member_board_nick = member_board_nick;
	}

	public String getBoard_subject() {
		return board_subject;
	}

	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}

	public String getBoard_upload() {
		return board_upload;
	}

	public void setBoard_upload(String board_upload) {
		this.board_upload = board_upload;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	
	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
	
}
