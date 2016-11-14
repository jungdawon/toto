package admin;


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

import board.dto.BoardDTO;
import member.cancelData;



@Controller
public class depositController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;

	@RequestMapping("/deposit/mydeposit.to")
	public String MyDeposit(HttpServletRequest request,int datebar,HttpSession session)throws Exception{
		String pageNum = request.getParameter("pageNum");
		String id=(String) session.getAttribute("memId");
		
		if (pageNum == null) {
           pageNum = "1";
       }
	
			int pageSize = 10;//한 페이지의 글의 개수
	        int currentPage = Integer.parseInt(pageNum);//현재 페이지 넘버
	        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
	        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
	        int count = 0;	//전체글 갯수
	        int number=0;
	        
		    count=(int)sqlMapper.queryForObject("paycount", id);
		 
		  

	  /*      if(count!=0){
	        	Object paylist = null;
	        	 payboardlist = (ArrayList<payData>)sqlMapper.queryForList("paylist", map);
	        }*/
	
	        number=count-(currentPage-1)*pageSize;
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("pageSize", new Integer(pageSize));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("id", id);
	        request.setAttribute("number", number);
	        
	        GregorianCalendar gc = new GregorianCalendar();
	        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	        Date d = gc.getTime(); // Date -> util 패키지
		    String today = sf.format(d);	//오늘날짜

		    Calendar day = Calendar.getInstance();
		    Calendar day1 = Calendar.getInstance();
		    Calendar day2 = Calendar.getInstance();
		    Calendar day3 = Calendar.getInstance();
		    
		    ArrayList<payData> searchpayboardlist=new ArrayList<payData>();
	        HashMap paymap=new  HashMap();
		    Object searchpaylist = null;
		    
		    ArrayList<cancelData> cancellist=new ArrayList<cancelData>();
		    Object cancelboardlist = null;
		    
		    if(datebar ==7){
		    
			    day.add ( Calendar.DATE, -7 );
			    Date tomorrow = day.getTime();
			    String str = sf.format(tomorrow);
			   
		        paymap.put("startRow", startRow);
		        paymap.put("id",id);
		        paymap.put("endRow", endRow);
		        paymap.put("today", today);
		        paymap.put("str", str);
		       		        
		        searchpayboardlist = (ArrayList<payData>) sqlMapper.queryForList("searchpaylist", paymap);
		       
		        request.setAttribute("str",str);
		        request.setAttribute("datebar",datebar);

			  
		    }if(datebar==15){
		    	    day1.add ( Calendar.DATE, -15 );
				    Date tomorrow1 = day1.getTime();
				    String str = sf.format(tomorrow1);
			        paymap.put("id", id);
			        paymap.put("startRow", startRow);
			        paymap.put("endRow", endRow);
			        paymap.put("today", today);
			        paymap.put("str", str);
			 		
				    searchpayboardlist = (ArrayList<payData>)sqlMapper.queryForList("searchpaylist", paymap);
			
				    request.setAttribute("str",str);
				    request.setAttribute("datebar",datebar);

		    }if(datebar==30){
		    		day2.add ( Calendar.DATE, -30);
				    Date tomorrow2 = day2.getTime();
				    String str = sf.format(tomorrow2);
			        paymap.put("id", id);
			        paymap.put("startRow", startRow);
			        paymap.put("endRow", endRow);
			        paymap.put("today", today);
			        paymap.put("str", str);
			    
			        searchpayboardlist = (ArrayList<payData>)sqlMapper.queryForList("searchpaylist", paymap);
				    
				    request.setAttribute("str",str);
			        request.setAttribute("datebar",datebar);
		    }if(datebar==90){
	    		day3.add ( Calendar.DATE, -90);
			    Date tomorrow3 = day3.getTime();
			    String str = sf.format(tomorrow3);
		        paymap.put("id", id);
		        paymap.put("startRow", startRow);
		        paymap.put("endRow", endRow);
		        paymap.put("today", today);
		        paymap.put("str", str);

		       // cancelboardlist = (ArrayList<payData>) sqlMapper.queryForList("cancelboardlist", paymap);
			    searchpayboardlist = (ArrayList<payData>)sqlMapper.queryForList("searchpaylist", paymap);
			    	
			    	request.setAttribute("datebar",datebar);
			        request.setAttribute("str", str);
		    }
		    
	        request.setAttribute("today",today);
	        request.setAttribute("searchpayboardlist",searchpayboardlist);
	        //request.setAttribute("cancelboardlist",cancelboardlist);
	        request.setAttribute("bar","/deposit/datebar.jsp");
	        
		return"/deposit/mydeposit.jsp";
	}
	@RequestMapping("/deposit/datebar.to")
	public String DateBar(int datebar,HttpServletRequest request){
		request.setAttribute("datebar",datebar);
		
		return "/deposit/datebar.jsp";
	}
	@RequestMapping("/deposit/datebar1.to")
	public String DateBar1(int datebar,HttpServletRequest request){
		request.setAttribute("datebar",datebar);
		
		return "/deposit/datebar1.jsp";
	}
	@RequestMapping("/deposit/mywithdrawal.to")
	public String MyWithdrawal(HttpServletRequest request,HttpSession session,int datebar)throws Exception{
		String pageNum = request.getParameter("pageNum");
		String id=(String) session.getAttribute("memId");

		if (pageNum == null) {
           pageNum = "1";
       }
	
			int pageSize = 10;//한 페이지의 글의 개수
	        int currentPage = Integer.parseInt(pageNum);//현재 페이지 넘버
	        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
	        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
	        int count = 0;	//전체글 갯수
	        int number=0;
	        count=(int)sqlMapper.queryForObject("cancelcount", id);
	
	        number=count-(currentPage-1)*pageSize;
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("pageSize", new Integer(pageSize));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("id", id);
	        request.setAttribute("number", number);
	        
	        
	        GregorianCalendar gc = new GregorianCalendar();
	        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	        Date d = gc.getTime(); // Date -> util 패키지
		    String today = sf.format(d);	//오늘날짜

		    Calendar day = Calendar.getInstance();
		    Calendar day1 = Calendar.getInstance();
		    Calendar day2 = Calendar.getInstance();
		    Calendar day3 = Calendar.getInstance();
		    
		    ArrayList<cancelData> cancelpayboardlist=new ArrayList<cancelData>();
	        HashMap cancelmap=new  HashMap();
		    Object cancelpaylist = null;
		    
		    if(datebar ==7){
			
			    day.add ( Calendar.DATE, -7 );
			    Date tomorrow = day.getTime();
			    String str = sf.format(tomorrow);
			   
			    cancelmap.put("startRow", startRow);
			    cancelmap.put("id",id);
			    cancelmap.put("endRow", endRow);
		        cancelmap.put("today", today);
		        cancelmap.put("str", str);

		        cancelpayboardlist = (ArrayList<cancelData>) sqlMapper.queryForList("cancelpaylist", cancelmap);
		        System.out.println(cancelpayboardlist);
		       
		        request.setAttribute("str",str);
		        request.setAttribute("datebar",datebar);

		    }if(datebar==15){
		    	    day1.add ( Calendar.DATE, -15 );
				    Date tomorrow1 = day1.getTime();
				    String str = sf.format(tomorrow1);
				    cancelmap.put("id", id);
				    cancelmap.put("startRow", startRow);
				    cancelmap.put("endRow", endRow);
				    cancelmap.put("today", today);
				    cancelmap.put("str", str);
			 
			   
			        cancelpayboardlist = (ArrayList<cancelData>)sqlMapper.queryForList("cancelpaylist", cancelmap);
			
				    request.setAttribute("str",str);
				    request.setAttribute("datebar",datebar);

		    }if(datebar==30){
		    		day2.add ( Calendar.DATE, -30);
				    Date tomorrow2 = day2.getTime();
				    String str = sf.format(tomorrow2);
				    cancelmap.put("id", id);
			        cancelmap.put("startRow", startRow);
			        cancelmap.put("endRow", endRow);
			        cancelmap.put("today", today);
			        cancelmap.put("str", str);
			    
			       
			        cancelpayboardlist = (ArrayList<cancelData>)sqlMapper.queryForList("cancelpaylist", cancelmap);
				    
	
				    request.setAttribute("str",str);
			        request.setAttribute("datebar",datebar);
		    }if(datebar==90){
	    		day3.add ( Calendar.DATE, -90);
			    Date tomorrow3 = day3.getTime();
			    String str = sf.format(tomorrow3);
			    cancelmap.put("id", id);
		        cancelmap.put("startRow", startRow);
		        cancelmap.put("endRow", endRow);
		        cancelmap.put("today", today);
		        cancelmap.put("str", str);

		     
		       cancelpayboardlist = (ArrayList<cancelData>)sqlMapper.queryForList("cancelpaylist", cancelmap);

			    request.setAttribute("str",str);
		        request.setAttribute("datebar",datebar);
		    }
		    request.setAttribute("today",today);
	        request.setAttribute("cancelpayboardlist",cancelpayboardlist);
	        request.setAttribute("bar","/deposit/datebar1.jsp");
		    
		return "/deposit/mywithdrawal.jsp";
	}
}
