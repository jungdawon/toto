package board.dto;

import java.sql.Timestamp;

public class RepDTO {
	private int repnum;	
	private int keynum;//��۹�ȣ
	private int num;
	private String pw;
	private String writer;//�ۼ���
    private String content;//����
    private Timestamp reg_date;//�ۼ��Ͻ�
	public int getRepnum() {
		return repnum;
	}
	public void setRepnum(int repnum) {
		this.repnum = repnum;
	}
	public int getKeynum() {
		return keynum;
	}
	public void setKeynum(int keynum) {
		this.keynum = keynum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
    
    
	
}
