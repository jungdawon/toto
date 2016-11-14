package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class memberController {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	//ȸ������
	@RequestMapping("/member/inputForm.to")
	public String inputForm(HttpServletRequest request) throws Exception{
		request.setAttribute("top", "/top/top.jsp");
		
		return "/member/inputForm.jsp";
	}
	//ȸ�� ���� Pro
	@RequestMapping("/member/inputPro.to")
	public String inputPro(memberData dto,HttpServletRequest request) throws Exception{
		request.setAttribute("top", "/top/top.jsp");
		
		sqlMapper.insert("insertM", dto);
		return "/member/inputPro.jsp";
	}
	//�α��� ��
	@RequestMapping("/member/loginForm.to")  
	public String loginForm(HttpServletRequest request) {
		request.setAttribute("top", "/top/top.jsp");
		
		return "/member/loginForm.jsp";
	}
	//�α��� ó��
	@RequestMapping ("/member/loginPro.to")
	public ModelAndView loginPro(HttpSession session, memberData dto,HttpServletRequest request) throws Exception{
		request.setAttribute("top", "/top/top.jsp");
		
		String dbpw = (String) sqlMapper.queryForObject("userCheck", dto.getId());
		int userCheck = -1;
		ModelAndView mv = new ModelAndView();
		String pw = dto.getPw();

		if (pw.equals(dbpw)){
			userCheck = 1; // �α��μ���
			session.setAttribute("memId", dto.getId());
		} else { userCheck = 0; } //��й�ȣ Ʋ��
		
		int idCheck = (int) sqlMapper.queryForObject("idCheck", dto.getId());
		
		mv.addObject("userCheck", userCheck);
		mv.addObject("idCheck", idCheck);
		mv.setViewName("/member/loginPro.jsp");
		return mv;	
	}
	//���̵��ߺ�Ȯ��
	@RequestMapping ("/member/confirmId.to")
	public String confirmId(String id, HttpServletRequest request) throws Exception{
		int check = (int) sqlMapper.queryForObject("idCheck", id);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		return "/member/confirmId.jsp";
	}
	//ȸ������
	@RequestMapping("/member/myInfor.to")  
	public ModelAndView myInfor(HttpSession session, memberData dto,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		dto = (memberData) sqlMapper.queryForObject("myInfor", session.getAttribute("memId"));
		mv.addObject("top", "/top/top.jsp");
		mv.addObject("my", dto);
		mv.setViewName("/member/myInfor.jsp");
		return mv;
	}
	//ȸ����������
	@RequestMapping("/member/myInforForm.to")
	public ModelAndView myInforForm(HttpSession session, memberData dto) throws Exception{
		ModelAndView mv = new ModelAndView();
		dto = (memberData) sqlMapper.queryForObject("myInfor", session.getAttribute("memId"));
		mv.addObject("top", "/top/top.jsp");
		mv.addObject("my", dto);
		mv.setViewName("/member/myInforForm.jsp");
		return mv;
	}
	@RequestMapping("/member/myInforPro.to")
	public String myInforPro(String id, memberData dto,HttpServletRequest request) throws Exception{
		request.setAttribute("top", "/top/top.jsp");
		dto.setId(id);
		sqlMapper.update("myInforPro", dto);
		return "/member/myInforPro.jsp";
	}
	//ȸ����������
	@RequestMapping("/member/deleteForm.to")
	public String deleteForm(HttpServletRequest request) throws Exception{
		request.setAttribute("top", "/top/top.jsp");
		return "/member/deleteForm.jsp";
	}
	@RequestMapping("/member/deletePro.to")
	public String deletePro(HttpSession session, String pw, HttpServletRequest request) throws Exception{
		String id = (String) session.getAttribute("memId");
		String dbpw = (String) sqlMapper.queryForObject("userCheck", id);
		int userCheck = -1;
		
		if (pw.equals(dbpw)){
			userCheck = 1; //Ż�𼺰�
			sqlMapper.delete("deleteM", id);
			session.invalidate(); //���ǻ���
		} else { userCheck = 0; } //��й�ȣ Ʋ��
		
		request.setAttribute("userCheck", userCheck);
		
		return "/member/deletePro.jsp";
	}
	//���̵�&��й�ȣã��
	@RequestMapping("/member/findForm.to")
	public String findForm(HttpServletRequest request) throws Exception{
		request.setAttribute("top", "/top/top.jsp");
		
		return "/member/findForm.jsp";
	}
	@RequestMapping("/member/findIdPro.to")
	public String findIdPro(memberData dto, HttpServletRequest request) throws Exception{
		int check = (int) sqlMapper.queryForObject("findIdCheck", dto);
		if (check == 1){
			dto = (memberData) sqlMapper.queryForObject("findId", dto);
			request.setAttribute("id", dto.getId());
			request.setAttribute("date", dto.getReg_date());
			request.setAttribute("check", check);
		} else {
			check = 0;
			request.setAttribute("check", check);}
		return "/member/findIdPro.jsp";
	}
	@RequestMapping("/member/findPwPro.to")
	public String findPwPro(memberData dto, HttpServletRequest request) throws Exception{
		int check = (int) sqlMapper.queryForObject("findPwCheck", dto);
		if (check == 1){
			String pw = (String) sqlMapper.queryForObject("findPw", dto);
			request.setAttribute("pw", pw);
			request.setAttribute("check", check);
		} else {
			check = 0;
			request.setAttribute("check", check);}
		return "/member/findPwPro.jsp";
	}
	//�α׾ƿ�
	@RequestMapping("/member/logout.to")
	public String findForm(HttpSession session) throws Exception{
		session.invalidate();
		
		return "/top/main.to?local=Notice";
	}
	//��â�α���
	//�α��� ��
		@RequestMapping("/member/login2.to")  
		public String login2() {	
			return "/member/login2.jsp";
		}
	//�α��� ó��
	@RequestMapping ("/member/login2Pro.to")
	public ModelAndView login2Pro(HttpSession session, memberData dto) throws Exception {
		String dbpw = (String) sqlMapper.queryForObject("userCheck", dto.getId());
		int userCheck = -1;
		ModelAndView mv = new ModelAndView();
		String pw = dto.getPw();

		if (pw.equals(dbpw)){
			userCheck = 1; // �α��μ���
			session.setAttribute("memId", dto.getId());
		} else { userCheck = 0; } //��й�ȣ Ʋ��
		
		int idCheck = (int) sqlMapper.queryForObject("idCheck", dto.getId());
		
		mv.addObject("userCheck", userCheck);
		mv.addObject("idCheck", idCheck);
		mv.setViewName("/member/login2Pro.jsp");
		return mv;	
	}
	//��� ��û ������
	@RequestMapping("/member/payCancel.to")
	public ModelAndView payCancel(memberData mdto,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		
		mdto = (memberData) sqlMapper.queryForObject("myInfor",session.getAttribute("memId"));
		
		mv.addObject("mdto",mdto);
		mv.setViewName("/member/payCancel.jsp");
		return mv;
	}
	//��� ��û ó��������
		@RequestMapping("/member/payCancelPro.to")
		public ModelAndView payCancelPro(cancelData cDTO) throws Exception{
			ModelAndView mv = new ModelAndView(); 
			
			sqlMapper.insert("CancelInsert", cDTO);
			sqlMapper.update("CancelUpdate", cDTO);
			
			mv.setViewName("/member/payCancelPro.jsp");
			return mv;
		}
}