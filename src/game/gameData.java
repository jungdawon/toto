package game;

import java.sql.Timestamp;

public class gameData {
	private int num;
	private String league;
	private int var;//순위넘기기
	private String home;
	private String away;
	private int homept;
	private int awaypt;
	private String homesc; // 홈 승무패
	private String awaysc; // 어웨이 승무패
	private String flag; // 경기전/종료
	private Timestamp reg_date; // 경기날짜DATE
	private float win_rate; // 승배당
	private float draw_rate; // 무배당
	private float lose_rate; // 패배당
	//
	private String dat; // 년도+날짜
	private String hh; // 시간
	private String min; // 분
	private String reg_date2; // 경기날짜String (dat+hh+min)	
	//	
	private String yy; // 년
	private String mm; // 월
	private String team; // 팀
	private String s_date; // 시작날짜
	private String e_date; // 종료날짜
	private int turn1; // 프로토 회차
	private int turn2; // 토토 회차
	private String round1; // 프로토 경기
	private String round2; // 토토 경기	
	//
	private String round; // 경기선택
	private int turn; // 회차선택
	//
	
	//팀 정보 Data
	private int win; //승
	private int draw;//무
	private int lose;//패
	private int hlpt; //홈일때 실점
	private int alpt; //어웨이 실점
	private String w = "승";
	private String d = "무";
	private String l = "패";
	private String teamname;
	
	private int awin; //승
	private int adraw;//무
	private int alose;//패
	private int hwin; //승
	private int hdraw;//무
	private int hlose;//패
	private String end = "경기종료";//경기종료
	private int snum;//최근5경기,10경기
	
	private String hometown;
	private String homeground;
	private String coach;
	private String grade;
	private String homepage;
	private String logo;
	
	private int startRow;
	private int endRow;
	
	
	
	
	public int getVar() {
		return var;
	}
	public void setVar(int var) {
		this.var = var;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	public int getHlpt() {
		return hlpt;
	}
	public void setHlpt(int hlpt) {
		this.hlpt = hlpt;
	}
	public int getAlpt() {
		return alpt;
	}
	public void setAlpt(int alpt) {
		this.alpt = alpt;
	}
	public String getW() {
		return w;
	}
	public void setW(String w) {
		this.w = w;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	public String getL() {
		return l;
	}
	public void setL(String l) {
		this.l = l;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public int getAwin() {
		return awin;
	}
	public void setAwin(int awin) {
		this.awin = awin;
	}
	public int getAdraw() {
		return adraw;
	}
	public void setAdraw(int adraw) {
		this.adraw = adraw;
	}
	public int getAlose() {
		return alose;
	}
	public void setAlose(int alose) {
		this.alose = alose;
	}
	public int getHwin() {
		return hwin;
	}
	public void setHwin(int hwin) {
		this.hwin = hwin;
	}
	public int getHdraw() {
		return hdraw;
	}
	public void setHdraw(int hdraw) {
		this.hdraw = hdraw;
	}
	public int getHlose() {
		return hlose;
	}
	public void setHlose(int hlose) {
		this.hlose = hlose;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public String getHomeground() {
		return homeground;
	}
	public void setHomeground(String homeground) {
		this.homeground = homeground;
	}
	public String getCoach() {
		return coach;
	}
	public void setCoach(String coach) {
		this.coach = coach;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getLeague() {
		return league;
	}
	public void setLeague(String league) {
		this.league = league;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getAway() {
		return away;
	}
	public void setAway(String away) {
		this.away = away;
	}
	public int getHomept() {
		return homept;
	}
	public void setHomept(int homept) {
		this.homept = homept;
	}
	public int getAwaypt() {
		return awaypt;
	}
	public void setAwaypt(int awaypt) {
		this.awaypt = awaypt;
	}
	public String getHomesc() {
		return homesc;
	}
	public void setHomesc(String homesc) {
		this.homesc = homesc;
	}
	public String getAwaysc() {
		return awaysc;
	}
	public void setAwaysc(String awaysc) {
		this.awaysc = awaysc;
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_date2() {
		return reg_date2;
	}
	public void setReg_date2(String reg_date2) {
		this.reg_date2 = reg_date2;
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
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
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
	public float getWin_rate() {
		return win_rate;
	}
	public void setWin_rate(float win_rate) {
		this.win_rate = win_rate;
	}
	public float getDraw_rate() {
		return draw_rate;
	}
	public void setDraw_rate(float draw_rate) {
		this.draw_rate = draw_rate;
	}
	public float getLose_rate() {
		return lose_rate;
	}
	public void setLose_rate(float lose_rate) {
		this.lose_rate = lose_rate;
	}
	public int getTurn1() {
		return turn1;
	}
	public void setTurn1(int turn1) {
		this.turn1 = turn1;
	}
	public int getTurn2() {
		return turn2;
	}
	public void setTurn2(int turn2) {
		this.turn2 = turn2;
	}
	public String getRound1() {
		return round1;
	}
	public void setRound1(String round1) {
		this.round1 = round1;
	}
	public String getRound2() {
		return round2;
	}
	public void setRound2(String round2) {
		this.round2 = round2;
	}
	public String getRound() {
		return round;
	}
	public void setRound(String round) {
		this.round = round;
	}
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
}

