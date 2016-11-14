package gameMatch;

import game.gameData;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class gameMatchController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("/gamebuy/soccerMatch.to")
	public String soccerMatch(HttpServletRequest request,gameData dto){
		request.setAttribute("top", "/top/top.jsp");
		dto.setFlag("°æ±âÀü");
		List soccerMatchList_5 = sqlMapper.queryForList("soccerMatchList_5",dto);
		request.setAttribute("soccerMatchList_5", soccerMatchList_5);
		return "/gamebuy/soccerMatch.jsp";
	}
	@RequestMapping("/gamebuy/soccerMatchInput.to")
	public String soccerMatchInput(HttpServletRequest request){
		request.setAttribute("top", "/top/top.jsp");
		return "/gamebuy/soccerMatchInput.jsp";
	}
	@RequestMapping("/gamebuy/soccerMatchPro.to")
	public String soccerMatchPro(gameMatchData dto,HttpServletRequest request){
		request.setAttribute("top", "/top/top.jsp");

//		System.out.println(request.getParameter("num"));
//		System.out.println(request.getParameter("matchpoint"));
		
		sqlMapper.insert("soccerMatch", dto);
		
		return "/gamebuy/soccerMatchInput.jsp";
	}
	@RequestMapping("/gamebuy/soccerMatchView.to")
	public String soccerMatchView(int num,HttpServletRequest request,gameData dto)throws Exception{
		request.setAttribute("top", "/top/top.jsp");
		
//		int num1 = 7;

		List matchList = sqlMapper.queryForList("soccerMatchView",num);
		dto = (gameData) sqlMapper.queryForObject("soccerMatchList_1",num);
		
		System.out.println(dto);

		request.setAttribute("matchList", matchList);
	//	request.setAttribute("gameList", matchList);
		request.setAttribute("dto", dto);
		return "/gamebuy/soccerMatchView.jsp";
	}
}
