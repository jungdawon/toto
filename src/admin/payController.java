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
//���� ����,�������
@Controller
public class payController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	//�׽�Ʈ ��
	@RequestMapping("/agspay/pay.to")
	public String pay(){
		
		return "/agspay/pay.jsp";
	}
	//�����ݾ�,��� �Է���
	@RequestMapping("/agspay/AGS_pay.to")
	public ModelAndView AGS_pay(HttpSession session, memberData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		dto = (memberData) sqlMapper.queryForObject("myInfor", session.getAttribute("memId"));
		mv.addObject("top", "/top/top.jsp");
		mv.addObject("my", dto);
		mv.setViewName("/agspay/AGS_pay.jsp");
		return mv;
	}
	//���� Pro
	@RequestMapping("/agspay/AGS_pay_ing.to")
	public String AGS_pay_ing(HttpServletRequest request,payData pay){
		System.out.println("job1 : "+request.getParameter("Job"));
		
		return "/agspay/AGS_pay_ing.jsp";
	}
	//���� �Ϸ� Form
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
	    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss"); // �⺻ ����Ÿ���̽� ���� Ÿ��
	    Date d = gc.getTime(); // Date -> util ��Ű��
	    String str = sf.format(d);	//���ó�¥
	    
	    Calendar day = Calendar.getInstance();
	    day.add ( Calendar.DATE, -1 );
	    Date tomorrow = day.getTime ( );	
	    String str2 = sf.format(tomorrow);	//������¥
	    
	    int flag = Integer.parseInt(request.getParameter("flag"));
	//    todayPrice = (int) sqlMapper.queryForObject("TodayPrice", str);
	    List totoList = null;
	    List protoList = null;
	    List result_protoList = null;
	    List result_totoList = null;
	    
	    totoList = sqlMapper.queryForList("totoResult", null);	//�¹���
	    protoList = sqlMapper.queryForList("protoResult", null);//�ºν�
	    
	    if(flag == 1){	//�¹��� ����Ʈ
	    	result_protoList = sqlMapper.queryForList("result_protoList", null);//�¹��� ��� 5��
	    	mv.addObject("flag",flag);
	    	mv.addObject("result_protoList",result_protoList);
	    }
	    else if(flag == 2){
	    	result_totoList = sqlMapper.queryForList("result_totoList", null);//�ºν� ��� 5��
	    	mv.addObject("flag",flag);
	    	mv.addObject("result_totoList",result_totoList);	
	    }
	    
	  //������ �Ǹ� ���ϱ�
	    Calendar today = Calendar.getInstance ( );//���� ����
	    Calendar week_star = Calendar.getInstance ( );//������ ���� ����
	    Calendar week_end = Calendar.getInstance ( );//������ �� ����
	    Calendar week_star1 = Calendar.getInstance ( );//�̹��� ���� ����
	    Calendar week_end1 = Calendar.getInstance ( );//�̹��� �� ����
	    int day_of_week = today.get ( Calendar.DAY_OF_WEEK );;//���ϱ��ϱ�
	    //day_of_week => (1=�Ͽ���,2=������,3=ȭ����........)
	    
	    //�������� ��¥���ϱ�
	    if(day_of_week == 1){//today == �Ͽ���
	    	week_star.add ( Calendar.DATE, -13 );	//�������� �������� ����
	    	Date hanju = week_star.getTime ( );		
	    	String ju = sf.format(hanju);			
	    	
	    	week_end.add ( Calendar.DATE, -7 );		//�������� �Ͽ��� ����
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);	
	    	//�̹��� ��¥���ϱ�
	    	week_star1.add ( Calendar.DATE, -6 );	//�̹��� ������ ����
	    	Date hanju1 = week_star1.getTime ( );	
	    	String ju1 = sf.format(hanju1);			
	    	
	    	week_end1.add ( Calendar.DATE, 0 );		//�̹��� �Ͽ��� ����
	    	Date hanju_end1 = week_end1.getTime ( );
	    	String ju_end1 = sf.format(hanju_end1);	
	    	
	    	mv.addObject("ju", ju);
	    	mv.addObject("ju_end", ju_end);
	    	mv.addObject("ju1", ju1);
	    	mv.addObject("ju_end1", ju_end1);
	    }else if(day_of_week == 2){//today == ������
	    	week_star.add ( Calendar.DATE, -7 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);
	    	
	    	week_end.add ( Calendar.DATE, -1 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//�̹��� ��¥���ϱ�
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
	    }else if(day_of_week == 3){//today == ȭ����
	    	week_star.add ( Calendar.DATE, -8 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);		 
	    	
	    	week_end.add ( Calendar.DATE, -2 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//�̹��� ��¥���ϱ�
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
	    }else if(day_of_week == 4){//today == ������
	    	week_star.add ( Calendar.DATE, -9 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);		 
	    	
	    	week_end.add ( Calendar.DATE, -3 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//�̹��� ��¥���ϱ�
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
	    }else if(day_of_week == 5){//today == �����
	    	week_star.add ( Calendar.DATE, -10 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);		 
	    	
	    	week_end.add ( Calendar.DATE, -4 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//�̹��� ��¥���ϱ�
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
	    }else if(day_of_week == 6){//today == �ݿ���
	    	week_star.add ( Calendar.DATE, -11 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);		 
	    	
	    	week_end.add ( Calendar.DATE, -5 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//�̹��� ��¥���ϱ�
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
	    }else if(day_of_week == 7){//today == �����
	    	week_star.add ( Calendar.DATE, -12 );
	    	Date hanju = week_star.getTime ( );	
	    	String ju = sf.format(hanju);
	    	
	    	week_end.add ( Calendar.DATE, -6 );
	    	Date hanju_end = week_end.getTime ( );	
	    	String ju_end = sf.format(hanju_end);
	    	//�̹��� ��¥���ϱ�
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
