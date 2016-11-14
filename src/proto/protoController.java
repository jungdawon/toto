package proto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import game.gameData;
import member.memberData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import buygame.buygameData;

@Controller
public class protoController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	//프로토 구매가능 경기출력
	@RequestMapping("/proto/gameBuy.to")
	public ModelAndView gameBuy(gameData dto,memberData memdto,HttpSession session,HttpServletRequest request) throws Exception{
		String roundtype = null;
		if(request.getParameter("roundtype") !=null){
			roundtype = request.getParameter("roundtype");
			dto.setRound(roundtype);
			int turnnum = Integer.parseInt(request.getParameter("turnnum"));
			dto.setTurn(turnnum);
		} else{
			dto.setRound(request.getParameter("type"));
			dto.setTurn(Integer.parseInt(request.getParameter("round")));
		}
		ModelAndView mv = new ModelAndView();
		List<gameData> list = null;
		int listcnt = 0;
		int idchk = -1;
		if(session.getAttribute("memId")==null){
			idchk = 0;
		}
		if(dto.getRound().equals("승부식")){
			if(dto.getLeague() == null){
				list = sqlMapper.queryForList("protoList", dto);
				listcnt = (int) sqlMapper.queryForObject("protoListCount", dto);
			} else{
				if(dto.getLeague().equals("전체")){
					list = sqlMapper.queryForList("protoList", dto);
					listcnt = (int) sqlMapper.queryForObject("protoListCount", dto);
				} else{
					list = sqlMapper.queryForList("protoList2", dto);
					listcnt = (int) sqlMapper.queryForObject("protoListCount2", dto);
				}
			}
			//10분빼주기
			for(int i=0; i<list.size(); i++){
				Timestamp ts = list.get(i).getReg_date();
				ts.setTime(ts.getTime()-1000L*60*10);
				list.get(i).setReg_date(ts);
			}
			mv.addObject("listcnt", listcnt);
			mv.addObject("pro", list);
			mv.addObject("top", "/top/top.jsp");
			mv.addObject("gameData", dto);
			mv.setViewName("/proto/protoForm.jsp");
		}
		if(dto.getRound().equals("승무패")){
			GregorianCalendar gc = new GregorianCalendar();
		    long milis = gc.getTimeInMillis();// 밀리초로 바꿔준다
		    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss"); // 기본 데이타베이스 저장 타입
		    Date d = gc.getTime(); // Date -> util 패키지
		    String str = sf.format(d);
		    dto.setLeague(request.getParameter("league"));
		    
		    //회원 정보 가져오기
		    memdto = (memberData) sqlMapper.queryForObject("myInfor", session.getAttribute("memId"));
			//경기 리스트 가져오기
		    List<gameData> victorylist = null;
		    victorylist = sqlMapper.queryForList("soccerVictory",dto);
		    mv.addObject("turn2", dto.getTurn());
		    mv.addObject("league", dto.getLeague());
		    mv.addObject("my", memdto);
			mv.addObject("str", str);
			mv.addObject("victoryList", victorylist);
			mv.addObject("top", "/top/top.jsp");
			mv.setViewName("/gamebuy/Victory.jsp");
		}
		mv.addObject("idchk", idchk);
		return mv;
	}
	//프로토 구매완료
	@RequestMapping("/proto/protoComplete.to")
	public ModelAndView protoComplete(protoData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		String[] rate1 = null;
		String[] rate2 = null;
		String[] rate3 = null;
		String[] rate4 = null;
		String[] rate5 = null;
		String[] rate6 = null;
		String[] rate7 = null;
		String[] rate8 = null;
		String[] rate9 = null;
		String[] rate10 = null;
		String[] rate11 = null;
		String[] rate12 = null;
		String[] rate13 = null;
		String[] rate14 = null;
		String[] rate15 = null;
		String[] rate16 = null;
		String[] rate17 = null;
		String[] rate18 = null;
		String[] rate19 = null;
		String[] rate20 = null;

		if(dto.getRate1() != null) {
			rate1 = dto.getRate1().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate1[0]));
				dto.setBetr1(rate1[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate1[0]));
				dto.setBetr2(rate1[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate1[0]));
				dto.setBetr3(rate1[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate1[0]));
				dto.setBetr4(rate1[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate1[0]));
				dto.setBetr5(rate1[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate1[0]));
				dto.setBetr6(rate1[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate1[0]));
				dto.setBetr7(rate1[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate1[0]));
				dto.setBetr8(rate1[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate1[0]));
				dto.setBetr9(rate1[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate1[0]));
				dto.setBetr10(rate1[2]);
			}
		}
		if(dto.getRate2() != null) {
			rate2 = dto.getRate2().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate2[0]));
				dto.setBetr1(rate2[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate2[0]));
				dto.setBetr2(rate2[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate2[0]));
				dto.setBetr3(rate2[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate2[0]));
				dto.setBetr4(rate2[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate2[0]));
				dto.setBetr5(rate2[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate2[0]));
				dto.setBetr6(rate2[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate2[0]));
				dto.setBetr7(rate2[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate2[0]));
				dto.setBetr8(rate2[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate2[0]));
				dto.setBetr9(rate2[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate2[0]));
				dto.setBetr10(rate2[2]);
			}
		}
		if(dto.getRate3() != null) {
			rate3 = dto.getRate3().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate3[0]));
				dto.setBetr1(rate3[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate3[0]));
				dto.setBetr2(rate3[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate3[0]));
				dto.setBetr3(rate3[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate3[0]));
				dto.setBetr4(rate3[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate3[0]));
				dto.setBetr5(rate3[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate3[0]));
				dto.setBetr6(rate3[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate3[0]));
				dto.setBetr7(rate3[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate3[0]));
				dto.setBetr8(rate3[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate3[0]));
				dto.setBetr9(rate3[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate3[0]));
				dto.setBetr10(rate3[2]);
			}
		}
		if(dto.getRate4() != null) {
			rate4 = dto.getRate4().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate4[0]));
				dto.setBetr1(rate4[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate4[0]));
				dto.setBetr2(rate4[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate4[0]));
				dto.setBetr3(rate4[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate4[0]));
				dto.setBetr4(rate4[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate4[0]));
				dto.setBetr5(rate4[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate4[0]));
				dto.setBetr6(rate4[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate4[0]));
				dto.setBetr7(rate4[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate4[0]));
				dto.setBetr8(rate4[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate4[0]));
				dto.setBetr9(rate4[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate4[0]));
				dto.setBetr10(rate4[2]);
			}
		}
		if(dto.getRate5() != null) {
			rate5 = dto.getRate5().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate5[0]));
				dto.setBetr1(rate5[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate5[0]));
				dto.setBetr2(rate5[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate5[0]));
				dto.setBetr3(rate5[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate5[0]));
				dto.setBetr4(rate5[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate5[0]));
				dto.setBetr5(rate5[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate5[0]));
				dto.setBetr6(rate5[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate5[0]));
				dto.setBetr7(rate5[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate5[0]));
				dto.setBetr8(rate5[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate5[0]));
				dto.setBetr9(rate5[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate5[0]));
				dto.setBetr10(rate5[2]);
			}
		}
		if(dto.getRate6() != null) {
			rate6 = dto.getRate6().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate6[0]));
				dto.setBetr1(rate6[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate6[0]));
				dto.setBetr2(rate6[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate6[0]));
				dto.setBetr3(rate6[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate6[0]));
				dto.setBetr4(rate6[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate6[0]));
				dto.setBetr5(rate6[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate6[0]));
				dto.setBetr6(rate6[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate6[0]));
				dto.setBetr7(rate6[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate6[0]));
				dto.setBetr8(rate6[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate6[0]));
				dto.setBetr9(rate6[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate6[0]));
				dto.setBetr10(rate6[2]);
			}
		}
		if(dto.getRate7() != null) {
			rate7 = dto.getRate7().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate7[0]));
				dto.setBetr1(rate7[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate7[0]));
				dto.setBetr2(rate7[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate7[0]));
				dto.setBetr3(rate7[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate7[0]));
				dto.setBetr4(rate7[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate7[0]));
				dto.setBetr5(rate7[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate7[0]));
				dto.setBetr6(rate7[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate7[0]));
				dto.setBetr7(rate7[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate7[0]));
				dto.setBetr8(rate7[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate7[0]));
				dto.setBetr9(rate7[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate7[0]));
				dto.setBetr10(rate7[2]);
			}
		}
		if(dto.getRate8() != null) {
			rate8 = dto.getRate8().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate8[0]));
				dto.setBetr1(rate8[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate8[0]));
				dto.setBetr2(rate8[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate8[0]));
				dto.setBetr3(rate8[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate8[0]));
				dto.setBetr4(rate8[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate8[0]));
				dto.setBetr5(rate8[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate8[0]));
				dto.setBetr6(rate8[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate8[0]));
				dto.setBetr7(rate8[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate8[0]));
				dto.setBetr8(rate8[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate8[0]));
				dto.setBetr9(rate8[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate8[0]));
				dto.setBetr10(rate8[2]);
			}
		}
		if(dto.getRate9() != null) {
			rate9 = dto.getRate9().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate9[0]));
				dto.setBetr1(rate9[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate9[0]));
				dto.setBetr2(rate9[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate9[0]));
				dto.setBetr3(rate9[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate9[0]));
				dto.setBetr4(rate9[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate9[0]));
				dto.setBetr5(rate9[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate9[0]));
				dto.setBetr6(rate9[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate9[0]));
				dto.setBetr7(rate9[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate9[0]));
				dto.setBetr8(rate9[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate9[0]));
				dto.setBetr9(rate9[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate9[0]));
				dto.setBetr10(rate9[2]);
			}
		}
		if(dto.getRate10() != null) {
			rate10 = dto.getRate10().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate10[0]));
				dto.setBetr1(rate10[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate10[0]));
				dto.setBetr2(rate10[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate10[0]));
				dto.setBetr3(rate10[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate10[0]));
				dto.setBetr4(rate10[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate10[0]));
				dto.setBetr5(rate10[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate10[0]));
				dto.setBetr6(rate10[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate10[0]));
				dto.setBetr7(rate10[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate10[0]));
				dto.setBetr8(rate10[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate10[0]));
				dto.setBetr9(rate10[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate10[0]));
				dto.setBetr10(rate10[2]);
			}
		}
		if(dto.getRate11() != null) {
			rate11 = dto.getRate11().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate11[0]));
				dto.setBetr1(rate11[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate11[0]));
				dto.setBetr2(rate11[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate11[0]));
				dto.setBetr3(rate11[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate11[0]));
				dto.setBetr4(rate11[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate11[0]));
				dto.setBetr5(rate11[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate11[0]));
				dto.setBetr6(rate11[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate11[0]));
				dto.setBetr7(rate11[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate11[0]));
				dto.setBetr8(rate11[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate11[0]));
				dto.setBetr9(rate11[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate11[0]));
				dto.setBetr10(rate11[2]);
			}
		}
		if(dto.getRate12() != null) {
			rate12 = dto.getRate12().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate12[0]));
				dto.setBetr1(rate12[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate12[0]));
				dto.setBetr2(rate12[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate12[0]));
				dto.setBetr3(rate12[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate12[0]));
				dto.setBetr4(rate12[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate12[0]));
				dto.setBetr5(rate12[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate12[0]));
				dto.setBetr6(rate12[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate12[0]));
				dto.setBetr7(rate12[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate12[0]));
				dto.setBetr8(rate12[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate12[0]));
				dto.setBetr9(rate12[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate12[0]));
				dto.setBetr10(rate12[2]);
			}
		}
		if(dto.getRate13() != null) {
			rate13 = dto.getRate13().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate13[0]));
				dto.setBetr1(rate13[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate13[0]));
				dto.setBetr2(rate13[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate13[0]));
				dto.setBetr3(rate13[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate13[0]));
				dto.setBetr4(rate13[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate13[0]));
				dto.setBetr5(rate13[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate13[0]));
				dto.setBetr6(rate13[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate13[0]));
				dto.setBetr7(rate13[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate13[0]));
				dto.setBetr8(rate13[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate13[0]));
				dto.setBetr9(rate13[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate13[0]));
				dto.setBetr10(rate13[2]);
			}
		}
		if(dto.getRate14() != null) {
			rate14 = dto.getRate14().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate14[0]));
				dto.setBetr1(rate14[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate14[0]));
				dto.setBetr2(rate14[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate14[0]));
				dto.setBetr3(rate14[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate14[0]));
				dto.setBetr4(rate14[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate14[0]));
				dto.setBetr5(rate14[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate14[0]));
				dto.setBetr6(rate14[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate14[0]));
				dto.setBetr7(rate14[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate14[0]));
				dto.setBetr8(rate14[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate14[0]));
				dto.setBetr9(rate14[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate14[0]));
				dto.setBetr10(rate14[2]);
			}
		}
		if(dto.getRate15() != null) {
			rate15 = dto.getRate15().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate15[0]));
				dto.setBetr1(rate15[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate15[0]));
				dto.setBetr2(rate15[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate15[0]));
				dto.setBetr3(rate15[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate15[0]));
				dto.setBetr4(rate15[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate15[0]));
				dto.setBetr5(rate15[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate15[0]));
				dto.setBetr6(rate15[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate15[0]));
				dto.setBetr7(rate15[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate15[0]));
				dto.setBetr8(rate15[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate15[0]));
				dto.setBetr9(rate15[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate15[0]));
				dto.setBetr10(rate15[2]);
			}
		}
		if(dto.getRate16() != null) {
			rate16 = dto.getRate16().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate16[0]));
				dto.setBetr1(rate16[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate16[0]));
				dto.setBetr2(rate16[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate16[0]));
				dto.setBetr3(rate16[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate16[0]));
				dto.setBetr4(rate16[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate16[0]));
				dto.setBetr5(rate16[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate16[0]));
				dto.setBetr6(rate16[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate16[0]));
				dto.setBetr7(rate16[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate16[0]));
				dto.setBetr8(rate16[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate16[0]));
				dto.setBetr9(rate16[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate16[0]));
				dto.setBetr10(rate16[2]);
			}
		}
		if(dto.getRate17() != null) {
			rate17 = dto.getRate17().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate17[0]));
				dto.setBetr1(rate17[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate17[0]));
				dto.setBetr2(rate17[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate17[0]));
				dto.setBetr3(rate17[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate17[0]));
				dto.setBetr4(rate17[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate17[0]));
				dto.setBetr5(rate17[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate17[0]));
				dto.setBetr6(rate17[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate17[0]));
				dto.setBetr7(rate17[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate17[0]));
				dto.setBetr8(rate17[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate17[0]));
				dto.setBetr9(rate17[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate17[0]));
				dto.setBetr10(rate17[2]);
			}
		}
		if(dto.getRate18() != null) {
			rate18 = dto.getRate18().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate18[0]));
				dto.setBetr1(rate18[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate18[0]));
				dto.setBetr2(rate18[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate18[0]));
				dto.setBetr3(rate18[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate18[0]));
				dto.setBetr4(rate18[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate18[0]));
				dto.setBetr5(rate18[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate18[0]));
				dto.setBetr6(rate18[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate18[0]));
				dto.setBetr7(rate18[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate18[0]));
				dto.setBetr8(rate18[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate18[0]));
				dto.setBetr9(rate18[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate18[0]));
				dto.setBetr10(rate18[2]);
			}
		}
		if(dto.getRate19() != null) {
			rate19 = dto.getRate19().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate19[0]));
				dto.setBetr1(rate19[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate19[0]));
				dto.setBetr2(rate19[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate19[0]));
				dto.setBetr3(rate19[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate19[0]));
				dto.setBetr4(rate19[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate19[0]));
				dto.setBetr5(rate19[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate19[0]));
				dto.setBetr6(rate19[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate19[0]));
				dto.setBetr7(rate19[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate19[0]));
				dto.setBetr8(rate19[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate19[0]));
				dto.setBetr9(rate19[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate19[0]));
				dto.setBetr10(rate19[2]);
			}
		}
		if(dto.getRate20() != null) {
			rate20 = dto.getRate20().split("_");
			if(dto.getBetr1() == null){
				dto.setGame1(Integer.parseInt(rate20[0]));
				dto.setBetr1(rate20[2]);
			} else if(dto.getBetr2() == null){
				dto.setGame2(Integer.parseInt(rate20[0]));
				dto.setBetr2(rate20[2]);
			} else if(dto.getBetr3() == null){
				dto.setGame3(Integer.parseInt(rate20[0]));
				dto.setBetr3(rate20[2]);
			} else if(dto.getBetr4() == null){
				dto.setGame4(Integer.parseInt(rate20[0]));
				dto.setBetr4(rate20[2]);
			} else if(dto.getBetr5() == null){
				dto.setGame5(Integer.parseInt(rate20[0]));
				dto.setBetr5(rate20[2]);
			} else if(dto.getBetr6() == null){
				dto.setGame6(Integer.parseInt(rate20[0]));
				dto.setBetr6(rate20[2]);
			} else if(dto.getBetr7() == null){
				dto.setGame7(Integer.parseInt(rate20[0]));
				dto.setBetr7(rate20[2]);
			} else if(dto.getBetr8() == null){
				dto.setGame8(Integer.parseInt(rate20[0]));
				dto.setBetr8(rate20[2]);
			} else if(dto.getBetr9() == null){
				dto.setGame9(Integer.parseInt(rate20[0]));
				dto.setBetr9(rate20[2]);
			} else if(dto.getBetr10() == null){
				dto.setGame10(Integer.parseInt(rate20[0]));
				dto.setBetr10(rate20[2]);
			}
		}
		int chk = 0;
		int chkSum = -1;
		int sum = 0;
		int limitSum = 0;
		int cash = (int) sqlMapper.queryForObject("cashCheck", dto.getId());
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		dto.setRound(dto.getTurnnum());
		String stringDate = sdf.format(cal.getTime())+"P"+dto.getRound();
		dto.setProductnum(stringDate);
		int idchk = (int) sqlMapper.queryForObject("sumRoundIdCheck", dto);
		if(idchk == 0){
			sum = 0;
		} else{
			sum = (int) sqlMapper.queryForObject("sumRoundId", dto);
		}
		limitSum = sum+dto.getBet();
		if(limitSum <= 100000){
			chkSum = 1;
			if(cash<dto.getBet()){
				mv.addObject("chk", chk);
				mv.addObject("bet", dto.getBet());
				mv.addObject("lack", dto.getBet()-cash);
			} else {
				chk = 1;
				dto.setUseCash(cash-dto.getBet());
				sqlMapper.update("useCashProto", dto);
				int change = (int) sqlMapper.queryForObject("cashCheck", dto.getId());
				dto.setResult(0);
				dto.setType("승부식");
				dto.setRefund(0);
				sqlMapper.insert("insertProto", dto);
				mv.addObject("chk", chk);
				mv.addObject("change", change);
				mv.addObject("bet", dto.getBet());
			}
		} else {
			chkSum = 0;
			mv.addObject("bet", dto.getBet());
		}
		mv.addObject("sum",sum);
		mv.addObject("chkSum",chkSum);
		mv.addObject("top", "/top/top.jsp");
		mv.setViewName("/proto/protoComplete.jsp");
		return mv;
	}
	//경기결과입력
	@RequestMapping("/proto/protoAA.to")
	public ModelAndView protoAA(protoAAData aa, buygameData buy) throws Exception{
		ModelAndView mv = new ModelAndView();
		aa.setFlag("발매마감");
		aa.setType("승부식");
		List<buygameData> listAA = null;
		listAA = sqlMapper.queryForList("endPro", aa);
		int chk = (int) sqlMapper.queryForObject("endProCt", aa);
		mv.addObject("chk", chk);
		mv.addObject("AA", listAA);
		mv.setViewName("/proto/protoAA.jsp");

		return mv;
	}
	@RequestMapping("/proto/protoAAPro.to")
	public ModelAndView protoAAPro(protoAAData aa, protoData pro) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<protoData> listpro = null;
		
		listpro = sqlMapper.queryForList("endProGame", aa);
		mv.addObject("turn", aa.getTurn());
		mv.addObject("type", aa.getType());
		mv.addObject("pro", listpro);
		mv.setViewName("/proto/protoAAPro.jsp");
		return mv;
	}
	@RequestMapping("/proto/protoAAInto.to")
	public ModelAndView protoAAInto(protoAAData aa, protoData pro, gameData game) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(aa.getHomept1() > aa.getAwaypt1()){
			aa.setHomesc1("승");
			aa.setAwaysc1("패");
		} else if(aa.getHomept1() < aa.getAwaypt1()){
			aa.setHomesc1("패");
			aa.setAwaysc1("승");
		} else{
			aa.setHomesc1("무");
			aa.setAwaysc1("무");
		}
		if(aa.getHomept2() > aa.getAwaypt2()){
			aa.setHomesc2("승");
			aa.setAwaysc2("패");
		} else if(aa.getHomept2() < aa.getAwaypt2()){
			aa.setHomesc2("패");
			aa.setAwaysc2("승");
		} else{
			aa.setHomesc2("무");
			aa.setAwaysc2("무");
		}
		if(aa.getHomept3() > aa.getAwaypt3()){
			aa.setHomesc3("승");
			aa.setAwaysc3("패");
		} else if(aa.getHomept3() < aa.getAwaypt3()){
			aa.setHomesc3("패");
			aa.setAwaysc3("승");
		} else{
			aa.setHomesc3("무");
			aa.setAwaysc3("무");
		}
		if(aa.getHomept4() > aa.getAwaypt4()){
			aa.setHomesc4("승");
			aa.setAwaysc4("패");
		} else if(aa.getHomept4() < aa.getAwaypt4()){
			aa.setHomesc4("패");
			aa.setAwaysc4("승");
		} else{
			aa.setHomesc4("무");
			aa.setAwaysc4("무");
		}
		if(aa.getHomept5() > aa.getAwaypt5()){
			aa.setHomesc5("승");
			aa.setAwaysc5("패");
		} else if(aa.getHomept5() < aa.getAwaypt5()){
			aa.setHomesc5("패");
			aa.setAwaysc5("승");
		} else{
			aa.setHomesc5("무");
			aa.setAwaysc5("무");
		}
		if(aa.getHomept6() > aa.getAwaypt6()){
			aa.setHomesc6("승");
			aa.setAwaysc6("패");
		} else if(aa.getHomept6() < aa.getAwaypt6()){
			aa.setHomesc6("패");
			aa.setAwaysc6("승");
		} else{
			aa.setHomesc6("무");
			aa.setAwaysc6("무");
		}
		if(aa.getHomept7() > aa.getAwaypt7()){
			aa.setHomesc7("승");
			aa.setAwaysc7("패");
		} else if(aa.getHomept7() < aa.getAwaypt7()){
			aa.setHomesc7("패");
			aa.setAwaysc7("승");
		} else{
			aa.setHomesc7("무");
			aa.setAwaysc7("무");
		}
		if(aa.getHomept8() > aa.getAwaypt8()){
			aa.setHomesc8("승");
			aa.setAwaysc8("패");
		} else if(aa.getHomept8() < aa.getAwaypt8()){
			aa.setHomesc8("패");
			aa.setAwaysc8("승");
		} else{
			aa.setHomesc8("무");
			aa.setAwaysc8("무");
		}
		if(aa.getHomept9() > aa.getAwaypt9()){
			aa.setHomesc9("승");
			aa.setAwaysc9("패");
		} else if(aa.getHomept9() < aa.getAwaypt9()){
			aa.setHomesc9("패");
			aa.setAwaysc9("승");
		} else{
			aa.setHomesc9("무");
			aa.setAwaysc9("무");
		}
		if(aa.getHomept10() > aa.getAwaypt10()){
			aa.setHomesc10("승");
			aa.setAwaysc10("패");
		} else if(aa.getHomept10() < aa.getAwaypt10()){
			aa.setHomesc10("패");
			aa.setAwaysc10("승");
		} else{
			aa.setHomesc10("무");
			aa.setAwaysc10("무");
		}
		if(aa.getHomept11() > aa.getAwaypt11()){
			aa.setHomesc11("승");
			aa.setAwaysc11("패");
		} else if(aa.getHomept11() < aa.getAwaypt11()){
			aa.setHomesc11("패");
			aa.setAwaysc11("승");
		} else{
			aa.setHomesc11("무");
			aa.setAwaysc11("무");
		}
		if(aa.getHomept12() > aa.getAwaypt12()){
			aa.setHomesc12("승");
			aa.setAwaysc12("패");
		} else if(aa.getHomept12() < aa.getAwaypt12()){
			aa.setHomesc12("패");
			aa.setAwaysc12("승");
		} else{
			aa.setHomesc12("무");
			aa.setAwaysc12("무");
		}
		if(aa.getHomept13() > aa.getAwaypt13()){
			aa.setHomesc13("승");
			aa.setAwaysc13("패");
		} else if(aa.getHomept13() < aa.getAwaypt13()){
			aa.setHomesc13("패");
			aa.setAwaysc13("승");
		} else{
			aa.setHomesc13("무");
			aa.setAwaysc13("무");
		}
		if(aa.getHomept14() > aa.getAwaypt14()){
			aa.setHomesc14("승");
			aa.setAwaysc14("패");
		} else if(aa.getHomept14() < aa.getAwaypt14()){
			aa.setHomesc14("패");
			aa.setAwaysc14("승");
		} else{
			aa.setHomesc14("무");
			aa.setAwaysc14("무");
		}
		if(aa.getHomept15() > aa.getAwaypt15()){
			aa.setHomesc15("승");
			aa.setAwaysc15("패");
		} else if(aa.getHomept15() < aa.getAwaypt15()){
			aa.setHomesc15("패");
			aa.setAwaysc15("승");
		} else{
			aa.setHomesc15("무");
			aa.setAwaysc15("무");
		}
		if(aa.getHomept16() > aa.getAwaypt16()){
			aa.setHomesc16("승");
			aa.setAwaysc16("패");
		} else if(aa.getHomept16() < aa.getAwaypt16()){
			aa.setHomesc16("패");
			aa.setAwaysc16("승");
		} else{
			aa.setHomesc16("무");
			aa.setAwaysc16("무");
		}
		if(aa.getHomept17() > aa.getAwaypt17()){
			aa.setHomesc17("승");
			aa.setAwaysc17("패");
		} else if(aa.getHomept17() < aa.getAwaypt17()){
			aa.setHomesc17("패");
			aa.setAwaysc17("승");
		} else{
			aa.setHomesc17("무");
			aa.setAwaysc17("무");
		}
		if(aa.getHomept18() > aa.getAwaypt18()){
			aa.setHomesc18("승");
			aa.setAwaysc18("패");
		} else if(aa.getHomept18() < aa.getAwaypt18()){
			aa.setHomesc18("패");
			aa.setAwaysc18("승");
		} else{
			aa.setHomesc18("무");
			aa.setAwaysc18("무");
		}
		if(aa.getHomept19() > aa.getAwaypt19()){
			aa.setHomesc19("승");
			aa.setAwaysc19("패");
		} else if(aa.getHomept19() < aa.getAwaypt19()){
			aa.setHomesc19("패");
			aa.setAwaysc19("승");
		} else{
			aa.setHomesc19("무");
			aa.setAwaysc19("무");
		}
		if(aa.getHomept20() > aa.getAwaypt20()){
			aa.setHomesc20("승");
			aa.setAwaysc20("패");
		} else if(aa.getHomept20() < aa.getAwaypt20()){
			aa.setHomesc20("패");
			aa.setAwaysc20("승");
		} else{
			aa.setHomesc20("무");
			aa.setAwaysc20("무");
		}
		aa.setFlag("경기종료");
		sqlMapper.update("up1", aa);
		sqlMapper.update("up2", aa);
		sqlMapper.update("up3", aa);
		sqlMapper.update("up4", aa);
		sqlMapper.update("up5", aa);
		sqlMapper.update("up6", aa);
		sqlMapper.update("up7", aa);
		sqlMapper.update("up8", aa);
		sqlMapper.update("up9", aa);
		sqlMapper.update("up10", aa);
		sqlMapper.update("up11", aa);
		sqlMapper.update("up12", aa);
		sqlMapper.update("up13", aa);
		sqlMapper.update("up14", aa);
		sqlMapper.update("up15", aa);
		sqlMapper.update("up16", aa);
		sqlMapper.update("up17", aa);
		sqlMapper.update("up18", aa);
		sqlMapper.update("up19", aa);
		sqlMapper.update("up20", aa);
		aa.setFlag("결과발표");
		sqlMapper.update("buyGUp", aa);
		
		int count = 0;
		
		List<protoData> list = sqlMapper.queryForList("selectPbet", aa.getTurn());
		for(int i=0; i<list.size(); i++){
			if(list.get(i).getGame3() == 0){
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				count = (int) sqlMapper.queryForObject("chkGame2", aa);
				if(count == 2){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			} else if(list.get(i).getGame4() == 0){
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				aa.setNum3(list.get(i).getGame3());
				aa.setHomesc3(list.get(i).getBetr3());
				count = (int) sqlMapper.queryForObject("chkGame3", aa);
				if(count == 3){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			} else if(list.get(i).getGame5() == 0){
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				aa.setNum3(list.get(i).getGame3());
				aa.setHomesc3(list.get(i).getBetr3());
				aa.setNum4(list.get(i).getGame4());
				aa.setHomesc4(list.get(i).getBetr4());
				count = (int) sqlMapper.queryForObject("chkGame4", aa);
				if(count == 4){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			} else if(list.get(i).getGame6() == 0){
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				aa.setNum3(list.get(i).getGame3());
				aa.setHomesc3(list.get(i).getBetr3());
				aa.setNum4(list.get(i).getGame4());
				aa.setHomesc4(list.get(i).getBetr4());
				aa.setNum5(list.get(i).getGame5());
				aa.setHomesc5(list.get(i).getBetr5());
				count = (int) sqlMapper.queryForObject("chkGame5", aa);
				if(count == 5){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			} else if(list.get(i).getGame7() == 0){
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				aa.setNum3(list.get(i).getGame3());
				aa.setHomesc3(list.get(i).getBetr3());
				aa.setNum4(list.get(i).getGame4());
				aa.setHomesc4(list.get(i).getBetr4());
				aa.setNum5(list.get(i).getGame5());
				aa.setHomesc5(list.get(i).getBetr5());
				aa.setNum6(list.get(i).getGame6());
				aa.setHomesc6(list.get(i).getBetr6());
				count = (int) sqlMapper.queryForObject("chkGame6", aa);
				if(count == 6){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			} else if(list.get(i).getGame8() == 0){
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				aa.setNum3(list.get(i).getGame3());
				aa.setHomesc3(list.get(i).getBetr3());
				aa.setNum4(list.get(i).getGame4());
				aa.setHomesc4(list.get(i).getBetr4());
				aa.setNum5(list.get(i).getGame5());
				aa.setHomesc5(list.get(i).getBetr5());
				aa.setNum6(list.get(i).getGame6());
				aa.setHomesc6(list.get(i).getBetr6());
				aa.setNum7(list.get(i).getGame7());
				aa.setHomesc7(list.get(i).getBetr7());
				count = (int) sqlMapper.queryForObject("chkGame7", aa);
				if(count == 7){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			} else if(list.get(i).getGame9() == 0){
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				aa.setNum3(list.get(i).getGame3());
				aa.setHomesc3(list.get(i).getBetr3());
				aa.setNum4(list.get(i).getGame4());
				aa.setHomesc4(list.get(i).getBetr4());
				aa.setNum5(list.get(i).getGame5());
				aa.setHomesc5(list.get(i).getBetr5());
				aa.setNum6(list.get(i).getGame6());
				aa.setHomesc6(list.get(i).getBetr6());
				aa.setNum7(list.get(i).getGame7());
				aa.setHomesc7(list.get(i).getBetr7());
				aa.setNum8(list.get(i).getGame8());
				aa.setHomesc8(list.get(i).getBetr8());
				count = (int) sqlMapper.queryForObject("chkGame8", aa);
				if(count == 8){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			} else if(list.get(i).getGame10() == 0){
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				aa.setNum3(list.get(i).getGame3());
				aa.setHomesc3(list.get(i).getBetr3());
				aa.setNum4(list.get(i).getGame4());
				aa.setHomesc4(list.get(i).getBetr4());
				aa.setNum5(list.get(i).getGame5());
				aa.setHomesc5(list.get(i).getBetr5());
				aa.setNum6(list.get(i).getGame6());
				aa.setHomesc6(list.get(i).getBetr6());
				aa.setNum7(list.get(i).getGame7());
				aa.setHomesc7(list.get(i).getBetr7());
				aa.setNum8(list.get(i).getGame8());
				aa.setHomesc8(list.get(i).getBetr8());
				aa.setNum9(list.get(i).getGame9());
				aa.setHomesc9(list.get(i).getBetr9());
				count = (int) sqlMapper.queryForObject("chkGame9", aa);
				if(count == 9){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			} else{
				aa.setNum1(list.get(i).getGame1());
				aa.setHomesc1(list.get(i).getBetr1());
				aa.setNum2(list.get(i).getGame2());
				aa.setHomesc2(list.get(i).getBetr2());
				aa.setNum3(list.get(i).getGame3());
				aa.setHomesc3(list.get(i).getBetr3());
				aa.setNum4(list.get(i).getGame4());
				aa.setHomesc4(list.get(i).getBetr4());
				aa.setNum5(list.get(i).getGame5());
				aa.setHomesc5(list.get(i).getBetr5());
				aa.setNum6(list.get(i).getGame6());
				aa.setHomesc6(list.get(i).getBetr6());
				aa.setNum7(list.get(i).getGame7());
				aa.setHomesc7(list.get(i).getBetr7());
				aa.setNum8(list.get(i).getGame8());
				aa.setHomesc8(list.get(i).getBetr8());
				aa.setNum9(list.get(i).getGame9());
				aa.setHomesc9(list.get(i).getBetr9());
				aa.setNum10(list.get(i).getGame10());
				aa.setHomesc10(list.get(i).getBetr10());
				count = (int) sqlMapper.queryForObject("chkGame10", aa);
				if(count == 10){ // 적중이 6, 적중실패가 5
					sqlMapper.update("winPro", list.get(i).getProductnum());
				} else{
					sqlMapper.update("losePro", list.get(i).getProductnum());
				}
			}
		}
		mv.setViewName("/proto/protoAAInto.jsp");
		return mv;
	}
}
