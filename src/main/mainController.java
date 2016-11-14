package main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.payData;
import board.dto.BoardDTO;
import buygame.buygameData;

@Controller

public class mainController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("/top/main.to")
	public String main(HttpServletRequest request) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		String local=request.getParameter("local");
		if (pageNum == null) {
           pageNum = "1";
       }
	
			int pageSize = 5;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        int count = 0;
	        int count4 = 0;
	        int count3 = 0;
	        int count2 = 0;
	        int number=0;

     ArrayList<BoardDTO> brdlist1=new ArrayList<BoardDTO>();
     ArrayList<BoardDTO> brdlist2=new ArrayList<BoardDTO>();
     ArrayList<BoardDTO> brdlist3=new ArrayList<BoardDTO>();
     ArrayList<buygameData> gameslist =new ArrayList<buygameData>();
     
     HashMap map=new  HashMap();
     map.put("startRow", startRow);
     map.put("endRow", endRow);
     
     count4=(int)sqlMapper.queryForObject("getcount4", null);
     count2=(int)sqlMapper.queryForObject("getcount2", null);
     count3=(int)sqlMapper.queryForObject("getcount3", null);
     
        brdlist1 = (ArrayList<BoardDTO>)sqlMapper.queryForList("mainlist1", map);
		brdlist2 = (ArrayList<BoardDTO>)sqlMapper.queryForList("mainlist2", map);
		brdlist3 = (ArrayList<BoardDTO>)sqlMapper.queryForList("mainlist3", map);
		gameslist = (ArrayList<buygameData>)sqlMapper.queryForList("endlistGame2", map);
       
        number=count-(currentPage-1)*pageSize;
        request.setAttribute("brdlist1", brdlist1);
        request.setAttribute("brdlist2", brdlist2);
        request.setAttribute("brdlist3", brdlist3);
        request.setAttribute("gameslist", gameslist);

        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("pageSize", new Integer(pageSize));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count4", new Integer(count4));
        request.setAttribute("count2", new Integer(count2));
        request.setAttribute("count3", new Integer(count3));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("local", local);
        
        return "/top/main.jsp";
	}
	@RequestMapping("/top/top2.to")
	public String Top(HttpServletRequest request,HttpSession session) throws Exception{
		String id=(String) session.getAttribute("memId");
		int cash=-1;
		if(id!=null){
			cash = (int)sqlMapper.queryForObject("intcash", id);
		}
		
			request.setAttribute("cash", cash);
			request.setAttribute("id", id);
			return "/top/top2.jsp";
	}
}
