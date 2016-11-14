package gameMatch;
//축구 매치 경기 x:y 몇인지 게임 결과 맞추기
public class gameMatchData {

	private int num;	//기본키
	private String matchpoint;	//게임 결과
	private int count;	//인원수 카운트 할려고 디폴트 1줌
	
	public void setNum(int num){
		this.num = num;
	}
	public int getNum(){
		return num;
	}
	public void setMatchpoint(String matchpoint){
		this.matchpoint = matchpoint;
	}
	public String getMatchpoint(){
		return matchpoint;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
