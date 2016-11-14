package admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.memberData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
//결제 관련,매출관련
@Controller
public class payController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	//테스트 폼
	@RequestMapping("/agspay/pay.to")
	public String pay(){
		
		return "/agspay/pay.jsp";
	}
	//결제금액,방법 입력폼
	@RequestMapping("/agspay/AGS_pay.to")
	public ModelAndView AGS_pay(HttpSession session, memberData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		dto = (memberData) sqlMapper.queryForObject("myInfor", session.getAttribute("memId"));
		mv.addObject("top", "/top/top.jsp");
		mv.addObject("my", dto);
		mv.setViewName("/agspay/AGS_pay.jsp");
		return mv;
	}
	//결제 Pro
	@RequestMapping("/agspay/AGS_pay_ing.to")
	public String AGS_pay_ing(HttpServletRequest request,payData pay){
		System.out.println("job1 : "+request.getParameter("Job"));
		
		return "/agspay/AGS_pay_ing.jsp";
	}
	//결제 완료 Form
	@RequestMapping("/agspay/AGS_pay_result.to")
	public String AGS_pay_result(HttpServletRequest request,payData pay){
		request.setAttribute("top", "/top/top.jsp");
		pay.setPrice(Integer.parseInt(request.getParameter("rAmt")));
		pay.setId(request.getParameter("UserId"));
		pay.setJob(request.getParameter("Job"));
		pay.setRstoreid(request.getParameter("rStoreId"));
		pay.setRapprno(request.getParameter("rApprNo"));
		pay.setRapprtm(request.getParameter("rApprTm"));
		pay.setRdealno(request.getParameter("rDealNo"));
		
		System.out.println("job2 : "+request.getParameter("Job"));
		sqlMapper.insert("payInsert", pay);
		
		sqlMapper.update("PayPlus", pay);
		
		return "/agspay/AGS_pay_result.jsp";
	}
	@RequestMapping("/admin/payResult.to")
	public ModelAndView PayResult(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		GregorianCalendar gc = new GregorianCalendar();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss"); // 기본 데이타베이스 저장 타입
	    Date d = gc.getTime(); // Date -> util 패키지
	    String str = sf.format(d);	//오늘날짜
	    
	    Calendar day = Calendar.getInstance();
	    day.add ( Calendar.DATE, -1 );
	    Date tomorrow = day.getTime ( );	
	    String str2 = sf.format(tomorrow);	//어제날짜
	    
	    int flag = Integer.parseInt(request.getParameter("flag"));
	//    todayPrice = (int) sqlMapper.queryForObject("TodayPrice", str);
	    List totoList = null;
	    List protoList = null;
	    List result_protoList = null;
	    List result_totoList = null;
	    
	    totoList = sqlMapper.queryForList("totoResult", null);	//승무패
	    protoList = sqlMapper.queryForList("protoResult", null);//승부식
	    
	    if(flag == 1){	//승무패 리스트
	    	result_protoList = sqlMapper.queryForList("result_protoList", null);//승무패 결과 5건
	    	mv.addObject("flag",flag);
	    	mv.addObject("result_protoList",result_protoList);
	    }
	    else if(flag == 2){
	    	result_totoList = sqlMapper.queryForList("result_totoList", null);//승부식 결과 5건
	    	mv.addObject("flag",flag);
	    	mv.addObject("result_totoList",result_totoList);	
	    }
	    
	  //지난주 판매 구하기
	    Calendar today = Calendar.getInstance ( );//시작 요일
	    Calendar week_star = Calendar.getInstance ( );//지난주 시작 요일
	    Calendar week_end = Calendar.getInstance ( );//지난주 끝 요일
	    Calendar week_star1 = Calendar.getInstance ( );//이번주 시작 요일
	    Calendar week_end1 = Calendar.getInstance ( );//이번주 끝 요일
	    int day_of_week = today.get ( Calendar.DAY_OF_WEEK );;//요일구하기
	    //day_of_week => (1=일요일,2=월요일,3=화요일........)
	    
	    //일주일전 날짜구하기
	    if(day_of_week == 1){//today == 일요일
	    	week_star.add ( Calendar.DATE, -13 );	//지난주의 월요일을 지정
	    	Date hanju = week_star.getTime ( );		
	    	String ju = sf.format(hanju);			
	    	
	    	week_end.add ( Calendar.DATE, -7 );		//지난주의 일요일 지정
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);	
	    	//이번주 날짜구하기
	    	week_star1.add ( Calendar.DATE, -6 );	//이번주 월요일 지정
	    	Date hanju1 = week_star1.getTime ( );	
	    	String ju1 = sf.format(hanju1);			
	    	
	    	week_end1.add ( Calendar.DATE, 0 );		//이번주 일요일 지정
	    	Date hanju_end1 = week_end1.getTime ( );
	    	String ju_end1 = sf.format(hanju_end1);	
	    	
	    	mv.addObject("ju", ju);
	    	mv.addObject("ju_end", ju_end);
	    	mv.addObject("ju1", ju1);
	    	mv.addObject("ju_end1", ju_end1);
	    }else if(day_of_week == 2){//today == 월요일
	    	week_star.add ( Calendar.DATE, -7 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);
	    	
	    	week_end.add ( Calendar.DATE, -1 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//이번주 날짜구하기
	    	week_star1.add ( Calendar.DATE, 0 );
	    	Date hanju1 = week_star1.getTime ( );	
	    	String ju1 = sf.format(hanju1);
	    	
	    	week_end1.add ( Calendar.DATE, +6 );
	    	Date hanju_end1 = week_end1.getTime ( );	
	    	String ju_end1 = sf.format(hanju_end1);
	    	
//	    	System.out.println(ju1);
//	    	System.out.println(ju_end1);
	    	mv.addObject("ju", ju);
	    	mv.addObject("ju_end", ju_end);
	    	mv.addObject("ju1", ju1);
	    	mv.addObject("ju_end1", ju_end1);
	    }else if(day_of_week == 3){//today == 화요일
	    	week_star.add ( Calendar.DATE, -8 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);		 
	    	
	    	week_end.add ( Calendar.DATE, -2 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//이번주 날짜구하기
	    	week_star1.add ( Calendar.DATE, -1 );
	    	Date hanju1 = week_star1.getTime ( );	
	    	String ju1 = sf.format(hanju1);
	    	
	    	week_end1.add ( Calendar.DATE, +5 );
	    	Date hanju_end1 = week_end1.getTime ( );	
	    	String ju_end1 = sf.format(hanju_end1);
	    		
	    	mv.addObject("ju", ju);
	    	mv.addObject("ju_end", ju_end);
	    	mv.addObject("ju1", ju1);
	    	mv.addObject("ju_end1", ju_end1);
	    }else if(day_of_week == 4){//today == 수요일
	    	week_star.add ( Calendar.DATE, -9 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);		 
	    	
	    	week_end.add ( Calendar.DATE, -3 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//이번주 날짜구하기
	    	week_star1.add ( Calendar.DATE, -2 );
	    	Date hanju1 = week_star1.getTime ( );	
	    	String ju1 = sf.format(hanju1);
	    	
	    	week_end1.add ( Calendar.DATE, +4 );
	    	Date hanju_end1 = week_end1.getTime ( );	
	    	String ju_end1 = sf.format(hanju_end1);
	    	
	    	mv.addObject("ju", ju);
	    	mv.addObject("ju_end", ju_end);
	    	mv.addObject("ju1", ju1);
	    	mv.addObject("ju_end1", ju_end1);
	    }else if(day_of_week == 5){//today == 목요일
	    	week_star.add ( Calendar.DATE, -10 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);		 
	    	
	    	week_end.add ( Calendar.DATE, -4 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//이번주 날짜구하기
	    	week_star1.add ( Calendar.DATE, -3 );
	    	Date hanju1 = week_star1.getTime ( );	
	    	String ju1 = sf.format(hanju1);
	    	
	    	week_end1.add ( Calendar.DATE, +3 );
	    	Date hanju_end1 = week_end1.getTime ( );	
	    	String ju_end1 = sf.format(hanju_end1);
	    	
	    	mv.addObject("ju", ju);
	    	mv.addObject("ju_end", ju_end);
	    	mv.addObject("ju1", ju1);
	    	mv.addObject("ju_end1", ju_end1);
	    }else if(day_of_week == 6){//today == 금요일
	    	week_star.add ( Calendar.DATE, -11 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);		 
	    	
	    	week_end.add ( Calendar.DATE, -5 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//이번주 날짜구하기
	    	week_star1.add ( Calendar.DATE, -4 );
	    	Date hanju1 = week_star1.getTime ( );	
	    	String ju1 = sf.format(hanju1);
	    	
	    	week_end1.add ( Calendar.DATE, +2 );
	    	Date hanju_end1 = week_end1.getTime ( );	
	    	String ju_end1 = sf.format(hanju_end1);
	    	
	    	mv.addObject("ju", ju);
	    	mv.addObject("ju_end", ju_end);
	    	mv.addObject("ju1", ju1);
	    	mv.addObject("ju_end1", ju_end1);
	    }else if(day_of_week == 7){//today == 토요일
	    	week_star.add ( Calendar.DATE, -12 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);
	    	
	    	week_end.add ( Calendar.DATE, -6 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//이번주 날짜구하기
	    	week_star1.add ( Calendar.DATE, -5 );
	    	Date hanju1 = week_star1.getTime ( );	
	    	String ju1 = sf.format(hanju1);
	    	
	    	week_end1.add ( Calendar.DATE, +1 );
	    	Date hanju_end1 = week_end1.getTime ( );	
	    	String ju_end1 = sf.format(hanju_end1);
	    	
	    	mv.addObject("ju", ju);
	    	mv.addObject("ju_end", ju_end);
	    	mv.addObject("ju1", ju1);
	    	mv.addObject("ju_end1", ju_end1);
	    }
	    
	    
	    mv.addObject("str", str);
	    mv.addObject("str2", str2);
	    mv.addObject("totoList", totoList);
	    mv.addObject("protoList", protoList);
		mv.addObject("top", "/top/top.jsp");
		mv.setViewName("/admin/payResult.jsp");
		return mv;
	}
}
