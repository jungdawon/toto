package board.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardDTO {

private int num; 
private String local; 
private String	subject;
private String	writer; 
private String	content; 
private String	pw;
private Date reg;
private int readcount;

public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getLocal() {
	return local;
}
public void setLocal(String local) {
	this.local = local;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
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
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public Date getReg() {
	return reg;
}
public void setReg(Date reg) {
	this.reg = reg;
}
public int getReadcount() {
	return readcount;
}
public void setReadcount(int readcount) {
	this.readcount = readcount;
}



}
