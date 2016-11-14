package game;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import buygame.buygameData;

import com.ibatis.common.resources.Resources;

@Controller
public class gameController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	//경기입력
	@RequestMapping("/game/gameInputForm.to")
	public ModelAndView gameInputForm(gameData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(dto.getLeague() == null){
			dto.setLeague("선택");
		}
		mv.addObject("dto",dto);
		mv.setViewName("/game/gameInputForm.jsp");
		return mv;
	}
	@RequestMapping("/game/gameInput.to")
	public String gameInput(gameData dto, HttpServletRequest request) throws Exception{
		request.setAttribute("dto", dto);
		request.setAttribute("top", "/top/top.jsp");
		return "/game/gameInput.jsp";
	}
	@RequestMapping("/game/gameInputPro.to")
	public String gameInputPro(gameData dto) throws Exception{
		dto.setReg_date2(dto.getDat()+dto.getHh()+dto.getMin());
		sqlMapper.insert("insertG", dto);
		return "/game/gameInputPro.jsp";
//		return "redirect:/game/gameList.jsp";
	}
	@RequestMapping("/game/gameListForm.to")
	public ModelAndView gameListForm(gameData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(dto.getYy() == null){
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat mm = new SimpleDateFormat("MM");
			SimpleDateFormat yy = new SimpleDateFormat("yyyy");
			String thisMonth = mm.format(cal.getTime());
			String thisYear = yy.format(cal.getTime());
			dto.setMm(thisMonth);
			dto.setYy(thisYear);
		}		
		mv.addObject("selc", dto);
		mv.addObject("top", "/top/top.jsp");
		mv.setViewName("/game/gameListForm.jsp");
		return mv;
	}
	@RequestMapping("/game/gameListMonth.to")
	public ModelAndView gameListMonth(gameData dto,HttpServletRequest request) throws Exception{

		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
           pageNum = "1";
       }
		
		int pageSize = 10;//한 페이지의 글의 개수
        int currentPage = Integer.parseInt(pageNum);//현재 페이지 넘버
        dto.setStartRow((currentPage - 1) * pageSize + 1); //한 페이지의 시작글 번호
        dto.setEndRow(currentPage * pageSize);//한 페이지의 마지막 글번호
        int number=0;
        int count=0;
        ModelAndView mv = new ModelAndView();
		List list = null;
		if(dto.getMm()==null){
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat mm = new SimpleDateFormat("MM");
			SimpleDateFormat yy = new SimpleDateFormat("yyyy");
			String thisMonth = mm.format(cal.getTime());
			String thisYear = yy.format(cal.getTime());
			dto.setMm(thisMonth);
			dto.setYy(thisYear);
			//월별로 경기일정 출력
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
			//
			if(dto.getTeam().equals("전체")){
				list = sqlMapper.queryForList("listMonth", dto);
				//페이지 처리
		        count=(int)sqlMapper.queryForObject("listMonthCount", dto);
			} else {
				list = sqlMapper.queryForList("listTeam", dto);
				count=(int)sqlMapper.queryForObject("listTeamCount", dto);
			}
			mv.addObject("mon",list);
			mv.addObject("dto",dto);
		} else {
			//월별로 경기일정 출력
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
			//

			if(dto.getTeam().equals("전체")){
				list = sqlMapper.queryForList("listMonth", dto);
				//페이지 처리
		        count=(int)sqlMapper.queryForObject("listMonthCount", dto);
			} else {
				list = sqlMapper.queryForList("listTeam", dto);
				count=(int)sqlMapper.queryForObject("listTeamCount", dto);
			}
			mv.addObject("mon",list);
			mv.addObject("dto",dto);
		}
		mv.addObject("top","/top/top.jsp");
		mv.setViewName("/game/gameListMonth.jsp");
		//페이지 넘버
		number=count-(currentPage-1)*pageSize;
		mv.addObject("number", number);
		mv.addObject("pageNum", pageNum);
		mv.addObject("currentPage", new Integer(currentPage));
		mv.addObject("pageSize", new Integer(pageSize));
		mv.addObject("count", count);
		return mv;
	}
	
	
	
	
	//경기일정 수정
	@RequestMapping("/game/modifyForm.to")
	public String modifyForm(gameData dto, HttpServletRequest request) throws Exception{
		dto = (gameData) sqlMapper.queryForObject("matchInfo", dto.getNum());
		
		String team = request.getParameter("team");
		
		request.setAttribute("top", "/top/top.jsp");
		request.setAttribute("gm", dto);
		request.setAttribute("team", team);
		return "/game/modifyForm.jsp";
	}
	@RequestMapping("/game/modifyPro.to")
	public ModelAndView modifyPro(gameData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		dto.setReg_date2(dto.getDat()+dto.getHh()+dto.getMin());
		
		
		sqlMapper.update("matchInfoPro", dto);
		
		mv.addObject("league",dto.getLeague());
		mv.addObject("team",dto.getTeam());
		mv.setViewName("/game/modifyPro.jsp");
		return mv;
	}
	//경기일정 삭제
	@RequestMapping("/game/deletePro.to")
	public String deletePro(int num) throws Exception{
		sqlMapper.delete("matchDelPro", num);
		return "/game/deletePro.jsp";
	}
	//회차입력
		@RequestMapping("/round/roundForm.to")
		public String roundForm() throws Exception{
			return "/round/roundForm.jsp";
		}
		@RequestMapping("/round/roundPro1.to")
		public String roundPro1(gameData dto) throws Exception{
			sqlMapper.update("roundUpdate1", dto);
			return "/round/roundPro1.jsp";
		}
		@RequestMapping("/round/roundPro2.to")
		public String roundPro2(gameData dto) throws Exception{
			sqlMapper.update("roundUpdate2", dto);
			return "/round/roundPro2.jsp";
		}
	
	@RequestMapping("/game/gameMatch.to")
	public String gameMatch(HttpServletRequest request,gameData dto){
		request.setAttribute("top", "/top/top.jsp");
		
		List list = sqlMapper.queryForList("listMonth", dto);
		return "/game/gameMatch.jsp";
	}
	
	@RequestMapping("/game/gameMatchPro.to")
	public ModelAndView gameMatchPro(HttpServletRequest request,gameData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		dto.setLeague(request.getParameter("league"));
		dto.setHome(request.getParameter("home"));
		dto.setAway(request.getParameter("away"));
		dto.setFlag(request.getParameter("flag"));
		
//		System.out.println("getHome"+dto.getHome());
//		System.out.println("getAway"+dto.getAway());
//		System.out.println("getLeague"+dto.getLeague());
//		System.out.println("getFlag"+dto.getFlag());
		
		List MatchList = sqlMapper.queryForList("MatchList",dto);			//맞대결 해당팀 정보만
		List RecentlyMatch = sqlMapper.queryForList("RecentlyMatch",dto);	//맞대결 해당팀 최근 경기정보 1건만
		List AllMatchList = sqlMapper.queryForList("AllMatchList",dto);		//맞대결 전체팀 정보만
		List MatchList_5 = sqlMapper.queryForList("MatchList_5",dto);		//맞대결 해당팀 최근 경기 5건 정보만

		mv.addObject("home", dto.getHome());
		mv.addObject("away", dto.getAway());
		mv.addObject("league", dto.getLeague());
		
		mv.addObject("MatchList", MatchList);
		mv.addObject("RecentlyMatch", RecentlyMatch);
		mv.addObject("AllMatchList", AllMatchList);
		mv.addObject("MatchList_5", MatchList_5);
		
		mv.setViewName("/game/gameMatch.jsp");
		return mv;
	}
	@RequestMapping("/game/gameguidebar.to")
	public String GameGuideBar(){
		return "/game/gameguidebar.jsp";
	}
	@RequestMapping("/game/gameguidebar2.to")
	public String GameGuideBar2(){
		return "/game/gameguidebar2.jsp";
	}
	@RequestMapping("/game/gameguidebar3.to")
	public String GameGuideBar3(){
		return "/game/gameguidebar3.jsp";
	}
	
	@RequestMapping("/game/matchguide.to")
	public String MatchGuide(HttpServletRequest request){
		request.setAttribute("top", "/top/top.jsp");
		request.setAttribute("gamebar","/game/gameguidebar.jsp");
		request.setAttribute("gamebar2","/game/gameguidebar2.jsp");
		return "/game/matchguide.jsp";
	}
	@RequestMapping("/game/matchguide1.to")
	public String MatchGuide1(HttpServletRequest request){
		request.setAttribute("top", "/top/top.jsp");
		request.setAttribute("gamebar","/game/gameguidebar.jsp");
		request.setAttribute("gamebar2","/game/gameguidebar2.jsp");
		return "/game/matchguide1.jsp";
	}
	@RequestMapping("/game/soccertoto.to")
	public String Soccertoto(HttpServletRequest request){
		request.setAttribute("top", "/top/top.jsp");
		request.setAttribute("gamebar","/game/gameguidebar.jsp");
		request.setAttribute("gamebar3","/game/gameguidebar3.jsp");
		return "/game/soccertoto.jsp";
	}
	@RequestMapping("/game/soccertoto2.to")
	public String Soccertoto2(HttpServletRequest request){
		request.setAttribute("top", "/top/top.jsp");
		request.setAttribute("gamebar","/game/gameguidebar.jsp");
		request.setAttribute("gamebar3","/game/gameguidebar3.jsp");
		return "/game/soccertoto2.jsp";
	}
	@RequestMapping("/game/soccertoto3.to")
	public String Soccertoto3(HttpServletRequest request){
		request.setAttribute("top", "/top/top.jsp");
		request.setAttribute("gamebar","/game/gameguidebar.jsp");
		request.setAttribute("gamebar3","/game/gameguidebar3.jsp");
		return "/game/soccertoto3.jsp";
	}
	@RequestMapping("/game/baseballtoto.to")
	public String BasBalltoto(){
	
		return "/game/baseballtoto.jsp";
	}	
	@RequestMapping("/game/basketballtoto.to")
	public String BasKetballtoto(){
	
		return "/game/basketballtoto.jsp";
	}	


	
}
