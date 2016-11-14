package purchase;

import game.gameData;
import gamevictory.gameVictoryData;
import gamevictory.victoryPriceData;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.memberData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proto.protoData;


@Controller
public class purController {

	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("/purchase/searchPurchase.to")
	public String searchPurchase() throws Exception{
		return "/purchase/searchPurchase.jsp"; 
	}
	@RequestMapping("/purchase/listPurchase.to")
	public ModelAndView listPurchase(victoryPriceData toto, purData pur, protoData proto,HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		List<purData> listPur = null;
		List<protoData> listPro = null;
		List<victoryPriceData> listTo = null;
		int when = 0;
		if(request.getAttribute("when") != null){
			pur.setWhen((int) request.getAttribute("when"));
		}
		if(pur.getTypeSelect() == null){
			pur.setTypeSelect("전체");
		}
		int idchk = -1;
		if(session.getAttribute("memId") == null) {
			idchk = 0;
		} else {
			pur.setId((String) session.getAttribute("memId"));
			if(pur.getWhen() == 0){
				pur.setWhen(2);
				Date today = cal.getTime();
				pur.setToday(sdf.format(today));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("aweekPur", pur);
				} else{
					listPur = sqlMapper.queryForList("aweekPurType", pur);
				}
			}
			if(pur.getWhen() == 1){
				Date today = cal.getTime();
				pur.setToday(sdf.format(today));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("todayPur", pur);
				} else{
					listPur = sqlMapper.queryForList("todayPurType", pur);
				}
			}
			if(pur.getWhen() == 2){
				cal.add(cal.DATE, -7);
				Date aweek = cal.getTime();
				pur.setAweek(sdf.format(aweek));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("aweekPur", pur);
				} else{
					listPur = sqlMapper.queryForList("aweekPurType", pur);
				}
			}
			if(pur.getWhen() == 3){
				cal.add(cal.DATE, -15);
				Date weeks = cal.getTime();
				pur.setFifteen(sdf.format(weeks));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("fifPur", pur);
				} else{
					listPur = sqlMapper.queryForList("fifPurType", pur);
				}
			}
			if(pur.getWhen() == 4){
				cal.add(cal.DATE, -30);
				Date amonth = cal.getTime();
				pur.setAmonth(sdf.format(amonth));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("amonthPur", pur);
				} else{
					listPur = sqlMapper.queryForList("amonthPurType", pur);
				}
			}
			if(pur.getWhen() == 5){
				cal.add(cal.DATE, -90);
				Date months = cal.getTime();
				pur.setMonths(sdf.format(months));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("monthsPur", pur);
				} else{
					listPur = sqlMapper.queryForList("monthsPurType", pur);
				}
			}
			when = pur.getWhen();
		}
		
		mv.addObject("top", "/top/top.jsp");
		mv.addObject("typeSelect", pur.getTypeSelect());
		mv.addObject("when", when);
		mv.addObject("idchk", idchk);
		mv.addObject("listPur", listPur);
		mv.setViewName("/purchase/listPurchase.jsp");
		return mv; 
	}
	//관리자 배팅 관리
		@RequestMapping("/purchase/AdminPurchase.to")
		public ModelAndView AdminPurchase(victoryPriceData toto, purData pur, protoData proto, HttpSession session, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView();
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			List<purData> listPur = null;
			List<protoData> listPro = null;
			List<victoryPriceData> listTo = null;
			int when = 0;
			if(request.getAttribute("when") != null){
				pur.setWhen((int) request.getAttribute("when"));
			}
			if(pur.getTypeSelect() == null){
				pur.setTypeSelect("전체");
			}
			if(pur.getWhen() == 0){
				pur.setWhen(2);
				Date today = cal.getTime();
				pur.setToday(sdf.format(today));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("aweekPurAdmin", pur);
				} else{
					listPur = sqlMapper.queryForList("aweekPurTypeAdmin", pur);
				}
			}
			if(pur.getWhen() == 1){
				Date today = cal.getTime();
				pur.setToday(sdf.format(today));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("todayPurAdmin", pur);
				} else{
					listPur = sqlMapper.queryForList("todayPurTypeAdmin", pur);
				}
			}
			if(pur.getWhen() == 2){
				cal.add(cal.DATE, -7);
				Date aweek = cal.getTime();
				pur.setAweek(sdf.format(aweek));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("aweekPurAdmin", pur);
				} else{
					listPur = sqlMapper.queryForList("aweekPurTypeAdmin", pur);
				}
			}
			if(pur.getWhen() == 3){
				cal.add(cal.DATE, -15);
				Date weeks = cal.getTime();
				pur.setFifteen(sdf.format(weeks));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("fifPurAdmin", pur);
				} else{
					listPur = sqlMapper.queryForList("fifPurTypeAdmin", pur);
				}
			}
			if(pur.getWhen() == 4){
				cal.add(cal.DATE, -30);
				Date amonth = cal.getTime();
				pur.setAmonth(sdf.format(amonth));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("amonthPurAdmin", pur);
				} else{
					listPur = sqlMapper.queryForList("amonthPurTypeAdmin", pur);
				}
			}
			if(pur.getWhen() == 5){
				cal.add(cal.DATE, -90);
				Date months = cal.getTime();
				pur.setMonths(sdf.format(months));
				if(pur.getTypeSelect().equals("전체")){
					listPur = sqlMapper.queryForList("monthsPurAdmin", pur);
				} else{
					listPur = sqlMapper.queryForList("monthsPurTypeAdmin", pur);
				}
			}
			when = pur.getWhen();
			mv.addObject("top", "/top/top.jsp");
			mv.addObject("typeSelect", pur.getTypeSelect());
			mv.addObject("when", when);
			mv.addObject("listPur", listPur);
			mv.setViewName("/purchase/AdminPurchase.jsp");
			return mv; 
		}
	//회원환불요청
		@RequestMapping("/purchase/refundMPro.to")
		public String refundMPro(purData purdto, HttpSession session,HttpServletRequest request) throws Exception{
			int refund = 0;
			purdto.setId((String) (session.getAttribute("memId")));
			String product = purdto.getProductnum().substring(14, 15);
			purdto.setRefund(1);
			if(product.equals("P")){
				sqlMapper.update("refundProto", purdto);
			} else{
				sqlMapper.update("refundToto", purdto);
			}
			request.setAttribute("chk", 1);
			return "/purchase/refundMPro.jsp"; 
		}
		//관리자 환불
		@RequestMapping("/purchase/refundPro.to")
		public String refundPro(purData purdto,HttpServletRequest request) throws Exception{
			int change = purdto.getBet();
			String product = purdto.getProductnum().substring(14, 15);
			int cash = (int) sqlMapper.queryForObject("selCash", purdto);
			purdto.setRechange(cash + change);
			sqlMapper.update("MemCashUp", purdto);
			purdto.setRefund(2);
			if(product.equals("P")){
				sqlMapper.update("refundPro", purdto);
			} else{
				sqlMapper.update("refundTo", purdto);
			}
			request.setAttribute("chk", 1);
			return "/purchase/refundPro.jsp"; 
		}
		@RequestMapping("/purchase/listpurchasebill.to")
		public ModelAndView listpurchasebill(HttpServletRequest request,victoryPriceData vpdto,gameData gdto,protoData protodto,gameVictoryData gvddto){
			ModelAndView mv = new ModelAndView();
			String productnum = request.getParameter("productnum");
			String type = request.getParameter("type");
			int round = Integer.parseInt(request.getParameter("round"));
			List gameList = null;
			
			if(type.equals("승무패")){
				gvddto = (gameVictoryData)sqlMapper.queryForObject("result_total_price", round);
				vpdto = (victoryPriceData)sqlMapper.queryForObject("result_list", productnum);
				gameList = sqlMapper.queryForList("game_result_List", vpdto);
				
				int check = 1;
				mv.addObject("check", check);
				mv.addObject("gvddto", gvddto);
				mv.addObject("vpdto", vpdto);
				mv.addObject("gameList", gameList);
				
			}
			else if(type.equals("승부식")){
				int check = 2;
				mv.addObject("check", check);
				protodto = (protoData)sqlMapper.queryForObject("proto_result_1", productnum);
				gameData game1 = new gameData();
				gameData game2 = new gameData();
				gameData game3 = new gameData();
				gameData game4 = new gameData();
				gameData game5 = new gameData();
				gameData game6 = new gameData();
				gameData game7 = new gameData();
				gameData game8 = new gameData();
				gameData game9 = new gameData();
				gameData game10 = new gameData();
				mv.addObject("protodto", protodto);
				
				
				if(protodto.getGame1() != 0){
					game1 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame1());
					mv.addObject("game1", game1);
				}if(protodto.getGame2() != 0){
					game2 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame2());
					mv.addObject("game2", game2);
				}if(protodto.getGame3() != 0){
					game3 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame3());
					mv.addObject("game3", game3);
				}if(protodto.getGame4() != 0){
					game4 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame4());
					mv.addObject("game4", game4);
				}if(protodto.getGame5() != 0){
					game5 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame5());
					mv.addObject("game5", game5);
				}if(protodto.getGame6() != 0){
					game6 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame6());
					mv.addObject("game6", game6);
				}if(protodto.getGame7() != 0){
					game7 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame7());
					mv.addObject("game7", game7);
				}if(protodto.getGame8() != 0){
					game8 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame8());
					mv.addObject("game8", game8);
				}if(protodto.getGame9() != 0){
					game9 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame9());
					mv.addObject("game9", game9);
				}if(protodto.getGame10() != 0){
					game10 = (gameData)sqlMapper.queryForObject("game_result_zzzz", protodto.getGame10());
					mv.addObject("game10", game10);
				}
				
			}
			
			mv.setViewName("/purchase/listpurchasebill.jsp");
			return mv;
		}
}
