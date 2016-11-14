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

		//�౸ ������ �ºν� 14��� ���� �¹��� ����(14��� ����)
		@RequestMapping("/gamebuy/Victory_14.to")
		public ModelAndView Victory_14(gameData gamedto,gameVictoryData dto,victoryPriceData pricedto,
				HttpServletRequest request,HttpSession session,memberData memdto){	//ȸ�� : round2 //�¹��� turn2
			ModelAndView mv = new ModelAndView();
			//���űݾ�
			int totalprice = 0;
			int cancelprice = 0;
			int resultprice = 0;
			int maxprice = 100000;
			
			//���ŰǼ�
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
				//	<!-- 14��� ���� ī��Ʈ ������Ʈ 0���̸� insert 1���̻��̸� update -->
				int count = 0;
				count = (int) sqlMapper.queryForObject("insertcount", dto);
				
				//	<!-- �౸ �¹��� ���� ���� �̷� ���� -->
				sqlMapper.insert("VictoryBuyInsert", pricedto);
				
				//	<!-- �౸ �¹��� ���� ����������(���̳ʽ�) ������Ʈ -->
				sqlMapper.update("VicroryPrice", pricedto);
								
				if(count == 0){
					//	<!-- 14��� ���� ī��Ʈ ���̺�(������) -->
					sqlMapper.insert("soccerVictoryInsert", dto);
				}else{
					//	<!-- 14��� ���� ī��Ʈ ���̺�(������Ʈ)(������) -->
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
			
			//ȸ�� ���� ��������
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
		
		//�౸ ������ �ºν� 14��� �º� ��� ��ǥ/���� ��Ȳ
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
			//��ǥ ��Ȳ ����Ʈ
			dto = (gameVictoryData) sqlMapper.queryForObject("soccerVictoryVote",map);
			
			//Ȩ��/������ ���� ����Ʈ
			List victoryList = sqlMapper.queryForList("VictoryVote",dto);
			
			//�� ��ǥ�� ī��Ʈ
			int count = 0;
			count = (int) sqlMapper.queryForObject("VictoryVoteCount",dto);
			
			//
			bgdto = (buygameData) sqlMapper.queryForObject("votedto",bgdto);
			
		    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd"); // �⺻ ����Ÿ���̽� ���� Ÿ��
		    Date d = bgdto.getResult_date(); // Date -> util ��Ű��
		    String result = sf.format(d);	//���ó�¥
		    
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
