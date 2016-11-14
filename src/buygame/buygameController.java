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
	//입력
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
		//마감
		date.setTime(date.getTime()-1000L*60*10);
		dto.setDate_end(sdf.format(date));
		//시작
		date.setTime(date.getTime()-1000L*60*60*24*3);
		dto.setDate_start(sdf.format(date));	
		//
		dto.setGame("토토");
		dto.setType("승무패");
		date = (Date) sqlMapper.queryForObject("EToResult", dto);
		date.setTime(date.getTime()+1000L*60*60*2);
		dto.setDate_result(sdf.format(date));	
		dto.setTurn(dto.getRound());
		int chk = (int) sqlMapper.queryForObject("InToCount", dto.getTurn());
		if(chk == 0){
		sqlMapper.update("Toup", dto);
		dto.setFlag("발매예정");
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
		//마감
		date.setTime(date.getTime()-1000L*60*10);
		dto.setDate_end(sdf.format(date));
		//시작
		date.setTime(date.getTime()-1000L*60*60*24*3);
		dto.setDate_start(sdf.format(date));	
		//
		dto.setGame("프로토");
		dto.setType("승부식");
		date = (Date) sqlMapper.queryForObject("EProResult", r);
		date.setTime(date.getTime()+1000L*60*60*2);
		dto.setDate_result(sdf.format(date));	
		dto.setTurn(dto.getRound());
		int chk = (int) sqlMapper.queryForObject("InProCount", dto.getTurn());
		if(chk == 0){
		sqlMapper.update("Proup", dto);
		dto.setLeague("전체");
		dto.setFlag("발매예정");
		sqlMapper.insert("inbuygame", dto);
		} else{
			chk = -1;
		}
		request.setAttribute("chk", chk);
		return "/buygame/inputPro2.jsp";
	}
	//일정
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
	//수정
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

	// 삭제
	@RequestMapping("/buygame/deletePro.to")
	public String deletePro(int num) throws Exception{
		sqlMapper.delete("buydelPro", num);
		return "/buygame/deletePro.jsp";
	}
	//마감게임보기
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
			dto.setGame("전체");
			list = sqlMapper.queryForList("endlistGame", dto);
		}
		if(dto.getGame().equals("전체")){
			list = sqlMapper.queryForList("endlistGame", dto);
		} else{
		list = sqlMapper.queryForList("endbuyGame", dto);
		}
		mv.addObject("endgame",list);
		mv.addObject("top","/top/top.jsp");
		mv.setViewName("/buygame/endGame.jsp");
		return mv;
	}
	//게임일정보기
			@RequestMapping("/buygame/gameListForm.to")
			public ModelAndView buygameListForm(buygameData dto) throws Exception{
				ModelAndView mv = new ModelAndView();
				if(dto.getYy() == null){
					dto.setGame("전체");
					dto.setYy("2015");
					dto.setMm("전체");
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
					if(dto.getMm().substring(0,1).equals("0")){ // 01~09월 중에서
						if(dto.getMm().substring(1).equals("9")){ // 09월
							dayby2=(Integer.parseInt(dayby)+1)+""; // 끝자리를 숫자로 바꾸고 +1 = 10월
						}else{										// 01~08월
							dayby2 = "0"+(Integer.parseInt(dayby)+1); // "0" + 끝자리를 숫자로 바꾸고 +1 = 02~09월
						}
					} else { 										// 10~12월 중에서
						if(dto.getMm().substring(1).equals("2")){ // 12월
							dayby2 = "01";							// 다음해 01월
							yearby= Integer.parseInt(dto.getYy())+1+""; // 년도+1
						}else{										// 10~11월
							dayby2 = "1"+(Integer.parseInt(dayby)+1); // "1" + 끝자리를 숫자로 바꾸고 +1 = 11~12월
						}
					}
					dto.setE_date(yearby+dayby2+"01");
					list = sqlMapper.queryForList("listGameall", dto);
					
				} else {
					if(dto.getGame().equals("전체")){
						dto.setS_date(dto.getYy()+dto.getMm()+"01");
						String dayby =  dto.getMm().substring(1);
						String dayby2 = "";
						String yearby = dto.getYy();
						if(dto.getMm().equals("전체")){
							list = sqlMapper.queryForList("listAllGame", dto);
						} else{
							if(dto.getMm().substring(0,1).equals("0")){ // 01~09월 중에서
								if(dto.getMm().substring(1).equals("9")){ // 09월
									dayby2=(Integer.parseInt(dayby)+1)+""; // 끝자리를 숫자로 바꾸고 +1 = 10월
								}else{										// 01~08월
									dayby2 = "0"+(Integer.parseInt(dayby)+1); // "0" + 끝자리를 숫자로 바꾸고 +1 = 02~09월
								}
							} else { 										// 10~12월 중에서
								if(dto.getMm().substring(1).equals("2")){ // 12월
									dayby2 = "01";							// 다음해 01월
									yearby= Integer.parseInt(dto.getYy())+1+""; // 년도+1
								}else{										// 10~11월
									dayby2 = "1"+(Integer.parseInt(dayby)+1); // "1" + 끝자리를 숫자로 바꾸고 +1 = 11~12월
								}
							}
							dto.setE_date(yearby+dayby2+"01");
							list = sqlMapper.queryForList("listGameall", dto);
						}
						mv.addObject("monG",list);
					} else {
					//월별로 경기일정 출력	
					dto.setS_date(dto.getYy()+dto.getMm()+"01");
					String dayby =  dto.getMm().substring(1);
					String dayby2 = "";
					String yearby = dto.getYy();
					if(dto.getMm().equals("전체")){
						list = sqlMapper.queryForList("listGame", dto);
					} else{
						if(dto.getMm().substring(0,1).equals("0")){ // 01~09월 중에서
							if(dto.getMm().substring(1).equals("9")){ // 09월
								dayby2=(Integer.parseInt(dayby)+1)+""; // 끝자리를 숫자로 바꾸고 +1 = 10월
							}else{										// 01~08월
								dayby2 = "0"+(Integer.parseInt(dayby)+1); // "0" + 끝자리를 숫자로 바꾸고 +1 = 02~09월
							}
						} else { 										// 10~12월 중에서
							if(dto.getMm().substring(1).equals("2")){ // 12월
								dayby2 = "01";							// 다음해 01월
								yearby= Integer.parseInt(dto.getYy())+1+""; // 년도+1
							}else{										// 10~11월
								dayby2 = "1"+(Integer.parseInt(dayby)+1); // "1" + 끝자리를 숫자로 바꾸고 +1 = 11~12월
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
		//적중결과
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
				dto.setGame("전체");
				list = sqlMapper.queryForList("resultlistGame", dto);
			}
			if(dto.getGame().equals("전체")){
				list = sqlMapper.queryForList("resultlistGame", dto);
			} else{
			list = sqlMapper.queryForList("resultbuyGame", dto);
			}
			mv.addObject("top","/top/top.jsp");
			mv.addObject("resultgame",list);
			mv.setViewName("/buygame/resultGame.jsp");
			return mv;
		}
		
	//구매가능게임보기
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
	//대상경기보기
		@RequestMapping("/buygame/targetGame.to")
		public ModelAndView targetGame(String type, int round,String league, gameData dto) throws Exception{
			//타입 = 승부식 = round1,2
			//라운드는 = 회차 = turn1,2
			int chk=-1;
			List list = null;
			ModelAndView mv = new ModelAndView();
			if(type.equals("승부식")){
				dto.setRound(type);
				dto.setTurn(round);
				list = sqlMapper.queryForList("protoList", dto);
				chk=0;
				mv.addObject("proto",list);
				
			}
			if(type.equals("승무패")){
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
		//적중결과보기
		@RequestMapping("/buygame/resultGameWin.to")
		public ModelAndView resultGameWin(String type, int round,String league, gameData dto) throws Exception{
			//타입 = 승부식 = round1,2
			//라운드는 = 회차 = turn1,2
			int chk=-1;
			List list = null;
			ModelAndView mv = new ModelAndView();
			if(type.equals("승부식")){
				dto.setRound(type);
				dto.setTurn(round);
				list = sqlMapper.queryForList("protoList", dto);
				chk=0;
				mv.addObject("proto",list);
				
			}
			if(type.equals("승무패")){
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
