package mvc.board;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.dto.BoardDTO;

@Controller
public class WriterController {
 
	
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("/board1/list.to")
	public String List(HttpServletRequest request)throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		String local=request.getParameter("local");
		if (pageNum == null) {
           pageNum = "1";
       }
	
			int pageSize = 10;//한 페이지의 글의 개수
	        int currentPage = Integer.parseInt(pageNum);//현재 페이지 넘버
	        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
	        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
	        int count = 0;	//전체글 갯수
	        int number=0;

        count=(int)sqlMapper.queryForObject("getcount", local);//돌려주는 값이 없으므로 null을 준다.
	

     ArrayList<BoardDTO> brdlist=new ArrayList<BoardDTO>();
     HashMap map=new  HashMap();
     map.put("startRow", startRow);
     map.put("endRow", endRow);
     map.put("local", local);
     //게시판에 게시글 목록 보여주기
        if(count!=0){
        Object getlist = null;
		brdlist = (ArrayList<BoardDTO>)sqlMapper.queryForList("getlist", map);
       }
        number=count-(currentPage-1)*pageSize;
        request.setAttribute("top", "/top/top.jsp");
        request.setAttribute("brdlist", brdlist);
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("pageSize", new Integer(pageSize));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("number", number);
        request.setAttribute("local", local);
        
