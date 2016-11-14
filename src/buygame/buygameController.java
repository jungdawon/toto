package buygame;

import game.gameData;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class buygameController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	//�Է�
	@RequestMapping("/buygame/inputForm.to")
	public String inputForm() throws Exception{
		return "/buygame/inputForm.jsp";
	}
	@RequestMapping("/buygame/inputPro.to")
	public String inputPro(buygameData dto, HttpServletRequest request) throws Exception{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		date = (Date) sqlMapper.queryForObject("EToGame", dto);
		dto.setGnum1((int) sqlMapper.queryForObject("EToR", dto));
		dto.setGnum2(dto.getGnum1()+14);
		dto.setR(dto.getGnum2()-1);
		//����
		date.setTime(date.getTime()-1000L*60*10);
		dto.setDate_end(sdf.format(date));
		//����
		date.setTime(date.getTime()-1000L*60*60*24*3);
		dto.setDate_start(sdf.format(date));	
		//
		dto.setGame("����");
		dto.setType("�¹���");
		date = (Date) sqlMapper.queryForObject("EToResult", dto);
		date.setTime(date.getTime()+1000L*60*60*2);
		dto.setDate_result(sdf.format(date));	
		dto.setTurn(dto.getRound());
		int chk = (int) sqlMapper.queryForObject("InToCount", dto.getTurn());
		if(chk == 0){
		sqlMapper.update("Toup", dto);
		dto.setFlag("�߸ſ���");
		sqlMapper.insert("inbuygame", dto);
		} else{
			chk = -1;
		}
		request.setAttribute("chk", chk);
		return "/buygame/inputPro.jsp";
	}
	@RequestMapping("/buygame/inputPro2.to")
	public String inputPro2(buygameData dto, HttpServletRequest request) throws Exception{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		date = (Date) sqlMapper.queryForObject("EProGame", dto.getGnum3());
		dto.setGnum1((int) sqlMapper.queryForObject("EProR", dto.getGnum3()));
		dto.setGnum2(dto.getGnum1()+20);
		int r = dto.getGnum2()-1;
		//����
		date.setTime(date.getTime()-1000L*60*10);
		dto.setDate_end(sdf.format(date));
		//����
		date.setTime(date.getTime()-1000L*60*60*24*3);
		dto.setDate_start(sdf.format(date));	
		//
		dto.setGame("������");
		dto.setType("�ºν�");
		date = (Date) sqlMapper.queryForObject("EProResult", r);
		date.setTime(date.getTime()+1000L*60*60*2);
		dto.setDate_result(sdf.format(date));	
		dto.setTurn(dto.getRound());
		int chk = (int) sqlMapper.queryForObject("InProCount", dto.getTurn());
		if(chk == 0){
		sqlMapper.update("Proup", dto);
		dto.setLeague("��ü");
		dto.setFlag("�߸ſ���");
		sqlMapper.insert("inbuygame", dto);
		} else{
			chk = -1;
		}
		request.setAttribute("chk", chk);
		return "/buygame/inputPro2.jsp";
	}
	//����
	@RequestMapping("/buygame/listForm.to")
	public ModelAndView listForm(buygameData dto) throws Exception{		
		ModelAndView mv = new ModelAndView();
		mv.addObject("selbuy",dto);
		mv.setViewName("/buygame/listForm.jsp");
		return mv;
	}
	@RequestMapping("/buygame/listGame.to")
	public ModelAndView listGame(buygameData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		List list = null;
		list = sqlMapper.queryForList("selectbuygame", dto);
		mv.addObject("buygame",list);
		mv.setViewName("/buygame/listGame.jsp");
		return mv;
	}
	//����
	@RequestMapping("/buygame/modifyForm.to")
	public String modifyForm(buygameData dto, HttpServletRequest request) throws Exception{
		dto = (buygameData) sqlMapper.queryForObject("buyup", dto.getNum());
		request.setAttribute("bgm", dto);
		return "/buygame/modifyForm.jsp";
	}
	@RequestMapping("/buygame/modifyPro.to")
	public String modifyPro(buygameData dto) throws Exception{
		dto.setDate_start(dto.getDat()+dto.getHh()+dto.getMin());
		dto.setDate_end(dto.getDat2()+dto.getHh2()+dto.getMin2());
		dto.setDate_result(dto.getDat3()+dto.getHh3()+dto.getMin3());
		sqlMapper.update("buyupPro", dto);
		return "/buygame/modifyPro.jsp";
	}

	// ����
	@RequestMapping("/buygame/deletePro.to")
	public String deletePro(int num) throws Exception{
		sqlMapper.delete("buydelPro", num);
		return "/buygame/deletePro.jsp";
	}
	//�������Ӻ���
	@RequestMapping("/buygame/endForm.to")
	public ModelAndView endForm(buygameData dto) throws Exception{		
		ModelAndView mv = new ModelAndView();
		mv.addObject("endbuy",dto);
		mv.setViewName("/buygame/endForm.jsp");
		return mv;
	}
	@RequestMapping("/buygame/endGame.to")
	public ModelAndView endGame(buygameData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		List list = null;
		if(dto.getGame()== null){
			dto.setGame("��ü");
			list = sqlMapper.queryForList("endlistGame", dto);
		}
		if(dto.getGame().equals("��ü")){
			list = sqlMapper.queryForList("endlistGame", dto);
		} else{
		list = sqlMapper.queryForList("endbuyGame", dto);
		}
		mv.addObject("endgame",list);
		mv.addObject("top","/top/top.jsp");
		mv.setViewName("/buygame/endGame.jsp");
		return mv;
	}
	//������������
			@RequestMapping("/buygame/gameListForm.to")
			public ModelAndView buygameListForm(buygameData dto) throws Exception{
				ModelAndView mv = new ModelAndView();
				if(dto.getYy() == null){
					dto.setGame("��ü");
					dto.setYy("2015");
					dto.setMm("��ü");
				}
				mv.addObject("selg", dto);
				mv.setViewName("/buygame/gameListForm.jsp");
				return mv;
			}
			@RequestMapping("/buygame/gameListMonth.to")
			public ModelAndView buygameListMonth(buygameData dto) throws Exception{
				ModelAndView mv = new ModelAndView();
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
				String year = sdf.format(cal.getTime());
				String month = sdf2.format(cal.getTime());
				List list = null;
				if(dto.getMm()==null){
					dto.setYy(year);
					dto.setMm(month);
					dto.setS_date(dto.getYy()+dto.getMm()+"01");
					String dayby =  dto.getMm().substring(1);
					String dayby2 = "";
					String yearby = dto.getYy();
					if(dto.getMm().substring(0,1).equals("0")){ // 01~09�� �߿���
						if(dto.getMm().substring(1).equals("9")){ // 09��
							dayby2=(Integer.parseInt(dayby)+1)+""; // ���ڸ��� ���ڷ� �ٲٰ� +1 = 10��
						}else{										// 01~08��
							dayby2 = "0"+(Integer.parseInt(dayby)+1); // "0" + ���ڸ��� ���ڷ� �ٲٰ� +1 = 02~09��
						}
					} else { 										// 10~12�� �߿���
						if(dto.getMm().substring(1).equals("2")){ // 12��
							dayby2 = "01";							// ������ 01��
							yearby= Integer.parseInt(dto.getYy())+1+""; // �⵵+1
						}else{										// 10~11��
							dayby2 = "1"+(Integer.parseInt(dayby)+1); // "1" + ���ڸ��� ���ڷ� �ٲٰ� +1 = 11~12��
						}
					}
					dto.setE_date(yearby+dayby2+"01");
					list = sqlMapper.queryForList("listGameall", dto);
					
				} else {
					if(dto.getGame().equals("��ü")){
						dto.setS_date(dto.getYy()+dto.getMm()+"01");
						String dayby =  dto.getMm().substring(1);
						String dayby2 = "";
						String yearby = dto.getYy();
						if(dto.getMm().equals("��ü")){
							list = sqlMapper.queryForList("listAllGame", dto);
						} else{
							if(dto.getMm().substring(0,1).equals("0")){ // 01~09�� �߿���
								if(dto.getMm().substring(1).equals("9")){ // 09��
									dayby2=(Integer.parseInt(dayby)+1)+""; // ���ڸ��� ���ڷ� �ٲٰ� +1 = 10��
								}else{										// 01~08��
									dayby2 = "0"+(Integer.parseInt(dayby)+1); // "0" + ���ڸ��� ���ڷ� �ٲٰ� +1 = 02~09��
								}
							} else { 										// 10~12�� �߿���
								if(dto.getMm().substring(1).equals("2")){ // 12��
									dayby2 = "01";							// ������ 01��
									yearby= Integer.parseInt(dto.getYy())+1+""; // �⵵+1
								}else{										// 10~11��
									dayby2 = "1"+(Integer.parseInt(dayby)+1); // "1" + ���ڸ��� ���ڷ� �ٲٰ� +1 = 11~12��
								}
							}
							dto.setE_date(yearby+dayby2+"01");
							list = sqlMapper.queryForList("listGameall", dto);
						}
						mv.addObject("monG",list);
					} else {
					//������ ������� ���	
					dto.setS_date(dto.getYy()+dto.getMm()+"01");
					String dayby =  dto.getMm().substring(1);
					String dayby2 = "";
					String yearby = dto.getYy();
					if(dto.getMm().equals("��ü")){
						list = sqlMapper.queryForList("listGame", dto);
					} else{
						if(dto.getMm().substring(0,1).equals("0")){ // 01~09�� �߿���
							if(dto.getMm().substring(1).equals("9")){ // 09��
								dayby2=(Integer.parseInt(dayby)+1)+""; // ���ڸ��� ���ڷ� �ٲٰ� +1 = 10��
							}else{										// 01~08��
								dayby2 = "0"+(Integer.parseInt(dayby)+1); // "0" + ���ڸ��� ���ڷ� �ٲٰ� +1 = 02~09��
							}
						} else { 										// 10~12�� �߿���
							if(dto.getMm().substring(1).equals("2")){ // 12��
								dayby2 = "01";							// ������ 01��
								yearby= Integer.parseInt(dto.getYy())+1+""; // �⵵+1
							}else{										// 10~11��
								dayby2 = "1"+(Integer.parseInt(dayby)+1); // "1" + ���ڸ��� ���ڷ� �ٲٰ� +1 = 11~12��
							}
						}
						dto.setE_date(yearby+dayby2+"01");
						list = sqlMapper.queryForList("listMonthGame", dto);
					}
					mv.addObject("monG",list);
				}
				mv.addObject("monG",list);
			}
			mv.addObject("monG",list);	
			mv.addObject("top","/top/top.jsp");
			mv.setViewName("/buygame/gameListMonth.jsp");
			return mv;
		}
		//���߰��
		@RequestMapping("/buygame/resultForm.to")
		public ModelAndView resultForm(buygameData dto) throws Exception{		
			ModelAndView mv = new ModelAndView();
			mv.addObject("resultbuy",dto);
			mv.setViewName("/buygame/resultForm.jsp");
			return mv;
		}
		@RequestMapping("/buygame/resultGame.to")
		public ModelAndView resultGame(buygameData dto) throws Exception{
			ModelAndView mv = new ModelAndView();
			List list = null;
			if(dto.getGame() == null){
				dto.setGame("��ü");
				list = sqlMapper.queryForList("resultlistGame", dto);
			}
			if(dto.getGame().equals("��ü")){
				list = sqlMapper.queryForList("resultlistGame", dto);
			} else{
			list = sqlMapper.queryForList("resultbuyGame", dto);
			}
			mv.addObject("top","/top/top.jsp");
			mv.addObject("resultgame",list);
			mv.setViewName("/buygame/resultGame.jsp");
			return mv;
		}
		
	//���Ű��ɰ��Ӻ���
		@RequestMapping("/buygame/buyableGame.to")
		public ModelAndView buyableGame(buygameData dto) throws Exception{
			ModelAndView mv = new ModelAndView();
			List list1 = null;
			List<buygameData> list2 = null;
			int x; int y; int z; int v; int w;
			int chkX = 0;
			int chkY = 0;
			int chkZ = 0;
			int chkV = 0;
			int chkW = 0;
			
			list1 = sqlMapper.queryForList("ablebgProto", dto);
			list2= sqlMapper.queryForList("totoAble", dto);
			if(list2 == null || list2.size()==0){
				mv.addObject("toto", list2);
			} else{
				if(list2.size() == 5){
					x = list2.get(0).getRound();
					y = list2.get(1).getRound();
					z = list2.get(2).getRound();
					v = list2.get(3).getRound();
					w = list2.get(4).getRound();
					chkX = (int) sqlMapper.queryForObject("xCnt", x);
					chkY = (int) sqlMapper.queryForObject("yCnt", y);
					chkZ = (int) sqlMapper.queryForObject("zCnt", z);
					chkV = (int) sqlMapper.queryForObject("vCnt", v);
					chkW = (int) sqlMapper.queryForObject("wCnt", w);
					if(chkX != 0){
						dto.setSumX((int) sqlMapper.queryForObject("xSum", x));
					} else{
						dto.setSumX(0);
					}
					if(chkY != 0){
						dto.setSumY((int) sqlMapper.queryForObject("ySum", y));
					} else{
						dto.setSumY(0);
					}
					if(chkZ != 0){
						dto.setSumZ((int) sqlMapper.queryForObject("zSum", z));
					} else{
						dto.setSumZ(0);
					}
					if(chkV != 0){
						dto.setSumV((int) sqlMapper.queryForObject("vSum", v));
					} else{
						dto.setSumV(0);
					}
					if(chkW != 0){
						dto.setSumW((int) sqlMapper.queryForObject("wSum", w));
					} else{
						dto.setSumW(0);
					}
					
				} else if(list2.size() == 4){
					x = list2.get(0).getRound();
					y = list2.get(1).getRound();
					z = list2.get(2).getRound();
					v = list2.get(3).getRound();
					chkX = (int) sqlMapper.queryForObject("xCnt", x);
					chkY = (int) sqlMapper.queryForObject("yCnt", y);
					chkZ = (int) sqlMapper.queryForObject("zCnt", z);
					chkV = (int) sqlMapper.queryForObject("vCnt", v);
					if(chkX != 0){
						dto.setSumX((int) sqlMapper.queryForObject("xSum", x));
					} else{
						dto.setSumX(0);
					}
					if(chkY != 0){
						dto.setSumY((int) sqlMapper.queryForObject("ySum", y));
					} else{
						dto.setSumY(0);
					}
					if(chkZ != 0){
						dto.setSumZ((int) sqlMapper.queryForObject("zSum", z));
					} else{
						dto.setSumZ(0);
					}
					if(chkV != 0){
						dto.setSumV((int) sqlMapper.queryForObject("vSum", v));
					} else{
						dto.setSumV(0);
					}
				} else if(list2.size() == 3){
					x = list2.get(0).getRound();
					y = list2.get(1).getRound();
					z = list2.get(2).getRound();
					chkX = (int) sqlMapper.queryForObject("xCnt", x);
					chkY = (int) sqlMapper.queryForObject("yCnt", y);
					chkZ = (int) sqlMapper.queryForObject("zCnt", z);
					if(chkX != 0){
						dto.setSumX((int) sqlMapper.queryForObject("xSum", x));
					} else{
						dto.setSumX(0);
					}
					if(chkY != 0){
						dto.setSumY((int) sqlMapper.queryForObject("ySum", y));
					} else{
						dto.setSumY(0);
					}
					if(chkZ != 0){
						dto.setSumZ((int) sqlMapper.queryForObject("zSum", z));
					} else{
						dto.setSumZ(0);
					}
					
				} else if(list2.size() == 2){
					x = list2.get(0).getRound();
					y = list2.get(1).getRound();
					chkX = (int) sqlMapper.queryForObject("xCnt", x);
					chkY = (int) sqlMapper.queryForObject("yCnt", y);
					if(chkX != 0){
						dto.setSumX((int) sqlMapper.queryForObject("xSum", x));
					} else{
						dto.setSumX(0);
					}
					if(chkY != 0){
						dto.setSumY((int) sqlMapper.queryForObject("ySum", y));
					} else{
						dto.setSumY(0);
					}
				} else{
					x = list2.get(0).getRound();
					chkX = (int) sqlMapper.queryForObject("xCnt", x);
					if(chkX != 0){
						dto.setSumX((int) sqlMapper.queryForObject("xSum", x));
					} else{
						dto.setSumX(0);
					}
				}
				mv.addObject("toto",list2);
			}
			sqlMapper.update("ableupinge", dto);
			sqlMapper.update("ableupduei", dto);
			mv.addObject("chkX", chkX);
			mv.addObject("chkY", chkY);
			mv.addObject("chkZ", chkZ);
			mv.addObject("proto",list1);
			mv.addObject("dto",dto);	
			mv.addObject("top","/top/top.jsp");
			mv.setViewName("/buygame/buyableGame.jsp");
			return mv;
		}
	//����⺸��
		@RequestMapping("/buygame/targetGame.to")
		public ModelAndView targetGame(String type, int round,String league, gameData dto) throws Exception{
			//Ÿ�� = �ºν� = round1,2
			//����� = ȸ�� = turn1,2
			int chk=-1;
			List list = null;
			ModelAndView mv = new ModelAndView();
			if(type.equals("�ºν�")){
				dto.setRound(type);
				dto.setTurn(round);
				list = sqlMapper.queryForList("protoList", dto);
				chk=0;
				mv.addObject("proto",list);
				
			}
			if(type.equals("�¹���")){
				dto.setRound(type);
				dto.setTurn(round);
				dto.setLeague(league);
				list = sqlMapper.queryForList("totoList", dto);
				chk=1;
				mv.addObject("toto",list);
			}
			mv.addObject("top","/top/top.jsp");
			mv.addObject("chk",chk);
			mv.setViewName("/buygame/targetGame.jsp");
			return mv;
		}	
		//���߰������
		@RequestMapping("/buygame/resultGameWin.to")
		public ModelAndView resultGameWin(String type, int round,String league, gameData dto) throws Exception{
			//Ÿ�� = �ºν� = round1,2
			//����� = ȸ�� = turn1,2
			int chk=-1;
			List list = null;
			ModelAndView mv = new ModelAndView();
			if(type.equals("�ºν�")){
				dto.setRound(type);
				dto.setTurn(round);
				list = sqlMapper.queryForList("protoList", dto);
				chk=0;
				mv.addObject("proto",list);
				
			}
			if(type.equals("�¹���")){
				dto.setRound(type);
				dto.setTurn(round);
				dto.setLeague(league);
				list = sqlMapper.queryForList("totoList", dto);
				chk=1;
				mv.addObject("toto",list);
			}
			mv.addObject("top","/top/top.jsp");
			mv.addObject("chk",chk);
			mv.setViewName("/buygame/resultGameWin.jsp");
			return mv;
		}		
}
