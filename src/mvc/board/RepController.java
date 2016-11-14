package mvc.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.dto.RepDTO;

@Controller
public class RepController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("/board1/repwrite.to")
	public String RepWrite(HttpServletRequest request){
		int num = Integer.parseInt(request.getParameter("num"));
		int keynum = Integer.parseInt(request.getParameter("keynum"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("num",new Integer(num));	
		request.setAttribute("keynum",new Integer(keynum));	
		request.setAttribute("pageNum",pageNum);
		return"/board1/repwrite.jsp";
	}
	@RequestMapping("/board1/repwritepro.to")
	public String RepWritePro(RepDTO dto,HttpServletRequest request)throws Exception{
		
		
		String pageNum = request.getParameter("pageNum");

		sqlMapper.insert("rinsert", dto);
		
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("num", dto.getNum());

		return "/board1/repwritepro.jsp";
	}
	@RequestMapping("board1/repmodifyform.to")
	public String RepModifyForm(HttpServletRequest request){
		 int repnum = Integer.parseInt(request.getParameter("repnum"));
		 int num = Integer.parseInt(request.getParameter("num"));
		 int keynum = Integer.parseInt(request.getParameter("keynum"));
		 String pageNum = request.getParameter("pageNum");
	
	     Object rmodifycontent = sqlMapper.queryForObject("rmodifycontent", repnum);
	     
	      request.setAttribute("rmodifycontent", rmodifycontent);
		  request.setAttribute("num", new Integer(num));
		  request.setAttribute("keynum", new Integer(keynum));
		  request.setAttribute("repnum", new Integer(repnum));
		  request.setAttribute("pageNum", pageNum);
		
		return "/board1/repmodifyform.jsp";
	}
	@RequestMapping("/board1/repmodifypro.to")
	public ModelAndView RepModifyPro(HttpServletRequest request,RepDTO dto, String pageNum,int num){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board1/repmodifypro.jsp");
		
		int count=0;
		String pass = null;
		pass = (String) sqlMapper.queryForObject("rpasscheck", dto.getRepnum());
		if(dto.getPw().equals(pass)){
			sqlMapper.update("rupdatepro",dto);
		    count = 1;
		}	
		mv.addObject("count", count);
		mv.addObject("pageNum", pageNum);
		mv.addObject("num", new Integer(num));
		
		return mv;
	}
}