		return "/board1/list.jsp";
	}
	
	
	@RequestMapping("/board1/write.to")
	public String Write(HttpServletRequest request){
		String local=request.getParameter("local");
		String pageNum=request.getParameter("pageNum");
		String memId=request.getParameter("memId");
		
		request.setAttribute("top", "/top/top.jsp");
		request.setAttribute("memId", memId);
        request.setAttribute("local", local);
        request.setAttribute("pageNum", pageNum);
		return "/board1/write.jsp";
	}
	
	@RequestMapping("/board1/writepro.to")
	public String Writepro(BoardDTO dto,HttpServletRequest request){
		String local=request.getParameter("local");
		String pageNum = request.getParameter("pageNum");
	
		sqlMapper.insert("insert", dto);
		
		request.setAttribute("local", local);
		request.setAttribute("pageNum", pageNum);

		return "/board1/writepro.jsp";
	}
	@RequestMapping("/board1/content.to")
	public String Content(HttpServletRequest request)throws Exception{
		 
		  int num = Integer.parseInt(request.getParameter("num"));
		  String pageNum = request.getParameter("pageNum");
	      String local= request.getParameter("local");
	      String memId=request.getParameter("memId");
	      
		  sqlMapper.update("updatereadcount",num);
		  //게시판 게시글
		  Object contentlist = sqlMapper.queryForObject("contentlist", num);

	
		  	Object cgetlist = null;
		    ArrayList<BoardDTO> cbrdlist=new ArrayList<BoardDTO>();
		    //게시판 댓글
		  	cbrdlist = (ArrayList<BoardDTO>)sqlMapper.queryForList("cgetlist", num);
			
		  request.setAttribute("top", "/top/top.jsp");
		  request.setAttribute("memId", memId);
		  request.setAttribute("cbrdlist", cbrdlist);
		  request.setAttribute("contentlist", contentlist);
		  request.setAttribute("num", new Integer(num));
		  request.setAttribute("pageNum", pageNum);
		  request.setAttribute("local", local);
		
		return "/board1/content.jsp";
	}
	
	@RequestMapping("board1/modifyform.to")
	public String ModifyForm(HttpServletRequest request){
		  int num = Integer.parseInt(request.getParameter("num"));
		  String pageNum = request.getParameter("pageNum");
		  //게시글 수정
		  Object modifycontent = sqlMapper.queryForObject("modifycontent", num);
		  
		  request.setAttribute("top", "/top/top.jsp");
		  request.setAttribute("num", new Integer(num));
		  request.setAttribute("pageNum", pageNum);
		  request.setAttribute("modifycontent", modifycontent);
		  
		return "/board1/modifyform.jsp";
	}
	
	@RequestMapping("/board1/modifypro.to")
	public String ModifyPro(HttpServletRequest request,BoardDTO dto){

	    String pageNum = request.getParameter("pageNum");
	    int num = Integer.parseInt(request.getParameter("num"));
	    String local = request.getParameter("local");
	    String pw =request.getParameter("pw");
	    int check = 0;
	    String pass = null;
	     
	    pass = (String) sqlMapper.queryForObject("passcheck", num);
	    			
	    if(pw.equals(pass)){
	    	sqlMapper.update("updatepro",dto);
	    	check = 1;
	    }
	    
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("num", new Integer(num));
	    request.setAttribute("local", local);
	    request.setAttribute("check", check);
	    
		return"/board1/modifypro.jsp";
	}
	@RequestMapping("/board1/deleteform.to")
	public String DeleteForm(HttpServletRequest request,BoardDTO dto){
		 int num = Integer.parseInt(request.getParameter("num"));
		 String pageNum = request.getParameter("pageNum");
		 String local = request.getParameter("local");
		 

		 sqlMapper.update("datedelete",num);
		 Object selectdelete = sqlMapper.queryForObject("selectdelete", num);
		 request.setAttribute("selectdelete", selectdelete);
		 
		 request.setAttribute("num", new Integer(num));
		 request.setAttribute("pageNum",new String(pageNum));
		 request.setAttribute("local",local);

		return"/board1/deleteform.jsp";
	}
	@RequestMapping("/board1/deletepro.to")
	public String DeletePro(HttpServletRequest request,BoardDTO dto){
		 int num = Integer.parseInt(request.getParameter("num"));
		 String pageNum = request.getParameter("pageNum");
		 String pw =request.getParameter("pw");

		 
		    int check = 0;
		    String pass = null;
		     
		    pass = (String) sqlMapper.queryForObject("passcheck", num);
		    			
		    if(pw.equals(pass)){
		    	   sqlMapper.delete("deleteBoard",num);
		    	check = 1;
		    }
		    request.setAttribute("check", check);
			request.setAttribute("pageNum",new String(pageNum));
		return "/board1/deletepro.jsp";
	}
	@RequestMapping("/board1/search.to")
	public String Search(HttpServletRequest request,String search,String searchvalue){

		String pageNum = request.getParameter("pageNum");
		String local=request.getParameter("local");
		if (pageNum == null) {
           pageNum = "1";
       }
	
			int pageSize = 10;//한 페이지의 글의 개수
	        int currentPage = Integer.parseInt(pageNum);//현재 페이지 넘버
	        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
	        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
	        int count = 0;	//전체글 갯수
	        int number=0;
	        
	        HashMap searchmap=new  HashMap();
	        searchmap.put("searchvalue", searchvalue);
	        searchmap.put("search", search);
	        searchmap.put("local", local);
	     
	        
	        count=(int)sqlMapper.queryForObject("searchcount", searchmap);
	  

	        
	        ArrayList<BoardDTO> brdlist=new ArrayList<BoardDTO>();
	        HashMap map=new  HashMap();
	        map.put("searchvalue", searchvalue);
	        map.put("search", search);
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("local", local);
	        
	        
			if(count!=0){
	            Object boardsearch = null;
	            brdlist = (ArrayList<BoardDTO>)sqlMapper.queryForList("boardsearch", map);
	           }
	        
	        number=count-(currentPage-1)*pageSize;
	        
	        request.setAttribute("top", "/top/top.jsp");
	        request.setAttribute("brdlist", brdlist);
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("pageSize", new Integer(pageSize));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("number", number);
	        request.setAttribute("local", local);
	        request.setAttribute("search", search);
		    request.setAttribute("searchvalue", searchvalue);
		
		return "/board1/search.jsp";
	}

	@RequestMapping("/board1/mylist.to")
		public String MyList(HttpServletRequest request){
		HttpSession session=request.getSession();
		String writer=(String)session.getAttribute("memId");
		String pageNum = request.getParameter("pageNum");
		String local=request.getParameter("local");
		String gubun = request.getParameter("gubun");
	

		if (pageNum == null) {
           pageNum = "1";
       }
	
			int pageSize = 10;//한 페이지의 글의 개수
	        int currentPage = Integer.parseInt(pageNum);//현재 페이지 넘버
	        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
	        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
	        int count = 0;//전체글 갯수
	        int count2 = 0;	
	        int count3 = 0;
	        int number=0;
	        int number2=0;
	        int number3=0;
	        

	        
	        count=(int)sqlMapper.queryForObject("mycount", writer);
	        count2=(int)sqlMapper.queryForObject("mycount2", writer);
	        count3=(int)sqlMapper.queryForObject("mycount3", writer);
	  
	        ArrayList<BoardDTO> brdlist=new ArrayList<BoardDTO>();
	        HashMap map=new  HashMap();
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("writer", writer);
	        map.put("local", local);
	        
	      
		if(gubun.equals("all")){
	            Object mylist = null;
	            brdlist = (ArrayList<BoardDTO>)sqlMapper.queryForList("mylist", map);
	            
	           }
		if(gubun.equals("indivi")){
			 Object localmylist = null;
			 brdlist = (ArrayList<BoardDTO>)sqlMapper.queryForList("localmylist", map);
		}

		if(gubun.equals("indivi2")){
			 Object localmylist = null;
			 brdlist = (ArrayList<BoardDTO>)sqlMapper.queryForList("localmylist", map);
		}

	
	        number=count-(currentPage-1)*pageSize;
	        number2=count2-(currentPage-1)*pageSize;
	        number3=count3-(currentPage-1)*pageSize;
	  
	        
	        request.setAttribute("top", "/top/top.jsp");
	        request.setAttribute("brdlist", brdlist);
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("pageSize", new Integer(pageSize));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("count2", new Integer(count2));
	        request.setAttribute("count3", new Integer(count3));
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("number", number);
	        request.setAttribute("number2", number2);
	        request.setAttribute("number3", number3);
	        request.setAttribute("local", local);
	        request.setAttribute("gubun", gubun);
		return "/board1/mylist.jsp";
	}

	
}
