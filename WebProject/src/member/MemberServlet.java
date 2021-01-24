package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.mb")
public class MemberServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private MemberDTO memberDTO;
   private MemberDAO memberDAO;
   private ArrayList<MemberDTO> memberList;
   private int cnt;
   private HttpSession session;
   private String searchId;
   
   public MemberServlet() {
      memberDTO = new MemberDTO();
      memberDAO = new MemberDAO();
   }
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
	   request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      
      String requestURI = request.getRequestURI();
      String contextPath = request.getContextPath();
      String command = requestURI.substring(contextPath.length());
     
     // session.setMaxInactiveInterval(1*60); // 초 단위
      
      if(command.equals("/memberRegister.mb")){ //회원 가입
         memberDTO.setId(request.getParameter("id"));
         memberDTO.setPw(request.getParameter("pw"));
         memberDTO.setAddr(request.getParameter("addr"));
         memberDTO.setTel(request.getParameter("tel"));
         try {
            cnt = memberDAO.memberRegister(memberDTO);
            response.sendRedirect("memberList.mb");
         } catch (SQLException e) {
            e.printStackTrace();
         };
      }//회원 가입
      
      else if(command.equals("/memberList.mb")) { //회원 목록
         try {
            memberList = memberDAO.memberList();
            RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=members/memberList");
            request.setAttribute("memberList",memberList);
            dis.forward(request, response);
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      
      
      else if(command.equals("/memberLogin.mb")) { //로그인
    	 // session.setMaxInactiveInterval(1*60); // 초 단위
    	 String userId = request.getParameter("id");
         String userPw = request.getParameter("pw");
         try {
            memberDTO = memberDAO.memberLogin(userId, userPw);
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
         String dbid = memberDTO.getId();
         String dbpw = memberDTO.getPw();
         
         if (!(userId.equals(dbid))) { // 아이디 틀렸을 때
				out.print("<script> alert('없는 아이디입니다. 회원이 아니시면 회원가입부터 해주세요.'); history.back(); </script>");
			} else if (userId.equals(dbid) && !(userPw.equals(dbpw))) { // 비밀번호 틀렸을 때
				out.print("<script> alert('잘못된 비밀번호입니다.다시 확인해주세요.'); history.back(); </script>");
				
			} else if (userId.equals(dbid) && userPw.equals(dbpw)) {
				out.print("환영합니다" + userId + "님!! 로그인되었습니다");
				session=request.getSession();
				session.setAttribute("id", userId);
				response.sendRedirect("index.jsp");
			}
		} 
      
      else if(command.equals("/memberLogout.mb")) { //로그아웃
          session.invalidate();
          out.print("<script>alert('로그아웃 되었습니다.'); location.href='index.jsp?page=center';</script>"); 
       } //로그아웃
      

      else if(command.equals("/memberBye.mb")) { //회원 탈퇴
    	  String deleteId = (String)session.getAttribute("id");
         try {
            cnt = memberDAO.memberBye(deleteId);
            session.invalidate();
            out.print("<script>alert('회원탈퇴 되었습니다.'); location.href='index.jsp';</script>");
           // response.sendRedirect("index.jsp");
            //response.sendRedirect("memberLogout.mb");
            //RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=members/memberList");
            //dis.forward(request,response);
                  
         } catch (SQLException e) {
            e.printStackTrace();
         }   
      } //회원 탈퇴
      
      else if(command.equals("/memberDelete.mb")){
    	  	String deleteId = (String)session.getAttribute("id");
			//int no=Integer.parseInt(no1);
			try {
				cnt = memberDAO.memberBye(deleteId);
				response.sendRedirect("memberList.mb");
//				RequestDispatcher dis=request.getRequestDispatcher("index.jsp?page=members/memberList");
//				request.setAttribute("memberDTO", memberDTO);
//				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
      else if (command.equals("/memberIdSearch.mb")) {
			//String searchId = request.getParameter("id");
			String searchAddr = request.getParameter("addr");
			String searchTel = request.getParameter("tel");
			try {
				memberDTO=memberDAO.memberIdSearch(searchAddr, searchTel);
				RequestDispatcher dis=request.getRequestDispatcher("index.jsp?page=members/memberIdSearch");
				request.setAttribute("memberDTO", memberDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
      else if (command.equals("/memberSearch.mb")) {
    	  	String searchId = request.getParameter("id");
			//String readcount=request.getParameter("readcount");
			try {
				memberDTO=memberDAO.memberSearch(searchId);
				RequestDispatcher dis=request.getRequestDispatcher("index.jsp?page=members/memberSearch");
				request.setAttribute("memberDTO", memberDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} // 학생검색
      
      else if (command.equals("/memberUpdate.mb")) {
    	  	searchId =request.getParameter("id");
			try {
				memberDTO=memberDAO.memberSearch(searchId);
				RequestDispatcher dis=request.getRequestDispatcher("index.jsp?page=members/memberUpdateConfirm");
				request.setAttribute("memberDTO", memberDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/memberUpdateFinal.mb")) {
			 searchId =request.getParameter("searchId");
			
			 memberDTO.setId(request.getParameter("id"));
	         memberDTO.setPw(request.getParameter("pw"));
	         memberDTO.setAddr(request.getParameter("addr"));
	         memberDTO.setTel(request.getParameter("tel"));
			
			try {
				memberDAO.memberUpdateFinal(searchId, memberDTO);
				memberList = memberDAO.memberList();
	             RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=members/memberList");
	             request.setAttribute("memberList", memberList);
	             dis.forward(request, response);
	             //response.sendRedirect("memberList.mb");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
      
      
   }

}