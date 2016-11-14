package gamevictory;

import java.sql.Timestamp;

public class victoryResultData {
	private int num;	//�⺻Ű
	private int turn2;	//ȸ��
	private String match_1;	//1���
	private String match_2;	//2���
	private String match_3;	//3���
	private String match_4;	//4���
	private String match_5;	//5���
	private String match_6;	//6���
	private String match_7;	//7���
	private String match_8;	//8���
	private String match_9;	//9���
	private String match_10;//10���
	private String match_11;//11���
	private String match_12;//12���
	private String match_13;//13���
	private String match_14;//14���
	private Timestamp victory_date; //���� �ð�
	private String league;
	private String round2;
	//��� ��ǥ ���� ������Ʈ
	private String flag;
	
	
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getRound2() {
		return round2;
	}
	public void setRound2(String round2) {
		this.round2 = round2;
	}
	public String getLeague(){
		return league;
	}
	public void setLeague(String league){
		this.league=league;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getTurn2() {
		return turn2;
	}
	public void setTurn2(int turn2) {
		this.turn2 = turn2;
	}
	public String getMatch_1() {
		return match_1;
	}
	
	public void setMatch_1(String match_1) {
		if(match_1.length() == 1){
			if(match_1.equals("��")){
				match_1 = "1,0,0";
			}else if(match_1.equals("��")){
				match_1 = "0,1,0";
			}else if(match_1.equals("��")){
				match_1 = "0,0,1";
			}
		}else if(match_1.length() == 3){
			if(match_1.equals("��,��")){
				match_1 = "1,1,0";
			}else if(match_1.equals("��,��")){
				match_1 = "1,0,1";
			}else if(match_1.equals("��,��")){
				match_1 = "0,1,1";
			}
		}else if(match_1.length() == 5){
			if(match_1.equals("��,��,��")){
				match_1 = "1,1,1";
			}
		} 
		this.match_1 = match_1;
	}
	public String getMatch_2() {
		return match_2;
	}
	public void setMatch_2(String match_2) {
		if(match_2.length() == 1){
			if(match_2.equals("��")){
				match_2 = "1,0,0";
			}else if(match_2.equals("��")){
				match_2 = "0,1,0";
			}else if(match_2.equals("��")){
				match_2 = "0,0,1";
			}
		}else if(match_2.length() == 3){
			if(match_2.equals("��,��")){
				match_2 = "1,1,0";
			}else if(match_2.equals("��,��")){
				match_2 = "1,0,1";
			}else if(match_2.equals("��,��")){
				match_2 = "0,1,1";
			}
		}else if(match_2.length() == 5){
			if(match_2.equals("��,��,��")){
				match_2 = "1,1,1";
			}
		} 
		this.match_2 = match_2;
	}
	public String getMatch_3() {
		return match_3;
	}
	public void setMatch_3(String match_3) {
		if(match_3.length() == 1){
			if(match_3.equals("��")){
				match_3 = "1,0,0";
			}else if(match_3.equals("��")){
				match_3 = "0,1,0";
			}else if(match_3.equals("��")){
				match_3 = "0,0,1";
			}
		}else if(match_3.length() == 3){
			if(match_3.equals("��,��")){
				match_3 = "1,1,0";
			}else if(match_3.equals("��,��")){
				match_3 = "1,0,1";
			}else if(match_3.equals("��,��")){
				match_3 = "0,1,1";
			}
		}else if(match_3.length() == 5){
			if(match_3.equals("��,��,��")){
				match_3 = "1,1,1";
			}
		} 
		this.match_3 = match_3;
	}
	public String getMatch_4() {
		return match_4;
	}
	public void setMatch_4(String match_4) {
		if(match_4.length() == 1){
			if(match_4.equals("��")){
				match_4 = "1,0,0";
			}else if(match_4.equals("��")){
				match_4 = "0,1,0";
			}else if(match_4.equals("��")){
				match_4 = "0,0,1";
			}
		}else if(match_4.length() == 3){
			if(match_4.equals("��,��")){
				match_4 = "1,1,0";
			}else if(match_4.equals("��,��")){
				match_4 = "1,0,1";
			}else if(match_4.equals("��,��")){
				match_4 = "0,1,1";
			}
		}else if(match_4.length() == 5){
			if(match_4.equals("��,��,��")){
				match_4 = "1,1,1";
			}
		} 
		this.match_4 = match_4;
	}
	public String getMatch_5() {
		return match_5;
	}
	public void setMatch_5(String match_5) {
		if(match_5.length() == 1){
			if(match_5.equals("��")){
				match_5 = "1,0,0";
			}else if(match_5.equals("��")){
				match_5 = "0,1,0";
			}else if(match_5.equals("��")){
				match_5 = "0,0,1";
			}
		}else if(match_5.length() == 3){
			if(match_5.equals("��,��")){
				match_5 = "1,1,0";
			}else if(match_5.equals("��,��")){
				match_5 = "1,0,1";
			}else if(match_5.equals("��,��")){
				match_5 = "0,1,1";
			}
		}else if(match_5.length() == 5){
			if(match_5.equals("��,��,��")){
				match_5 = "1,1,1";
			}
		} 
		this.match_5 = match_5;
	}
	public String getMatch_6() {
		return match_6;
	}
	public void setMatch_6(String match_6) {
		if(match_6.length() == 1){
			if(match_6.equals("��")){
				match_6 = "1,0,0";
			}else if(match_6.equals("��")){
				match_6 = "0,1,0";
			}else if(match_6.equals("��")){
				match_6 = "0,0,1";
			}
		}else if(match_6.length() == 3){
			if(match_6.equals("��,��")){
				match_6 = "1,1,0";
			}else if(match_6.equals("��,��")){
				match_6 = "1,0,1";
			}else if(match_6.equals("��,��")){
				match_6 = "0,1,1";
			}
		}else if(match_6.length() == 5){
			if(match_6.equals("��,��,��")){
				match_6 = "1,1,1";
			}
		} 
		this.match_6 = match_6;
	}
	public String getMatch_7() {
		return match_7;
	}
	public void setMatch_7(String match_7) {
		if(match_7.length() == 1){
			if(match_7.equals("��")){
				match_7 = "1,0,0";
			}else if(match_7.equals("��")){
				match_7 = "0,1,0";
			}else if(match_7.equals("��")){
				match_7 = "0,0,1";
			}
		}else if(match_7.length() == 3){
			if(match_7.equals("��,��")){
				match_7 = "1,1,0";
			}else if(match_7.equals("��,��")){
				match_7 = "1,0,1";
			}else if(match_7.equals("��,��")){
				match_7 = "0,1,1";
			}
		}else if(match_7.length() == 5){
			if(match_7.equals("��,��,��")){
				match_7 = "1,1,1";
			}
		} 
		this.match_7 = match_7;
	}
	public String getMatch_8() {
		return match_8;
	}
	public void setMatch_8(String match_8) {
		if(match_8.length() == 1){
			if(match_8.equals("��")){
				match_8 = "1,0,0";
			}else if(match_8.equals("��")){
				match_8 = "0,1,0";
			}else if(match_8.equals("��")){
				match_8 = "0,0,1";
			}
		}else if(match_8.length() == 3){
			if(match_8.equals("��,��")){
				match_8 = "1,1,0";
			}else if(match_8.equals("��,��")){
				match_8 = "1,0,1";
			}else if(match_8.equals("��,��")){
				match_8 = "0,1,1";
			}
		}else if(match_8.length() == 5){
			if(match_8.equals("��,��,��")){
				match_8 = "1,1,1";
			}
		} 
		this.match_8 = match_8;
	}
	public String getMatch_9() {
		return match_9;
	}
	public void setMatch_9(String match_9) {
		if(match_9.length() == 1){
			if(match_9.equals("��")){
				match_9 = "1,0,0";
			}else if(match_9.equals("��")){
				match_9 = "0,1,0";
			}else if(match_9.equals("��")){
				match_9 = "0,0,1";
			}
		}else if(match_9.length() == 3){
			if(match_9.equals("��,��")){
				match_9 = "1,1,0";
			}else if(match_9.equals("��,��")){
				match_9 = "1,0,1";
			}else if(match_9.equals("��,��")){
				match_9 = "0,1,1";
			}
		}else if(match_9.length() == 5){
			if(match_9.equals("��,��,��")){
				match_9 = "1,1,1";
			}
		} 
		this.match_9 = match_9;
	}
	public String getMatch_10() {
		return match_10;
	}
	public void setMatch_10(String match_10) {
		if(match_10.length() == 1){
			if(match_10.equals("��")){
				match_10 = "1,0,0";
			}else if(match_10.equals("��")){
				match_10 = "0,1,0";
			}else if(match_10.equals("��")){
				match_10 = "0,0,1";
			}
		}else if(match_10.length() == 3){
			if(match_10.equals("��,��")){
				match_10 = "1,1,0";
			}else if(match_10.equals("��,��")){
				match_10 = "1,0,1";
			}else if(match_10.equals("��,��")){
				match_10 = "0,1,1";
			}
		}else if(match_10.length() == 5){
			if(match_10.equals("��,��,��")){
				match_10 = "1,1,1";
			}
		} 
		this.match_10 = match_10;
	}
	public String getMatch_11() {
		return match_11;
	}
	public void setMatch_11(String match_11) {
		if(match_11.length() == 1){
			if(match_11.equals("��")){
				match_11 = "1,0,0";
			}else if(match_11.equals("��")){
				match_11 = "0,1,0";
			}else if(match_11.equals("��")){
				match_11 = "0,0,1";
			}
		}else if(match_11.length() == 3){
			if(match_11.equals("��,��")){
				match_11 = "1,1,0";
			}else if(match_11.equals("��,��")){
				match_11 = "1,0,1";
			}else if(match_11.equals("��,��")){
				match_11 = "0,1,1";
			}
		}else if(match_11.length() == 5){
			if(match_11.equals("��,��,��")){
				match_11 = "1,1,1";
			}
		} 
		this.match_11 = match_11;
	}
	public String getMatch_12() {
		return match_12;
	}
	public void setMatch_12(String match_12) {
		if(match_12.length() == 1){
			if(match_12.equals("��")){
				match_12 = "1,0,0";
			}else if(match_12.equals("��")){
				match_12 = "0,1,0";
			}else if(match_12.equals("��")){
				match_12 = "0,0,1";
			}
		}else if(match_12.length() == 3){
			if(match_12.equals("��,��")){
				match_12 = "1,1,0";
			}else if(match_12.equals("��,��")){
				match_12 = "1,0,1";
			}else if(match_12.equals("��,��")){
				match_12 = "0,1,1";
			}
		}else if(match_12.length() == 5){
			if(match_12.equals("��,��,��")){
				match_12 = "1,1,1";
			}
		} 
		this.match_12 = match_12;
	}
	public String getMatch_13() {
		return match_13;
	}
	public void setMatch_13(String match_13) {
		if(match_13.length() == 1){
			if(match_13.equals("��")){
				match_13 = "1,0,0";
			}else if(match_13.equals("��")){
				match_13 = "0,1,0";
			}else if(match_13.equals("��")){
				match_13 = "0,0,1";
			}
		}else if(match_13.length() == 3){
			if(match_13.equals("��,��")){
				match_13 = "1,1,0";
			}else if(match_13.equals("��,��")){
				match_13 = "1,0,1";
			}else if(match_13.equals("��,��")){
				match_13 = "0,1,1";
			}
		}else if(match_13.length() == 5){
			if(match_13.equals("��,��,��")){
				match_13 = "1,1,1";
			}
		} 
		this.match_13 = match_13;
	}
	public String getMatch_14() {
		return match_14;
	}
	public void setMatch_14(String match_14) {
		if(match_14.length() == 1){
			if(match_14.equals("��")){
				match_14 = "1,0,0";
			}else if(match_14.equals("��")){
				match_14 = "0,1,0";
			}else if(match_14.equals("��")){
				match_14 = "0,0,1";
			}
		}else if(match_14.length() == 3){
			if(match_14.equals("��,��")){
				match_14 = "1,1,0";
			}else if(match_14.equals("��,��")){
				match_14 = "1,0,1";
			}else if(match_14.equals("��,��")){
				match_14 = "0,1,1";
			}
		}else if(match_14.length() == 5){
			if(match_14.equals("��,��,��")){
				match_14 = "1,1,1";
			}
		} 
		this.match_14 = match_14;
	}
	public Timestamp getVictory_date() {
		return victory_date;
	}
	public void setVictory_date(Timestamp victory_date) {
		this.victory_date = victory_date;
	}
	
	
}
