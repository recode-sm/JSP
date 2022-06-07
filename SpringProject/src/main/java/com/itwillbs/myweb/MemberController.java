package com.itwillbs.myweb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
//	http://localhost:8080/myweb/member/insert
	
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		System.out.println("MemberController insert()");
//		/WEB-INF/views/member/insertForm.jsp
		// 주소 안바뀌면서 이동
//		RequestDispatcher dispatcher=request.getRequestDispatcher("home.jsp");
//		dispatcher.forward(request, response);
		return "member/insertForm";
	}
	
	// http://localhost:8080/myweb/member/insertPro
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro() {
		System.out.println("MemberController insertPro()");
		// 주소 변경하면서 이동
//		response.sendRedirect()
		return "redirect:/member/login";
	}
	
	//http://localhost:8080/myweb/member/login  =>  member/loginForm.jsp  GET방식
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("MemberController login()");
//		/WEB-INF/views/member/loginForm.jsp
		// 주소 안바뀌면서 이동
//		RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
//		dispatcher.forward(request, response);
		return "member/loginForm";
	}
	
	//  /member/loginPro POST => /member/main 가상주소 이동
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro() {
		System.out.println("MemberController loginPro()");
		return "redirect:/member/main";
	}
    //  /member/main     GET  => /member/main.jsp 이동
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		System.out.println("MemberController main()");
		return "member/main";
	}
	
//	/member/logout  GET  => 가상주소 /member/main
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout() {
		System.out.println("MemberController logout()");
		return "redirect:/member/main";
	}
//	/member/info    GET  => member/info.jsp
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info() {
		System.out.println("MemberController info()");
		return "member/info";
	}
	
//	/member/update  GET  => member/updateForm.jsp
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update() {
		System.out.println("MemberController update()");
		return "member/updateForm";
	}
//	/member/updatePro POST => 가상주소 /member/main
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro() {
		System.out.println("MemberController updatePro()");
		return "redirect:/member/main";
	}
	
//	/member/delete  GET  => member/deleteForm.jsp
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete() {
		System.out.println("MemberController delete()");
		return "member/deleteForm";
	}
//	/member/deletePro POST => 가상주소 /member/main
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro() {
		System.out.println("MemberController deletePro()");
		return "redirect:/member/main";
	}
	
//	/member/list    GET  => member/list.jsp
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list() {
		System.out.println("MemberController list()");
		return "member/list";
	}
	
}
