package TourBoardDto;

public class ReplyDTO {
	private int currentReply; // 현재댓글페이지
	private int totalReply; // 총 댓글수
	private int blockReplyCount = 5; // 한 페이지에 보여줄 댓글수
	private int blockReplyPage = 5; // 한 블록에 보여줄 댓글페이지수
	private int totalReplyPage; // 총 댓글페이지수
	private int startReply; // 시작 댓글 번호
	private int endReply; // 끝 댓글 번호
	private int startReplyPage; // 한 블록의 시작 댓글페이지 번호
	private int endReplyPage; // 한 블록의 끝 댓글페이지 번호
	private int num ;
	public ReplyDTO() {
		
	}

	public ReplyDTO(int totalReply){
		//총 댓글페이지수
		totalReplyPage=totalReply/blockReplyCount+(totalReply%blockReplyCount==0?0:1);
	}
	
	public ReplyDTO(int currentReply, int totalReply) {
		this.currentReply = currentReply;
		this.totalReply = totalReply;
		
		//시작레코드
		startReply = (currentReply-1) * blockReplyCount + 1;
				
		//끝레코드
		endReply = startReply + blockReplyCount - 1;		
				
		//총페이지수
		totalReplyPage=totalReply/blockReplyCount+(totalReply%blockReplyCount==0?0:1);
	                 
		//시작페이지
		startReplyPage=(int)((currentReply-1)/blockReplyPage)*blockReplyPage+1;
								
		//끝페이지
		endReplyPage=startReplyPage+blockReplyPage-1;
		if(totalReplyPage<endReplyPage)
			endReplyPage=totalReplyPage;
				
	}

	public int getCurrentReply() {
		return currentReply;
	}

	public void setCurrentReply(int currentReply) {
		this.currentReply = currentReply;
	}

	public int getTotalReply() {
		return totalReply;
	}

	public void setTotalReply(int totalReply) {
		this.totalReply = totalReply;
	}

	public int getBlockReplyCount() {
		return blockReplyCount;
	}

	public void setBlockReplyCount(int blockReplyCount) {
		this.blockReplyCount = blockReplyCount;
	}

	public int getBlockReplyPage() {
		return blockReplyPage;
	}

	public void setBlockReplyPage(int blockReplyPage) {
		this.blockReplyPage = blockReplyPage;
	}

	public int getTotalReplyPage() {
		return totalReplyPage;
	}

	public void setTotalReplyPage(int totalReplyPage) {
		this.totalReplyPage = totalReplyPage;
	}

	public int getStartReply() {
		return startReply;
	}

	public void setStartReply(int startReply) {
		this.startReply = startReply;
	}

	public int getEndReply() {
		return endReply;
	}

	public void setEndReply(int endReply) {
		this.endReply = endReply;
	}

	public int getStartReplyPage() {
		return startReplyPage;
	}

	public void setStartReplyPage(int startReplyPage) {
		this.startReplyPage = startReplyPage;
	}

	public int getEndReplyPage() {
		return endReplyPage;
	}

	public void setEndReplyPage(int endReplyPage) {
		this.endReplyPage = endReplyPage;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
}
