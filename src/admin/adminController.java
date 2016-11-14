package admin;

import game.gameData;
import gamevictory.victoryPriceData;
import gamevictory.victoryResultData;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.memberData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import buygame.buygameData;
//��� ��� ������
//����� ��� ��û���� ������
@Controller
public class adminController {
		@Autowired
		private SqlMapClientTemplate sqlMapper;

		//�౸ ������ �ºν� 14��� �º� ��� ��ϸ���Ʈ
		@RequestMapping("/admin/VictoryResult.to")
		public ModelAndView VictoryResult(buygameData dto,HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView();		
			List<gameData> VicResultList = null;
			dto.setFlag(request.getParameter("flag"));
			dto.setGame(request.getParameter("game"));
			dto.setType(request.getParameter("type"));
			
			VicResultList = sqlMapper.queryForList("VicResultTrun",dto);
			
			mv.addObject("VicResultList", VicResultList);
			mv.addObject("top", "/top/top.jsp");
			mv.setViewName("/admin/VictoryResult.jsp");
			return mv;
		}
		//�¹��� ��� ��� page ��� ȸ�� ��ȸ�ؼ� ���Form
		@RequestMapping("/admin/VictoryResultInput.to")
		public ModelAndView VictoryResultInput(gameData dto,memberData memdto,HttpSession session,HttpServletRequest request) throws Exception{
			dto.setLeague(request.getParameter("league"));
			dto.setTurn2(Integer.parseInt(request.getParameter("round")));
			dto.setRound2(request.getParameter("type"));
			
			ModelAndView mv = new ModelAndView();			
			//ȸ�� ���� ��������
		    memdto = (memberData) sqlMapper.queryForObject("myInfor", session.getAttribute("memId"));
			//��� ����Ʈ ��������
		    List<gameData> victorylist = null;
		    victorylist = sqlMapper.queryForList("soccerVictory2",dto);

		    mv.addObject("turn2", dto.getTurn());
		    mv.addObject("league", dto.getLeague());
		    mv.addObject("my", memdto);
			mv.addObject("victoryList", victorylist);
			mv.addObject("top", "/top/top.jsp");
			mv.setViewName("/admin/VictoryResultInput.jsp");
			return mv;
		}
		//�¹��� ��� ��� ó�� 
		@RequestMapping("/admin/VictoryResultPro.to")
		public ModelAndView VictoryResultPro(victoryResultData ResultDto){
			ModelAndView mv = new ModelAndView();	
			
			
			int resultcount = 0;
			resultcount = (int)sqlMapper.queryForObject("resultcount",ResultDto);

			if(resultcount == 0 ){
				sqlMapper.insert("victoryResultInsert", ResultDto);				
			}else {
				sqlMapper.update("victoryResultUpdate", ResultDto);	
			}
			
			
			
			ArrayList ResultList = null;
			ArrayList VictoryList = null;
			
			String match_1 = ResultDto.getMatch_1();
			String match_2 = ResultDto.getMatch_2();
			String match_3 = ResultDto.getMatch_3();
			String match_4 = ResultDto.getMatch_4();
			String match_5 = ResultDto.getMatch_5();
			String match_6 = ResultDto.getMatch_6();
			String match_7 = ResultDto.getMatch_7();
			String match_8 = ResultDto.getMatch_8();
			String match_9 = ResultDto.getMatch_9();
			String match_10 = ResultDto.getMatch_10();
			String match_11 = ResultDto.getMatch_11();
			String match_12 = ResultDto.getMatch_12();
			String match_13 = ResultDto.getMatch_13();
			String match_14 = ResultDto.getMatch_14();
			//��� ��� �迭
			String [] r = {match_1,match_2,match_3,match_4,match_5,match_6,match_7,match_8,match_9,match_10,match_11,match_12,match_13,match_14};
			
			//�ش� ȸ�� ������ȸ
			VictoryList = (ArrayList) sqlMapper.queryForList("VictoryList", ResultDto);
			
			//��� ��ȸ
			ResultList = (ArrayList) sqlMapper.queryForList("ResultList", ResultDto);	

			for(int k=0; k < VictoryList.size();k++ ){	//��ü ���� ���� ����Ʈ ��ŭ for��������
				int totalcount = 0;	//�Ѱ�� ���߼� 0���� �ʱ�ȭ
				for(int i = 0 ; i < r.length ; i++){//14��� ��ŭ for�� ������
					int count = 0;	//�ش��� ���� 0�����ʱ�ȭ
					String[] str ={((victoryPriceData) VictoryList.get(k)).getMatch_1(),
							((victoryPriceData) VictoryList.get(k)).getMatch_2(),
							((victoryPriceData) VictoryList.get(k)).getMatch_3(),
							((victoryPriceData) VictoryList.get(k)).getMatch_4(),
							((victoryPriceData) VictoryList.get(k)).getMatch_5(),
							((victoryPriceData) VictoryList.get(k)).getMatch_6(),
							((victoryPriceData) VictoryList.get(k)).getMatch_7(),
							((victoryPriceData) VictoryList.get(k)).getMatch_8(),
							((victoryPriceData) VictoryList.get(k)).getMatch_9(),
							((victoryPriceData) VictoryList.get(k)).getMatch_10(),
							((victoryPriceData) VictoryList.get(k)).getMatch_11(),
							((victoryPriceData) VictoryList.get(k)).getMatch_12(),
							((victoryPriceData) VictoryList.get(k)).getMatch_13(),
							((victoryPriceData) VictoryList.get(k)).getMatch_14()
					};
//					String str2 =((victoryResultData) ResultList.get(i)).getMatch_1();
//					System.out.println(((victoryResultData) ResultList.get(i)).getMatch_1());
//					
					String[] result = str[i].split(",");
					String[] result2 = r[i].split(",");
					for(int j=0; j<result.length; j++){	//1���� ��,��,�� 3��for��
						if(result2[j].equals("1")){	//��� ����� 1�ϋ�
							if(result2[j].equals(result[j])){	//���ų��� j��°�� ���߰�� j��° �Ѵ� 1�̸�
								count = 1;					//�ش� ���� ����(1)
							}
						}
					}
					totalcount = totalcount + count;	//��ü ��� = ��ü������� + �ش��� ����
				}
				
				int up = ((victoryPriceData) VictoryList.get(k)).getNum();//�ش� Num �� update ������°�
				if(totalcount >= 0){
					sqlMapper.update("update_5",up);
				}if(totalcount > 10){//4��
					sqlMapper.update("update_4",up);
				}if(totalcount > 11){//3��
					sqlMapper.update("update_3",up);
				}if(totalcount > 12){//2��
					sqlMapper.update("update_2",up);
				}if(totalcount > 13){//1��
					sqlMapper.update("update_1",up);
				}
//				System.out.println(((victoryPriceData) VictoryList.get(k)).getMatch_1());
			}
			//������
			HashMap map = new HashMap();
			int totalprice = 0; //�ش� ���� �ѱ��ž�
			
			
			totalprice = (int)sqlMapper.queryForObject("totalprice", ResultDto);	//�ش� ���� �ѱ��ž�
			
			float number_1 = (float)((totalprice / 2) * 0.5);	//�ѱ��ž� / 2 * 0.5 = 1�� ���ݾ�
			int number_1_count = 0;				//�ش�ȸ�� ���� 1�� �ο���
			float number_1_price = 0;				//�ش�ȸ�� ���� 1�� ���ݾ�
			
			float number_2 = (float)((totalprice / 2) * 0.2);	//�ѱ��ž� / 2 * 0.2 = 2�� ���ݾ�
			int number_2_count = 0;				//�ش�ȸ�� ���� 2�� �ο���
			float number_2_price = 0;				//�ش�ȸ�� ���� 2�� ���ݾ�
			
			float number_3 = (float)((totalprice / 2) * 0.1);	//�ѱ��ž� / 2 * 0.1 = 3�� ���ݾ�
			int number_3_count = 0;				//�ش�ȸ�� ���� 3�� �ο���
			float number_3_price = 0;				//�ش�ȸ�� ���� 3�� ���ݾ�
			
			float number_4 = (float)((totalprice / 2) * 0.2);	//�ѱ��ž� / 2 * 0.2 = 4�� ���ݾ�
			int number_4_count = 0;				//�ش�ȸ�� ���� 4�� �ο���
			float number_4_price = 0;				//�ش�ȸ�� ���� 4�� ���ݾ�
			
			number_1_count = (int)sqlMapper.queryForObject("number_1_count", ResultDto);	//�ش�ȸ�� ������ 1�� �ο���
			number_1_price = (float)(number_1 / number_1_count);
			
			number_2_count = (int)sqlMapper.queryForObject("number_2_count", ResultDto);	//�ش�ȸ�� ������ 2�� �ο���
			number_2_price = (float)(number_2 / number_2_count);
			
			number_3_count = (int)sqlMapper.queryForObject("number_3_count", ResultDto);	//�ش�ȸ�� ������ 3�� �ο���
			number_3_price = (float)(number_3 / number_3_count);
			
			number_4_count = (int)sqlMapper.queryForObject("number_4_count", ResultDto);	//�ش�ȸ�� ������ 4�� �ο���
			number_4_price = (float)(number_4 / number_4_count);
			
			if(number_1_count > 0){
				map.put("league", ResultDto.getLeague());
				map.put("turn2", ResultDto.getTurn2());
				map.put("number_1_price", number_1_price);
				sqlMapper.update("number_1_price", map);	//1�� ��÷�� ������Ʈ
			}
			if(number_2_count > 0){
				map.put("league", ResultDto.getLeague());
				map.put("turn2", ResultDto.getTurn2());
				map.put("number_2_price", number_2_price);
				sqlMapper.update("number_2_price", map);	//2�� ��÷�� ������Ʈ
			}
			if(number_3_count > 0){
				map.put("league", ResultDto.getLeague());
				map.put("turn2", ResultDto.getTurn2());
				map.put("number_3_price", number_3_price);
				sqlMapper.update("number_3_price", map);	//3�� ��÷�� ������Ʈ
			}
			if(number_4_count > 0){
				map.put("league", ResultDto.getLeague());
				map.put("turn2", ResultDto.getTurn2());
				map.put("number_4_price", number_4_price);
				sqlMapper.update("number_4_price", map);	//4�� ��÷�� ������Ʈ
			}
			
			//
			int number = 0;
			String[] numresult = null;

			numresult = match_1.split(",");
			number = (int) sqlMapper.queryForObject("numselect_1", ResultDto);
			//System.out.println(number);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			//System.out.println("map: "+map);
			
			
			numresult = match_2.split(",");
			number = (int) sqlMapper.queryForObject("numselect_2", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_3.split(",");
			number = (int) sqlMapper.queryForObject("numselect_3", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_4.split(",");
			number = (int) sqlMapper.queryForObject("numselect_4", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_5.split(",");
			number = (int) sqlMapper.queryForObject("numselect_5", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_6.split(",");
			number = (int) sqlMapper.queryForObject("numselect_6", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_7.split(",");
			number = (int) sqlMapper.queryForObject("numselect_7", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_8.split(",");
			number = (int) sqlMapper.queryForObject("numselect_8", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_9.split(",");
			number = (int) sqlMapper.queryForObject("numselect_9", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_10.split(",");
			number = (int) sqlMapper.queryForObject("numselect_10", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_11.split(",");
			number = (int) sqlMapper.queryForObject("numselect_11", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_12.split(",");
			number = (int) sqlMapper.queryForObject("numselect_12", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_13.split(",");
			number = (int) sqlMapper.queryForObject("numselect_13", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			
			numresult = match_14.split(",");
			number = (int) sqlMapper.queryForObject("numselect_14", ResultDto);
			if(numresult[0].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[1].equals("1")){	//��� ��� ���º��ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}else if(numresult[2].equals("1")){	//��� ��� Ȩ���ϋ�
				map.put("numhome", "��");	map.put("numaway", "��");	map.put("number", number);	map.put("flag", "�������");
				sqlMapper.update("numberupdate", map);
			}
			ResultDto.setFlag("�����ǥ");
			System.out.println(ResultDto.getRound2());
			System.out.println(ResultDto.getTurn2());
			sqlMapper.update("flag_result_update", ResultDto);
			
			mv.setViewName("/admin/VictoryResultPro.jsp");
			
			return mv;
		}
		
		//��� ��û ������
		@RequestMapping("/admin/price.to")
		public ModelAndView Price(HttpServletRequest request){
			ModelAndView mv = new ModelAndView();
			
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
		           pageNum = "1";
			}
			int flag = Integer.parseInt(request.getParameter("flag"));
			int pageSize = 10;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        int count = 0;	
	        int number=0;
	        
	        HashMap map=new  HashMap();
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("flag", flag);
	        
	        count = (int) sqlMapper.queryForObject("PriceCount", flag);
			List priceList = null;
			if(count != 0){
				priceList = sqlMapper.queryForList("price", map);
			}
			
			
			int result_cash_ing= 0;
			int result_cash= 0;
			int result_cash_ing_count= 0;
			int result_cash_count= 0;
			
			result_cash_ing_count = (int) sqlMapper.queryForObject("result_cash_ing_count", null);
			
			if(result_cash_ing_count != 0){
				result_cash_ing = (int) sqlMapper.queryForObject("result_cash_ing", null);
				 mv.addObject("result_cash_ing",result_cash_ing);
			}
			
			result_cash_count = (int) sqlMapper.queryForObject("result_cash_count", null);
			if(result_cash_count != 0){
				result_cash = (int) sqlMapper.queryForObject("result_cash", null);
				mv.addObject("result_cash",result_cash);
			}

	       
	        mv.addObject("result_cash_ing_count",result_cash_ing_count);
	        mv.addObject("result_cash_count",result_cash_count);
			mv.addObject("flag",flag);
			mv.addObject("startRow",startRow);
	        mv.addObject("currentPage",currentPage);
	        mv.addObject("pageSize",pageSize);
	        mv.addObject("endRow",endRow);
	        mv.addObject("pageNum",pageNum);
	        mv.addObject("number",number);
	        mv.addObject("count",count);
			mv.addObject("priceList",priceList);
			mv.addObject("top", "/top/top.jsp");
			mv.setViewName("/admin/price.jsp");
			return mv;
		}
		
		@RequestMapping("/admin/pricePro.to")
		public ModelAndView pricePro(HttpServletRequest request,memberData mdto){
			ModelAndView mv = new ModelAndView();
			int num = Integer.parseInt(request.getParameter("num"));
			
			//��� ��û ���� ����
			sqlMapper.update("PriceUpdate", num);
			
			mv.setViewName("/admin/pricePro.jsp");
			return mv;
		}
		
		@RequestMapping("/admin/resultList.to")
		public ModelAndView resultList(buygameData buydto){
			ModelAndView mv = new ModelAndView();
			List endlist = null;
			
			endlist = sqlMapper.queryForList("endlistGame2", null);
			
			mv.addObject("endlist", endlist);
			mv.setViewName("/admin/resultList.jsp");
			return mv;
		}
		/* ������ Page(��ġ�� ���� ����) */
		@RequestMapping("/admin/payList.to")
		public ModelAndView payList(HttpServletRequest request,payData paydto){
			ModelAndView mv = new ModelAndView();
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
		           pageNum = "1";
				}
			int pageSize = 10;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        int count = 0;	
	        int number=0;
	        
	        HashMap map=new  HashMap();
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        count = (int) sqlMapper.queryForObject("adminPayListCount", null);
	        
	        List paylist = null;
	        if(count != 0){
	        	paylist = sqlMapper.queryForList("adminPayList", map);
	        }
	        int cash = 0;
	        int cash_count = 0;
	        cash = (int) sqlMapper.queryForObject("total_cash", null);
	        cash_count = (int) sqlMapper.queryForObject("total_cash_count", null);
	        
	        number=count-(currentPage-1)*pageSize;
	        
	        
	        mv.addObject("cash",cash);
	        mv.addObject("cash_count",cash_count);
	        mv.addObject("paylist",paylist);
	        mv.addObject("startRow",new Integer(startRow));
	        mv.addObject("currentPage",new Integer(currentPage));
	        mv.addObject("pageSize",new Integer(pageSize));
	        mv.addObject("endRow",new Integer(endRow));
	        mv.addObject("pageNum",pageNum);
	        mv.addObject("number",number);
	        mv.addObject("count",count);
			mv.setViewName("/admin/payList.jsp");
			return mv;
		}
		
		@RequestMapping("/admin/adminMember.to")
		public String adminMember(HttpServletRequest request)throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		String local=request.getParameter("local");
		if (pageNum == null) {
           pageNum = "1";
		}
	
			int pageSize = 10;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        int count = 0;	
	        int number=0;

        count=(int)sqlMapper.queryForObject("membercount", null);
	

	     ArrayList<memberData> memberlist=new ArrayList<memberData>();
	     HashMap map=new  HashMap();
	     map.put("startRow", startRow);
	     map.put("endRow", endRow);
   
        if(count!=0){
        	Object adminmember = null;
			memberlist = (ArrayList<memberData>)sqlMapper.queryForList("adminmember", map);
        }
        number=count-(currentPage-1)*pageSize;
        request.setAttribute("top", "/top/top.jsp");
        request.setAttribute("memberlist", memberlist);
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("pageSize", new Integer(pageSize));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("number", number);
     
        
		return "/admin/adminMember.jsp";
	}
	@RequestMapping("/admin/memberdelete.to")
	public ModelAndView amemdelete(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		String id = request.getParameter("id");
		int cash = (int)sqlMapper.queryForObject("intcash", id);

		if(cash==0){
		sqlMapper.delete("deleteM", id);
		mv.setViewName("/admin/adminMember.to");
		}
		if(cash!=0){
			mv.setViewName("/admin/adminMemberpro.to");
		}

		
		
		return mv;
	}
	@RequestMapping("/admin/adminMemberpro.to")
	public ModelAndView adminMemberpro(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/adminMemberpro.jsp");
	 return mv;
	}
}
