package admin;

import java.sql.Timestamp;
//ToTo 충전(머니) 관련 DTO
public class payData {
	private int num;	//기본키
	private String id;	//회원 id
	private int price;	//충전 가격
	private String rstoreid;	//상점 id
	private String rapprno;		//승인번호
	private String rapprtm;		//승인일시
	private String rdealno;		//거래번호
	private String job;			//거래방식
	private Timestamp pay_date;	//충전 시간
	
	//Join
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	private String bank;
	private String account;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getNum(){
		return num;
	}
	public void setNum(int num){
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRstoreid() {
		return rstoreid;
	}
	public void setRstoreid(String rstoreid) {
		this.rstoreid = rstoreid;
	}
	public String getRapprno() {
		return rapprno;
	}
	public void setRapprno(String rapprno) {
		this.rapprno = rapprno;
	}
	public String getRapprtm() {
		return rapprtm;
	}
	public void setRapprtm(String rapprtm) {
		this.rapprtm = rapprtm;
	}
	public String getRdealno() {
		return rdealno;
	}
	public void setRdealno(String rdealno) {
		this.rdealno = rdealno;
	}
	public Timestamp getPay_date() {
		return pay_date;
	}
	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}
	
	
}
