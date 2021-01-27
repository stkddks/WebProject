package haksa;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.sun.org.apache.xerces.internal.impl.dv.dtd.IDDatatypeValidator;
//import sun.jvm.hotspot.oops.ReturnTypeEntry;

@WebServlet("*.do")
public class HaksaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDTO studentDTO;
	private StudentDAO studentDAO;
	
	private ProfessorDTO professorDTO;
	private ProfessorDAO professorDAO;
	
	private ManagerDTO managerDTO;
	private ManagerDAO managerDAO;
	
	private Connection conn;
	private int cnt;
	private ResultSet rs;
	private String updateName;
	// private PreparedStatement pstmt;

	public HaksaServlet() {
		studentDTO = new StudentDTO();
		professorDTO = new ProfessorDTO();
	       managerDTO = new ManagerDTO();
		try {
			studentDAO = new StudentDAO();
	         professorDAO = new ProfessorDAO();
	         managerDAO = new ManagerDAO();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String requestURI = request.getRequestURI(); // URI가 는 "/프로젝트명/*.do" 를 가르킨다 ex)/KHProject2/*.do
		String contextPath = request.getContextPath(); // contextPath는 = "/프로젝트명" 을 가르킨다 ex) /KHProject2
		String command = requestURI.substring(contextPath.length()); // 길이만큼 잘른게 command 가 된다 ex)/studentList.do

		if (command.equals("/studentRegister.do")) { // 학생등록
			String age = request.getParameter("age");
			String name = request.getParameter("name");
			String hakbun = request.getParameter("hakbun");

			studentDTO.setAge(age);
			studentDTO.setName(name);
			studentDTO.setHakbun(hakbun);

			try {
				// conn = studentDAO.getConnection();
				studentDAO.studentRegisterSql(studentDTO);
				cnt = studentDAO.studentExecuter();
				out.print("<script>alert('1건이 등록되었습니다'); location.href='index.jsp?page=student/studentList';</script>");
				response.sendRedirect("student/studentList.jsp"); // doPost의 인자로 있다 response
				// out.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		} // 학생등록
		
		else if (command.equals("/studentList.do")) {
			response.sendRedirect("student/studentList.jsp");
		} // 학생전체출력
		
		else if (command.equals("/studentDelete.do")) {
			String deleteName = request.getParameter("name");
			try {
				studentDAO.studentDeleteSql(deleteName);
				out.print(cnt + "건 학생이 삭제되었습니다");
				response.sendRedirect("student/studentList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		} // 학생삭제

		else if (command.equals("/studentSearch.do")) {
			String searchName = request.getParameter("name");
			try {
				rs = studentDAO.studentSearchSql(searchName);
				out.print("학생검색결과");
		         out.print("<table border=1 cellspacing=0 cellpadding=0>");
		         out.print("<tr>");
		         out.print("<th>번호</th> <th>나이</th> <th>이름</th><th>학번</th>");
		         out.print("</tr>");
		         while(rs.next()) {
		            out.print("<tr>");
		             out.print("<td>"+rs.getInt("no")+"</td>");
		             out.print("<td>"+rs.getString("age")+"</td>");
		             out.print("<td>"+rs.getString("name")+"</td>");
		             out.print("<td>"+rs.getString("hakbun")+"</td>");
		             out.print("</tr>");
		         }
				// response.sendRedirect("student/studentSearch.jsp");
				// response.sendRedirect("student/studentList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} // 학생검색
		else if(command.contentEquals("/studentUpdate.do")) { //학생수정
	         updateName = request.getParameter("name");
	         try {
	            rs = studentDAO.studentSearchSql(updateName);
	            while(rs.next()) {
	               studentDTO.setNo(rs.getInt("no"));
	               studentDTO.setAge(rs.getString("age"));
	               studentDTO.setName(rs.getString("name"));
	               studentDTO.setHakbun(rs.getString("hakbun"));
	            }
	            response.sendRedirect("studentConfirm.do");
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
		}
	         else if(command.equals("/studentConfirm.do")) { 
	         out.print("<style>");
				out.print("ul{list-style-type: none;");
				out.print("</style>");
				out.print("번호: " + studentDTO.getNo() + "이름: " + studentDTO.getName()+"나이: " + studentDTO.getAge()
						+ "학번: " + studentDTO.getHakbun() + "<br>");
				out.print("<h1>최종수정 하기 전 내용입니다.</h1>");
				out.print("<form action=studentUpdateFinal.do method=get>");
				out.print("<input type=hidden name=updateName value=" + updateName + ">");
				out.print("<ul>");
				out.print("<li><label for=이름수정>이름수정</label>");
				out.print("<input type=text name = name>");
				out.print("</li>");
				out.print("<li><label for=나이수정>나이수정</label>");
				out.print("<input type=number name = age>");
				out.print("</li>");
				out.print("<li><label for=학번수정>학번수정</label>");
				out.print("<input type=number name = hakbun>");
				out.print("</li>");
				out.print("<li>");
				out.print("<input type=image src=images/update.png class=kh01>");
				out.print("</li>");
				out.print("</ul>");
				out.print("</form>");
	         
	      } 
		
		else if (command.equals("/studentUpdateFinal.do")) {
			String updateName = request.getParameter("updateName");
			studentDTO.setName(request.getParameter("name"));
			studentDTO.setAge(request.getParameter("age"));
			studentDTO.setHakbun(request.getParameter("hakbun"));
			try {
				cnt = studentDAO.studentUpdateSql(updateName, studentDTO);
				out.print(cnt + "건 학생이 수정되었습니다.");
				response.sendRedirect("student/studentList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		else if (command.equals("/professorRegister.do")) { // 교수등록
			String age = request.getParameter("age");
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");

			professorDTO.setAge(age);
			professorDTO.setName(name);
			professorDTO.setSubject(subject);

			try {
				// conn = studentDAO.getConnection();
				professorDAO.professorRegisterSql(professorDTO);
				cnt = professorDAO.professorExecuter();
				out.print("<script>alert('1건이 등록되었습니다'); location.href='index.jsp?page=professor/professorList';</script>");
				response.sendRedirect("professor/professorList.jsp"); // doPost의 인자로 있다 response
				// out.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		} // 교수등록
		
		else if (command.equals("/professorList.do")) {
			response.sendRedirect("professor/professorList.jsp");
		} // 교수전체출력
		
		else if (command.equals("/professorDelete.do")) {
			String deleteName = request.getParameter("name");
			try {
				professorDAO.professorDeleteSql(deleteName);
				out.print(cnt + "건 학생이 삭제되었습니다");
				response.sendRedirect("professor/professorList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		} // 교수삭제

		else if (command.equals("/professorSearch.do")) {
			String searchName = request.getParameter("name");
			try {
				rs = professorDAO.professorSearchSql(searchName);
				 out.print("교수검색결과");
		         out.print("<table border=1 cellspacing=0 cellpadding=0>");
		         out.print("<tr>");
		         out.print("<th>번호</th> <th>나이</th> <th>이름</th><th>과목</th>");
		         out.print("</tr>");
		         while(rs.next()) {
		            out.print("<tr>");
		             out.print("<td>"+rs.getInt("no")+"</td>");
		             out.print("<td>"+rs.getString("age")+"</td>");
		             out.print("<td>"+rs.getString("name")+"</td>");
		             out.print("<td>"+rs.getString("subject")+"</td>");
		             out.print("</tr>");
		         }    
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} // 교수검색
		else if(command.contentEquals("/professorUpdate.do")) { //교수수정
	         updateName = request.getParameter("name");
	         try {
	            rs = professorDAO.professorSearchSql(updateName);
	            while(rs.next()) {
	            	professorDTO.setNo(rs.getInt("no"));
	            	professorDTO.setAge(rs.getString("age"));
	            	professorDTO.setName(rs.getString("name"));
	            	professorDTO.setSubject(rs.getString("subject"));
	            }
	            response.sendRedirect("professorConfirm.do");
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
		}
		else if(command.equals("/professorConfirm.do")) { 
	         out.print("<style>");
				out.print("ul{list-style-type: none;");
				out.print("</style>");
				out.print("번호: " + professorDTO.getNo() + "이름: " + professorDTO.getName()+"나이: " + professorDTO.getAge()
						+ "과목: " + professorDTO.getSubject() + "<br>");
				out.print("<h1>최종수정 하기 전 내용입니다.</h1>");
				out.print("<form action=studentUpdateFinal.do method=get>");
				out.print("<input type=hidden name=updateName value=" + updateName + ">");
				out.print("<ul>");
				out.print("<li><label for=이름수정>이름수정</label>");
				out.print("<input type=text name = name>");
				out.print("</li>");
				out.print("<li><label for=나이수정>나이수정</label>");
				out.print("<input type=text name = age>");
				out.print("</li>");
				out.print("<li><label for=과목수정>과목수정</label>");
				out.print("<input type=text name = subject>");
				out.print("</li>");
				out.print("<li>");
				out.print("<input type=image src=images/update.png class=kh01>");
				out.print("</li>");
				out.print("</ul>");
				out.print("</form>");
	         
	      } 
		
		else if (command.equals("/professorUpdateFinal.do")) {
			String updateName = request.getParameter("updateName");
			professorDTO.setName(request.getParameter("name"));
			professorDTO.setAge(request.getParameter("age"));
			professorDTO.setSubject(request.getParameter("subject"));
			try {
				cnt = professorDAO.professorUpdateSql(updateName, professorDTO);
				out.print(cnt + "건 학생이 수정되었습니다.");
				response.sendRedirect("professor/professorList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		else if (command.equals("/managerRegister.do")) { // 매니저등록
			String age = request.getParameter("age");
			String name = request.getParameter("name");
			String dept = request.getParameter("dept");

			managerDTO.setAge(age);
			managerDTO.setName(name);
			managerDTO.setDept(dept);

			try {
				managerDAO.managerRegisterSql(managerDTO);
				cnt = managerDAO.managerExecuter();
				out.print("<script>alert('1건이 등록되었습니다'); location.href='index.jsp?page=manager/managerList';</script>");
				response.sendRedirect("manager/managerList.jsp"); // doPost의 인자로 있다 response
				// out.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		} // 매니저등록
		
		else if (command.equals("/managerList.do")) {
			response.sendRedirect("manager/managerList.jsp");
		} // 매니저전체출력
		
		else if (command.equals("/managerDelete.do")) {
			String deleteName = request.getParameter("name");
			try {
				managerDAO.managerDeleteSql(deleteName);
				out.print(cnt + "건 학생이 삭제되었습니다");
				response.sendRedirect("manager/managerList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		} // 매니저삭제

		else if (command.equals("/managerSearch.do")) {
			String searchName = request.getParameter("name");
			try {
				rs = managerDAO.managerSearchSql(searchName);
				out.print("매니저검색결과");
		         out.print("<table border=1 cellspacing=0 cellpadding=0>");
		         out.print("<tr>");
		         out.print("<th>번호</th> <th>나이</th> <th>이름</th><th>부서</th>");
		         out.print("</tr>");
		         while(rs.next()) {
		            out.print("<tr>");
		             out.print("<td>"+rs.getInt("no")+"</td>");
		             out.print("<td>"+rs.getString("age")+"</td>");
		             out.print("<td>"+rs.getString("name")+"</td>");
		             out.print("<td>"+rs.getString("dept")+"</td>");
		             out.print("</tr>");
		         }
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} // 매니저검색
		else if(command.contentEquals("/managerUpdate.do")) { //학생수정
	         updateName = request.getParameter("name");
	         try {
	            rs = managerDAO.managerSearchSql(updateName);
	            while(rs.next()) {
	            	managerDTO.setNo(rs.getInt("no"));
	               managerDTO.setAge(rs.getString("age"));
	               managerDTO.setName(rs.getString("name"));
	               managerDTO.setDept(rs.getString("dept"));
	            }
	            response.sendRedirect("managerConfirm.do");
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
		}
		else if(command.equals("/managerConfirm.do")) { 
	         out.print("<style>");
				out.print("ul{list-style-type: none;");
				out.print("</style>");
				out.print("번호: " + managerDTO.getNo() + "이름: " + managerDTO.getName()+"나이: " + managerDTO.getAge()
						+ "부서: " + managerDTO.getDept() + "<br>");
				out.print("<h1>최종수정 하기 전 내용입니다.</h1>");
				out.print("<form action=studentUpdateFinal.do method=get>");
				out.print("<input type=hidden name=updateName value=" + updateName + ">");
				out.print("<ul>");
				out.print("<li><label for=이름수정>이름수정</label>");
				out.print("<input type=text name = name>");
				out.print("</li>");
				out.print("<li><label for=나이수정>나이수정</label>");
				out.print("<input type=text name = age>");
				out.print("</li>");
				out.print("<li><label for=부서수정>부서수정</label>");
				out.print("<input type=text name = dept>");
				out.print("</li>");
				out.print("<li>");
				out.print("<input type=image src=images/update.png class=kh01>");
				out.print("</li>");
				out.print("</ul>");
				out.print("</form>");
	         
	      } 
		
		else if (command.equals("/managerUpdateFinal.do")) {
			String updateName = request.getParameter("updateName");
			managerDTO.setName(request.getParameter("name"));
			managerDTO.setAge(request.getParameter("age"));
			managerDTO.setDept(request.getParameter("dept"));
			try {
				cnt = managerDAO.managerUpdateSql(updateName, managerDTO);
				out.print(cnt + "건 학생이 수정되었습니다.");
				response.sendRedirect("manager/managerList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}
}
