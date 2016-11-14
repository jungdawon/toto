package gamevictory;

import game.gameData;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.memberData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import buygame.buygameData;

@Controller
public class gameVictoryController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;

		//축구 프로토 승부식 14경기 삽입 승무패 삽입(14경기 구매)
		@RequestMapping("/gamebuy/Victory_14.to")
		public ModelAndView Victory_14(gameData gamedto,gameVictoryData dto,victoryPriceData pricedto,
				HttpServletRequest request,HttpSession session,memberData memdto){	//회차 : round2 //승무패 turn2
			ModelAndView mv = new ModelAndView();
			//구매금액
			int totalprice = 0;
			int cancelprice = 0;
			int resultprice = 0;
			int maxprice = 100000;
			
			//구매건수
			int totalcount = 0;
			int cancelcount = 0;
			
			int chk = 0;
			
			HashMap map = new HashMap();
			
			map.put("id", session.getAttribute("memId"));
			map.put("turn2", pricedto.getTurn2());
			totalcount = (int)sqlMapper.queryForObject("totalcount_aa", map);
			cancelcount = (int)sqlMapper.queryForObject("cancelcount_aa", map);
			
			if(totalcount > 0){
				totalprice = (int)sqlMapper.queryForObject("totalprice_aa", map);				
			}
			if(cancelcount > 0){
				cancelprice = (int)sqlMapper.queryForObject("cancelprice_aa", map);				
			}
			
			resultprice = totalprice - cancelprice;
			
			int result = resultprice;
			
			resultprice = resultprice + pricedto.getPrice();
			
			int price = pricedto.getPrice();
			if(resultprice >= maxprice){
				chk = 1;
			}
			
			if(chk == 0){
				//	<!-- 14경기 구매 카운트 업데이트 0건이면 insert 1건이상이면 update -->
				int count = 0;
				count = (int) sqlMapper.queryForObject("insertcount", dto);
				
				//	<!-- 축구 승무패 개인 구매 이력 삽입 -->
				sqlMapper.insert("VictoryBuyInsert", pricedto);
				
				//	<!-- 축구 승무패 구입 가격충전금(마이너스) 업데이트 -->
				sqlMapper.update("VicroryPrice", pricedto);
								
				if(count == 0){
					//	<!-- 14경기 구매 카운트 테이블(관리자) -->
					sqlMapper.insert("soccerVictoryInsert", dto);
				}else{
					//	<!-- 14경기 구매 카운트 테이블(업데이트)(관리자) -->
					sqlMapper.update("soccerVictoryUpdate", dto);
				}			
			}
//			System.out.println("totalprice: "+totalprice);
//			System.out.println("cancelprice: "+cancelprice);
//			System.out.println("resultprice: "+resultprice);
//			System.out.println("maxprice: "+maxprice);
//			System.out.println("totalcount: "+totalcount);
//			System.out.println("cancelcount: "+cancelcount);
//			System.out.println("chk: "+chk);
			
			List<gameData> victorylist = null;
			victorylist = sqlMapper.queryForList("soccerVictory2",gamedto);
			
			//회원 정보 가져오기
		    memdto = (memberData) sqlMapper.queryForObject("myInfor", session.getAttribute("memId"));
			
		    mv.addObject("result",result );
		    mv.addObject("price",price );
		    mv.addObject("totalprice",totalprice );
		    mv.addObject("cancelprice",cancelprice );
		    mv.addObject("resultprice",resultprice );
		    mv.addObject("maxprice",maxprice );		    
		    
		    mv.addObject("chk",chk );
		    mv.addObject("league",dto.getLeague() );
		    System.out.println(dto.getLeague());
			mv.addObject("turn2", dto.getTurn2());
			mv.addObject("my", memdto);
			mv.addObject("pricedto", pricedto);
			mv.addObject("victorylist", victorylist);
			mv.setViewName("/gamebuy/Victory_14.jsp");
			return mv;
		}
		
		//축구 프로토 승부식 14경기 승부 결과 투표/일정 현황
		@RequestMapping("/gamebuy/VictoryVote.to")
		public ModelAndView VictoryVote(gameVictoryData dto,buygameData bgdto,HttpServletRequest request){
			ModelAndView mv = new ModelAndView();
			int turn2 = Integer.parseInt(request.getParameter("round"));
			bgdto.setType(request.getParameter("type"));
			bgdto.setRound(Integer.parseInt(request.getParameter("round")));
//			bgdto.setLeague(request.getParameter("round"));
			String league = request.getParameter("league");
			
			HashMap map = new HashMap();
			map.put("turn2", turn2);
			map.put("league", league);
			//투표 현황 리스트
			dto = (gameVictoryData) sqlMapper.queryForObject("soccerVictoryVote",map);
			
			//홈팀/원정팀 정보 리스트
			List victoryList = sqlMapper.queryForList("VictoryVote",dto);
			
			//총 투표수 카운트
			int count = 0;
			count = (int) sqlMapper.queryForObject("VictoryVoteCount",dto);
			
			//
			bgdto = (buygameData) sqlMapper.queryForObject("votedto",bgdto);
			
		    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd"); // 기본 데이타베이스 저장 타입
		    Date d = bgdto.getResult_date(); // Date -> util 패키지
		    String result = sf.format(d);	//오늘날짜
		    
		    mv.addObject("league", league);
		    mv.addObject("result", result);
			mv.addObject("bgdto", bgdto);
			mv.addObject("turn2", turn2);
			mv.addObject("VoteCount", count);
			mv.addObject("vote", dto);
			mv.addObject("victoryList",victoryList);
			mv.setViewName("/gamebuy/VictoryVote.jsp");
			return mv;
		}
}
