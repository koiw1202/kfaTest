package com.model2.mvc.web.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model2.mvc.common.Page;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

@Controller
public class UserController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	private int pageUnit ;			// 하단 페이지 번호 화면에 보여지는 수
	@Value("#{commonProperties['pageSize']}")
	private int pageSize;			// 한 페이지당 보여지는 게시물수
	
	String gitTest ;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "/login.do", method=RequestMethod.POST)
	public String getUser(@ModelAttribute("user") User user, HttpSession httpSession, HttpServletRequest request, Model model ) throws Exception {
		
		if( ((User)httpSession.getAttribute("user")) != null ) {
			return "forward:/main/main.jsp";
		}
		
		User dbUser = userService.getUser( user.getUserId()) ;
		
		//비밀번호가 일치할 경우
		if( dbUser.getPassword().equals(user.getPassword())) {
		
			httpSession.setAttribute("user", dbUser);
			httpSession.setMaxInactiveInterval( 3000 ) ;
			model.addAttribute("user", dbUser) ;
			System.out.println("DB에서 가져온 user 정보 출력") ;
			System.out.println( dbUser.toString() );
		
		} else {
			return "redirect:/index.jsp";
		}
		
		return "forward:/main/main.jsp";
	}
	
	@RequestMapping(value="addUser.do", method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user, HttpSession session ) {
		System.out.println("addUser 실행");
		System.out.println(user);
		
		if( ((User)session.getAttribute("user")).getRole().equals("admin")) {
			userService.addUser(user) ;
			
			return "redirect:/main/main.jsp" ;
			
		}
		
		return "redirect:/common/error" ;
		
	}
	
	@ResponseBody
	@RequestMapping(value="checkDuplicate.do", method=RequestMethod.GET)
	public String checkDuplicate(@RequestParam(value = "userId", required=true) String userId) {
			
		System.out.println("checkDuplicate.do");
		System.out.println("userId : " + userId);
		
		String result = userService.checkDuplicate(userId);
		
		System.out.println("결과값  : " +  result );
		
		return result ;
		
	}
	
	@RequestMapping(value="logOut.do", method=RequestMethod.GET) 
	public String logOut(HttpSession httpSession) {
		System.out.println("logOut 실행");
		
		httpSession.removeAttribute("user");
		
		return "redirect:/index.jsp" ;
		
	}
	
	@RequestMapping(value="main.do", method=RequestMethod.GET)
	public String main(HttpSession httpSession) {
		System.out.println("main 실행");
		
		if(((User)httpSession.getAttribute("user")).getUserId() == null) {
			System.out.println("userId가 null값 로그인 화면으로 이동");
			return "redirect:/login.jsp" ;
		}
		
		System.out.println("로그인한 상태이므로 메인화면으로 이동");
		return "redirect:/main/main.jsp" ;
		
	}
		
	@RequestMapping(value="getUserList.do", method=RequestMethod.GET)
	public String getUserList(@RequestParam(value="currentPage") int currentPage,  HttpSession session, Model model) {
		System.out.println("getUserList.do 실행");
		
		if( !((User)session.getAttribute("user")).getRole().equals("admin") ) {
			return "redirect:/main/main.jsp" ;
		}
		
		Page page = new Page(currentPage, pageSize, pageUnit) ;
		
		List<User> list = userService.getUserList(page) ;
		model.addAttribute("userList", list) ;
		
		if( page.getCurrentPage() > list.get(0).getMaxPage()) {
			System.out.println("Requst한 page가 전체 페이지 게시물 수 보다 큼");
			return "redirect:/main/main.jsp" ;
		}
		
		page.setCurrentPage(currentPage) ;
		
		if( page.getCurrentPage() % 5 == 0 ) {
			page.setBeginUnitPage( (currentPage / page.getPageUnit()) + (currentPage / page.getPageUnit() - 1) * 4 );			
		} else {
			page.setBeginUnitPage( currentPage / page.getPageUnit() * page.getPageUnit() + 1  ) ;
		}
		
		page.setEndUnitPage( page.getBeginUnitPage() + page.getPageUnit() - 1 ); 
		page.setMaxPage(list.get(0).getMaxPage());
		
		if( page.getMaxPage() < page.getEndUnitPage()) {
			page.setEndUnitPage(list.get(0).getMaxPage()) ;
		}
		
		System.out.println("Page : " + page.toString());
		
		model.addAttribute("resultPage", page) ;
		return "forward:/user/userList.jsp" ;
		
	}
	
	@RequestMapping(value="getUser.do", method=RequestMethod.GET)
	public String getUser(@RequestParam(value="userId") String userId, Model model, HttpSession session) throws Exception {
		
		System.out.println("getUSer.do");
		System.out.println("userId : " + userId);
		
		if( !((User)session.getAttribute("user")).getRole().equals("admin") ) {
			System.out.println("admin 계정이 아닙니다.");
			return "redirect:/main/main.jsp" ;
		}
		
		model.addAttribute("user", userService.getUser(userId)) ;
		System.out.println("DB에서 가져온 user정보 : ");
		System.out.println( userService.getUser(userId));
		
		return "forward:/user/getUser.jsp";
		
	}
	
	@RequestMapping(value="updateUserView.do", method=RequestMethod.GET)
	public String updateUserView(@RequestParam(value="userId") String userId, Model model, HttpSession session) {
		
		System.out.println("updateUserView.do 실행");
		
		if( !((User) session.getAttribute("user")).getRole().equals("admin") ) {
		
			return "redirect:/main/main.jsp" ;
		}
		
		return "redirect:/user/updateUserView.jsp" ;
	}
	
	
	@RequestMapping(value="updateUser.do", method=RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, HttpSession session) {
		System.out.println("updateUser.do 실행");
		System.out.println("가져온 user 정보" + user);
			
		if( !((User) session.getAttribute("user")).getRole().equals("admin") ) {
			
			return "redirect:/main/main.jsp" ;
		}
		
		if( user.getRole().equals("0") ) {
			
			user.setRole("admin");
			
		} else if( user.getRole().equals("1") ) {
			
			user.setRole("manager");
			
		} else if( user.getRole().equals("2") ) {
			
			user.setRole("user");
		}
		
		int result = userService.updateUser(user) ;
		
		if( result == 1 ) {
			System.out.println("update 성공");
		} else if ( result == 0 ) {
			System.out.println("update 실패");
		}
		
		return "forward:/user/updateUserView.jsp" ;
	}

	@RequestMapping(value="deleteUser.do", method=RequestMethod.GET)
	public int deleteUser( @RequestParam(value="userId") String userId ,HttpSession session ) {
		
		System.out.println( ((User)session.getAttribute("user")).toString() );
		System.out.println("deleteUser 실행");
		System.out.println(!((User)session.getAttribute("user")).getRole().equals("admin"));
		
		if( !((User)session.getAttribute("user")).getRole().equals("admin")) {
		
			System.out.println("admin 계정이 아닙니다.");
			return 200 ;
		
		}
		
		System.out.println("userId : " + userId);
		
		return userService.deleteUser( userId ) ;
		
	}
	
} //End of Class











