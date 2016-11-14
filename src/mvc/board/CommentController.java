package mvc.board;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.dto.BoardDTO;
import board.dto.CommentDTO;

@Controller
public class CommentController {

	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("/board1/commentwrite.to")
	public String CommentWrite(HttpServletRequest request,CommentDTO dto) throws Exception{
	
		String memId=request.getParameter("memId");
		int num = Integer.parseInt(request.getParameter("num"));
		int number1 = 0; 
		
		if(request.getParameter("number1") != null){
			number1 = Integer.parseInt(request.getParameter("number1"));
		}
		
		int num1 = dto.getKeynum();
		int ref = num1;
		int ref_step = dto.getRe_step();
		int ref_level = dto.getRe_level();
		int number = 0;

		int max = 0;
		int count =0;
		
		String pageNum = request.getParameter("pageNum");
		String local= request.getParameter("local");
		
	     Map map = new HashMap();
	     map.put("ref",  ref);
	     map.put("ref_step", ref_step);
		
	     count = (int)sqlMapper.queryForObject("Refcount", null);
	    
	     if(count != 0){
	 		max = (Integer)sqlMapper.queryForObject("maxnum", null);
	     }
	     if(max != 0){
				number = max + 1;

		}
			else{
				number = 1;

		}
	       //¥Ò±€¿« ¥Ò±€
	    if(num1!=0){

				sqlMapper.update("keyStep", map);
				ref_step = ref_step+1;
				ref_level = ref_level+1;
				dto.setRe_step(ref_step);
				dto.setRe_level(ref_level);
			//¥Ò±€
	    }else{
				ref=number;
				ref_step = 0;
				ref_level = 0;
				dto.setRef(ref);
				dto.setRe_step(ref_step);
				dto.setRe_level(ref_level);
			}

	    
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		sqlMapper.insert("cinsert", dto);
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("local",local);
		request.setAttribute("num1",new Integer(num1));
		request.setAttribute("num",new Integer(num));
		request.setAttribute("memId",memId);
		return"/board1/commentwrite.jsp";
	}
	@RequestMapping("/board1/commentdeleteform.to")
	public String CommentDeleteForm(HttpServletRequest request){
		int keynum = Integer.parseInt(request.getParameter("keynum"));
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String local = request.getParameter("local");
	
		request.setAttribute("num", new Integer(num));
		request.setAttribute("keynum", new Integer(keynum));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("local", local);
		
		
		return "/board1/commentdeleteform.jsp";
	}
	
	@RequestMapping("board1/commentdeletepro.to")
	public String CommentDeletePro(HttpServletRequest request){

			String pw=request.getParameter("pw");
			int keynum = Integer.parseInt(request.getParameter("keynum"));
			int num = Integer.parseInt(request.getParameter("num"));
			 String local=request.getParameter("pw");
			 String pageNum = request.getParameter("pageNum");
	
		    int check = 0;
		    String pass = null;
		     
		    pass = (String) sqlMapper.queryForObject("cpasscheck", keynum);
		    			
		    if(pw.equals(pass)){
		    	   sqlMapper.delete("cdeleteBoard",keynum);
		    	check = 1;
		    }
		    request.setAttribute("check", check);
		    request.setAttribute("num", new Integer(num));
		    request.setAttribute("local", local);
			request.setAttribute("pageNum", pageNum);
		   

		return "/board1/commentdeletepro.jsp";
	}
	
	@RequestMapping("/board1/commentmodifyform.to")
	public String CommentModifyForm(HttpServletRequest request){
		 int num = Integer.parseInt(request.getParameter("num"));
		 int keynum = Integer.parseInt(request.getParameter("keynum"));
		 String pageNum = request.getParameter("pageNum");
	  
	
	     
	     Object cmodifycontent = sqlMapper.queryForObject("cmodifycontent", keynum);
	     
	     
	      request.setAttribute("cmodifycontent", cmodifycontent);
		  request.setAttribute("num", new Integer(num));
		  request.setAttribute("keynum", new Integer(keynum));
		  request.setAttribute("pageNum", pageNum);
		  
		 
		return"/board1/commentmodifyform.jsp";
	}
	
	//ModelAndView ∑Œ «œ±‚
	@RequestMapping("/board1/commentmodifypro.to")
	public ModelAndView CommentModifyPro(CommentDTO dto, String pageNum,int num){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board1/commentmodifypro.jsp");
		int count=0;
		String pass = null;
		pass = (String) sqlMapper.queryForObject("cpasscheck", dto.getKeynum());
		if(dto.getPw().equals(pass)){
			sqlMapper.update("cupdatepro",dto);
		    count = 1;
		}	
		mv.addObject("count", count);
		mv.addObject("pageNum", pageNum);
		mv.addObject("num", new Integer(num));
		return mv;
	}
	@RequestMapping("/board1/admincommentdelete.to")
	public ModelAndView AdminCommentDelete(HttpServletRequest request  ){
		ModelAndView mv = new ModelAndView();
		int keynum = Integer.parseInt(request.getParameter("keynum"));
	
		sqlMapper.delete("cdeleteBoard", keynum);
		mv.setViewName("/board1/content.to");
		
		
		return mv;
	}
}
