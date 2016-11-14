package buygame;

import java.sql.Timestamp;

public class buygameData {
	private int num; //
	private String game; //
	private String type; //
	private int round; //
	private String flag; //
	//
	private String dat; // 년도+날짜
	private String hh; // 시간
	private String min; // 분
	private Timestamp start_date;  // 경기날짜String (dat+hh+min)	
	//	
	private String dat2; // 년도+날짜
	private String hh2; // 시간
	private String min2; // 분
	private Timestamp end_date; //
	//	
	private String dat3; // 년도+날짜
	private String hh3; // 시간
	private String min3; // 분
	private Timestamp result_date; //
//	
	private String yy; // 년
	private String mm; // 월
	private String s_date; // 시작날짜
	private String e_date; // 종료날짜
//
	private String proto = "프로토";
	private String toto = "토토";
	private String due = "발매예정";
	private String ing = "발매중";
	private String end = "발매마감";
	private String result = "결과발표";
//	
	private String date_start;
	private String date_end;
	private String date_result;
//	
	private int sumX;
	private int sumY;
	private int sumZ;
	private int sumV;
	private int sumW;
	
	private String turn2;
	private Timestamp reg_date;
	private int Gnum1; 
	private int Gnum2;
	private int Gnum3;
	
	private int turn;
	private String league;
	private int r;
	//
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGame() {
		return game;
	}
	public void setGame(String game) {
		this.game = game;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getDat() {
		return dat;
	}
	public void setDat(String dat) {
		this.dat = dat;
	}
	public String getHh() {
		return hh;
	}
	public void setHh(String hh) {
		this.hh = hh;
	}
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	public String getDat2() {
		return dat2;
	}
	public void setDat2(String dat2) {
		this.dat2 = dat2;
	}
	public String getHh2() {
		return hh2;
	}
	public void setHh2(String hh2) {
		this.hh2 = hh2;
	}
	public String getMin2() {
		return min2;
	}
	public void setMin2(String min2) {
		this.min2 = min2;
	}
	public String getDat3() {
		return dat3;
	}
	public void setDat3(String dat3) {
		this.dat3 = dat3;
	}
	public String getHh3() {
		return hh3;
	}
	public void setHh3(String hh3) {
		this.hh3 = hh3;
	}
	public String getMin3() {
		return min3;
	}
	public void setMin3(String min3) {
		this.min3 = min3;
	}
	public String getYy() {
		return yy;
	}
	public void setYy(String yy) {
		this.yy = yy;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public String getProto() {
		return proto;
	}
	public void setProto(String proto) {
		this.proto = proto;
	}
	public String getToto() {
		return toto;
	}
	public void setToto(String toto) {
		this.toto = toto;
	}
	public String getDue() {
		return due;
	}
	public void setDue(String due) {
		this.due = due;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public Timestamp getResult_date() {
		return result_date;
	}
	public void setResult_date(Timestamp result_date) {
		this.result_date = result_date;
	}
	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getDate_end() {
		return date_end;
	}
	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}
	public String getDate_result() {
		return date_result;
	}
	public void setDate_result(String date_result) {
		this.date_result = date_result;
	}
	public String getTurn2() {
		return turn2;
	}
	public void setTurn2(String turn2) {
		this.turn2 = turn2;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getGnum1() {
		return Gnum1;
	}
	public void setGnum1(int gnum1) {
		Gnum1 = gnum1;
	}
	public int getGnum2() {
		return Gnum2;
	}
	public void setGnum2(int gnum2) {
		Gnum2 = gnum2;
	}
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
	public int getGnum3() {
		return Gnum3;
	}
	public void setGnum3(int gnum3) {
		Gnum3 = gnum3;
	}
	public String getLeague() {
		return league;
	}
	public void setLeague(String league) {
		this.league = league;
	}
	public int getSumX() {
		return sumX;
	}
	public void setSumX(int sumX) {
		this.sumX = sumX;
	}
	public int getSumY() {
		return sumY;
	}
	public void setSumY(int sumY) {
		this.sumY = sumY;
	}
	public int getSumZ() {
		return sumZ;
	}
	public void setSumZ(int sumZ) {
		this.sumZ = sumZ;
	}
	public int getSumV() {
		return sumV;
	}
	public void setSumV(int sumV) {
		this.sumV = sumV;
	}
	public int getSumW() {
		return sumW;
	}
	public void setSumW(int sumW) {
		this.sumW = sumW;
	}
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	
}
