package member;

import java.sql.Timestamp;

public class cancelData {
	private int num;
	private String id;
	private int cancelprice;
	private int flag;	//(0=출금요청,1=출금완료)
	private String bank;	//은행명
	private Timestamp cancel_date;
	
	
	
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
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
	public int getCancelprice() {
		return cancelprice;
	}
	public void setCancelprice(int cancelprice) {
		this.cancelprice = cancelprice;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public Timestamp getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(Timestamp cancel_date) {
		this.cancel_date = cancel_date;
	}
	
}
