package domain;

public class CommentVO {
	private int cno;
	private int bno; 
	private String writer;
	private String content;
	private String regdate;
	
	public CommentVO() {}

	//insert
	public CommentVO(int bno, String writer, String content) {
		this.bno = bno; //어떤 게시글에
		this.writer = writer; //누가 댓글을 다는지
		this.content = content; 
	}

	//update
	public CommentVO(int cno, String content) {
		this.cno = cno;
		this.content = content;
	}
	
	//list
	public CommentVO(int cno, int bno, String writer, String content, String regdate) {
		this.cno = cno;
		this.bno = bno;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", bno=" + bno + ", writer=" + writer + ", content=" + content + ", regdate="
				+ regdate + "]";
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
