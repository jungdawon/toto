package team;

import game.gameData;
import game.teamDTO;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



@Controller
public class TeamInformaionController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	//팀정보
	@RequestMapping("/teaminfomation/teaminformation.to")
	public String TeamInformation(gameData dto,HttpServletRequest request)throws Exception{
			String league=request.getParameter("league");
			
			Object teamscore = null;
		    List  teamscorelist= sqlMapper.queryForList("teamscore", dto);
		    
		    request.setAttribute("top","/top/top.jsp");
		    request.setAttribute("teamscorelist",teamscorelist);
		
		return "/teaminfomation/teaminformation.jsp";
	}
	
	@RequestMapping("/teaminfomation/teaminsert.to")
	public String TeamInsert(HttpServletRequest request){
		request.setAttribute("top","/top/top.jsp");

		return "/teaminfomation/teaminsert.jsp";
	}
	@RequestMapping("/teaminfomation/teaminsertpro.to")
	public String TeamInsertPro(MultipartHttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		String path = "C://workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp2//wtpwebapps//toto//up//";	//파일 경로
		//이미지 처리 방법
		MultipartFile mf = request.getFile("logo");
		String uploadName=mf.getOriginalFilename();
		teamDTO dto=new teamDTO();
		dto.setHometown(request.getParameter("hometown"));
		dto.setHomeground(request.getParameter("homeground"));
		dto.setCoach(request.getParameter("coach"));
		dto.setGrade(request.getParameter("grade"));
		dto.setHomepage(request.getParameter("homepage"));
		dto.setLogo(mf.getOriginalFilename());
		dto.setTeamname(request.getParameter("teamname"));
		File save = new File(path+uploadName);
		mf.transferTo(save);
		String league=request.getParameter("league");
		
		if(league.equals("KBL")){
			int count=1;
			request.setAttribute("count", new Integer(count));
		}
		if(league.equals("KBO")){
			int count=2;
			request.setAttribute("count", new Integer(count));	
		}
		if(league.equals("K리그")){
			int count=3;
			request.setAttribute("count", new Integer(count));
		}
		
		
		sqlMapper.insert("teaminsert", dto);
		request.setAttribute("league", league);
	
		return "/teaminfomation/teaminsertpro.jsp";
}
	@RequestMapping("/teaminfomation/teamcontent.to")
	public String TeamContent(HttpServletRequest request,gameData dto)throws Exception{
		  request.setAttribute("top","/top/top.jsp");
		  
		  String league=request.getParameter("league");
		  dto.setTeamname(request.getParameter("teamname"));
		  dto.setSnum(Integer.parseInt(request.getParameter("snum")));
		  
		  int var = (int) sqlMapper.queryForObject("teamGrade", dto); 
		  
		  List recentlist= null;
		  String teamname=request.getParameter("teamname");
		  //팀명체크 카운트
		  int count=0;
		  count=(int)sqlMapper.queryForObject("teamcount", teamname);
		  
		  ArrayList<teamDTO> teamlist=new ArrayList<teamDTO>();
		  HashMap map=new  HashMap();
		  map.put("teamname", teamname);
		 //팀정보 뿌려주기
	
		  if(count!=0){

	      Object teamgetlist = null;
	   	  teamlist = (ArrayList<teamDTO>)sqlMapper.queryForList("teamgetlist", map);
	   	  //최근 5경기,10경기 정보
	   	  recentlist = sqlMapper.queryForList("recently", dto);
	      }
		  //홈.원정 승무패 득.실점
		  dto=(gameData) sqlMapper.queryForObject("indiviteamscore", dto);
		  
		  dto.setTeamname(request.getParameter("teamname"));
		  dto.setVar(var);
		  
		   request.setAttribute("recentlist", recentlist);
		   request.setAttribute("topteamlist", "/teaminfomation/teamlist.jsp");
		   request.setAttribute("midteamlist", "/teaminfomation/teamlistmiddle.jsp");
		   request.setAttribute("teamlist", teamlist);
		   request.setAttribute("count", new Integer(count));
		   request.setAttribute("dto", dto);
		   request.setAttribute("team", dto.getTeamname());
		   request.setAttribute("teamname",teamname);
		   request.setAttribute("league",league);
		return "/teaminfomation/teamcontent.jsp";

		}
	@RequestMapping("/teaminfomation/teamcontentbase.to")
	public String TeamContentBase(HttpServletRequest request,gameData dto)throws Exception{
		  request.setAttribute("top","/top/top.jsp");
		  
		  String league=request.getParameter("league");
		  dto.setTeamname(request.getParameter("teamname"));
		  dto.setSnum(Integer.parseInt(request.getParameter("snum")));
		  
		  int var = (int) sqlMapper.queryForObject("teamGrade", dto); 
		  
		  List recentlist= null;
		  String teamname=request.getParameter("teamname");
	
		  //팀명체크 카운트
		  int count=0;
		  count=(int)sqlMapper.queryForObject("teamcount", teamname);
		  
		  ArrayList<teamDTO> teamlist=new ArrayList<teamDTO>();
		  HashMap map=new  HashMap();
		  map.put("teamname", teamname);
		 //팀정보 뿌려주기
		 
		  if(count!=0){
	      Object teamgetlist = null;
	   	  teamlist = (ArrayList<teamDTO>)sqlMapper.queryForList("teamgetlist", map);
	   	  //최근 5경기,10경기 정보
	 
	   	  recentlist = sqlMapper.queryForList("recently", dto);
	      }
		  //홈.원정 승무패 득.실점
		  dto=(gameData) sqlMapper.queryForObject("indiviteamscore", dto);
		  dto.setTeamname(request.getParameter("teamname"));
		  dto.setVar(var);
		  
		   request.setAttribute("recentlist", recentlist);
		   request.setAttribute("topteamlist", "/teaminfomation/teamlistbase.jsp");
		   request.setAttribute("midteamlist", "/teaminfomation/teamlistmiddlebase.jsp");
		   request.setAttribute("teamlist", teamlist);
		   request.setAttribute("count", new Integer(count));
		   request.setAttribute("dto", dto);
		   request.setAttribute("team", dto.getTeamname());
		   request.setAttribute("teamname",teamname);
		   request.setAttribute("league",league);
		   
		return "/teaminfomation/teamcontentbase.jsp";

		}
	
	@RequestMapping("/teaminfomation/teamcontentbasket.to")
	public String TeamContentBasket(HttpServletRequest request,gameData dto)throws Exception{
		 
		  request.setAttribute("top","/top/top.jsp");
		
		  String league=request.getParameter("league");
		  dto.setTeamname(request.getParameter("teamname"));
		  dto.setSnum(Integer.parseInt(request.getParameter("snum")));
	
		  int var = (int) sqlMapper.queryForObject("teamGrade", dto); 
		  
		  List recentlist= null;
		  String teamname=request.getParameter("teamname");
	
		  //팀명체크 카운트
		  int count=0;
		  count=(int)sqlMapper.queryForObject("teamcount", teamname);
		  
		  ArrayList<teamDTO> teamlist=new ArrayList<teamDTO>();
		  HashMap map=new  HashMap();
		  map.put("teamname", teamname);
		 //팀정보 뿌려주기
		 
		  if(count!=0){
	      Object teamgetlist = null;
	   	  teamlist = (ArrayList<teamDTO>)sqlMapper.queryForList("teamgetlist", map);
	   	  //최근 5경기,10경기 정보
	 
	   	  recentlist = sqlMapper.queryForList("recently", dto);
	      }
		  //홈.원정 승무패 득.실점
		  dto=(gameData) sqlMapper.queryForObject("indiviteamscore", dto);
		  dto.setTeamname(request.getParameter("teamname"));
		  dto.setVar(var);
		  
		   request.setAttribute("recentlist", recentlist);
		   request.setAttribute("topteamlist", "/teaminfomation/teamlistbasket.jsp");
		   request.setAttribute("midteamlist", "/teaminfomation/teamlistmiddlebasket.jsp");
		   request.setAttribute("teamlist", teamlist);
		   request.setAttribute("count", new Integer(count));
		   request.setAttribute("dto", dto);
	
		   request.setAttribute("team", dto.getTeamname());
		   request.setAttribute("teamname",teamname);
		   request.setAttribute("league",league);
		   
			
		return "/teaminfomation/teamcontentbasket.jsp";

		}
	
	@RequestMapping("/teaminfomation/teammodifyform.to")
	public String TeamModifyform(HttpServletRequest request){
	     request.setAttribute("top","/top/top.jsp");
	     
		 String teamname=request.getParameter("teamname");
		 String league=request.getParameter("league");

		 Object teammodify = sqlMapper.queryForObject("teammodify", teamname);

		 request.setAttribute("teammodify", teammodify);
		 request.setAttribute("league", league);
		 
		return "/teaminfomation/teammodifyform.jsp";
	}
	
	@RequestMapping("/teaminfomation/teammodifypro.to")
	public String TeamModifyPro(MultipartHttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException{
	
		String path = "C://workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp2//wtpwebapps//toto//up//";	//파일 경로
		//이미지 처리 방법
		MultipartFile mf = request.getFile("logo");
		String uploadName=mf.getOriginalFilename();
		teamDTO dto=new teamDTO();
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setHometown(request.getParameter("hometown"));
		dto.setHomeground(request.getParameter("homeground"));
		dto.setCoach(request.getParameter("coach"));
		dto.setGrade(request.getParameter("grade"));
		dto.setHomepage(request.getParameter("homepage"));
		dto.setLogo(mf.getOriginalFilename());
		dto.setTeamname(request.getParameter("teamname"));
		File save = new File(path+uploadName);
		mf.transferTo(save);
		
		String league=request.getParameter("league");
	
		if(league.equals("KBL")){
			int count=1;
			request.setAttribute("count", new Integer(count));
	
		}
		if(league.equals("KBO")){
			int count=2;
			request.setAttribute("count", new Integer(count));
		
		}
		if(league.equals("K리그")){
			int count=3;
			request.setAttribute("count", new Integer(count));
			
			
		}
		
		request.setAttribute("league", league);
		sqlMapper.update("teamupdate",dto);
		
		return "/teaminfomation/teammodifypro.jsp";
	}
	@RequestMapping("/teaminfomation/teamdelete.to")
	public String TeamDelete(HttpServletRequest request){
		 String teamname=request.getParameter("teamname");
		 
		  sqlMapper.delete("teamdelete",teamname);
		return "/teaminfomation/teamdelete.jsp";
	}
	@RequestMapping("/teaminfomation/teamlist.to")
	public String TeamList(gameData dto,HttpServletRequest request){
		
		if(dto.getTeamname()!=null){
			
		dto.setVar(Integer.parseInt(request.getParameter("var")));
		request.setAttribute("var",dto.getVar());
		request.setAttribute("team",dto.getTeamname());
		
		}
	
		return "/teaminfomation/teamlist.jsp";
	}
	@RequestMapping("/teaminfomation/teamlistbase.to")
	public String TeamListBase(gameData dto,HttpServletRequest request){
	
		if(dto.getTeamname()!=null){
			
		dto.setVar(Integer.parseInt(request.getParameter("var")));
		request.setAttribute("var",dto.getVar());
		request.setAttribute("team",dto.getTeamname());
		
		}
		return "/teaminfomation/teamlistbase.jsp";
	}
	@RequestMapping("/teaminfomation/teamlistbasket.to")
	public String TeamListBasket(gameData dto,HttpServletRequest request){
		
		if(dto.getTeamname()!=null){
			
		dto.setVar(Integer.parseInt(request.getParameter("var")));
		request.setAttribute("var",dto.getVar());
		request.setAttribute("team",dto.getTeamname());
		
		}
		return "/teaminfomation/teamlistbasket.jsp";
	}
	@RequestMapping("/teaminfomation/teamlistmiddle.to")
	public String TeamListMiddle(){
		
		return "/teaminfomation/teamlistmiddle.jsp";
	}
	@RequestMapping("/teaminfomation/teamlistmiddlebase.to")
	public String TeamListMiddleBase(){
		
		return "/teaminfomation/teamlistmiddlebase.jsp";
	}
	@RequestMapping("/teaminfomation/teamlistmiddlebasket.to")
	public String TeamListMiddleBasket(){
		
		return "/teaminfomation/teamlistmiddlebasket.jsp";
	}
	
	@RequestMapping("/teaminfomation/teaminformationbaseball.to")
		public String TeamInformationBaseBall(HttpServletRequest request,gameData dto){
		
		String league=request.getParameter("league");
		Object teamscore = null;
	
	    List  teamscorelist= sqlMapper.queryForList("teamscore", dto);
	   
	    request.setAttribute("top","/top/top.jsp");
	    request.setAttribute("teamscorelist",teamscorelist);
	
	
		return "/teaminfomation/teaminformationbaseball.jsp";
	}
	@RequestMapping("/teaminfomation/teaminformationbasketball.to")
	public String TeamInformationBasketBall(HttpServletRequest request,gameData dto){
	
	String league=request.getParameter("league");
	Object teamscore = null;

    List  teamscorelist= sqlMapper.queryForList("teamscore", dto);
   
    request.setAttribute("top","/top/top.jsp");
    request.setAttribute("teamscorelist",teamscorelist);


	return "/teaminfomation/teaminformationbasketball.jsp";
}

	
}