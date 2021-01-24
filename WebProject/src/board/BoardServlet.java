package kh.or.kh.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.eclipse.jdt.internal.compiler.env.IGenericField;


@WebServlet("*.bo")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDTO boardDTO;
	private BoardDAO boardDAO;
	
	private Connection conn;
	private int cnt;
	private ResultSet rs;
	private ArrayList<BoardDTO> boardList;
	private String updateTitle;
	private String searchTitle;
	public BoardServlet() {
		boardDTO = new BoardDTO();
		boardDAO = new BoardDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doPost(request, response);
	   }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String requestURI = request.getRequestURI(); // URI가 는 "/프로젝트명/*.do" 를 가르킨다 ex)/KHProject2/*.do
		String contextPath = request.getContextPath(); // contextPath는 = "/프로젝트명" 을 가르킨다 ex) /KHProject2
		String command = requestURI.substring(contextPath.length()); // 길이만큼 잘른게 command 가 된다 ex)/studentList.do

		if (command.equals("/boardRegister.bo")) { // 학생등록
			boardDTO.setTitle(request.getParameter("title"));
			boardDTO.setContent(request.getParameter("content"));
			boardDTO.setAuthor(request.getParameter("author"));
			boardDTO.setNal(request.getParameter("nal"));
			boardDTO.setReadcount(Integer.parseInt(request.getParameter("readcount")));
			try {
				//boardDAO.boardRegisterSql(boardDTO);
				//cnt=boardDAO.boardExecuter();
				cnt=boardDAO.boardRegister(boardDTO);
				out.print("<script>alert('1건이 등록되었습니다'); location.href='index.jsp?page=board/boardList';</script>");
				response.sendRedirect("boardList.bo"); // doPost의 인자로 있다 response
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		else if(command.equals("/boardList.bo")) {
	         try {
	        	 boardList = boardDAO.boardList();
	             RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=board/boardList");
	             request.setAttribute("boardList", boardList);
	             dis.forward(request, response);
	            //서블릿에서 많이쓰는데 이름과 속성을 묶어서 서버에 저장할때 많이 쓰인다. 어디에 저장을 해? requestd에다가!
				// Hashset과 거의 흡사
				// boardList배열에 담아서 보낼 수 있다. 이름을 꺼내면 값이 나오겠지?
			
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		
		else if(command.equals("/boardDelete.bo")){
			String no1 =request.getParameter("no");
			int no=Integer.parseInt(no1);
			try {
				cnt = boardDAO.boardDelete(no);
				response.sendRedirect("boardList.bo");
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
		else if (command.equals("/boardSearch.bo")) {
			String searchTitle = request.getParameter("title");
			String readcount=request.getParameter("readcount");
			try {
				boardDTO=boardDAO.boardSearch(searchTitle);
				RequestDispatcher dis=request.getRequestDispatcher("index.jsp?page=board/boardSearch");
				request.setAttribute("boardDTO", boardDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} // 학생검색
		else if (command.equals("/boardUpdate.bo")) {
			searchTitle =request.getParameter("searchTitle");
			try {
				boardDTO=boardDAO.boardSearch(searchTitle);
				RequestDispatcher dis=request.getRequestDispatcher("index.jsp?page=board/boardUpdateConfirm");
				request.setAttribute("boardDTO", boardDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/boardUpdateFinal.bo")) {
			//searchTitle =request.getParameter("searchTitle");
			
			boardDTO.setNo(Integer.parseInt(request.getParameter("no")));
			boardDTO.setTitle(request.getParameter("uptitle"));
			boardDTO.setContent(request.getParameter("upcontent"));
			boardDTO.setAuthor(request.getParameter("upauthor"));
			boardDTO.setNal(request.getParameter("upnal"));
			boardDTO.setReadcount(Integer.parseInt(request.getParameter("upreadcount")));
			
			try {
				boardDAO.boardUpdateFinal(searchTitle, boardDTO);
				boardList = boardDAO.boardList();
	             RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=board/boardList");
	             request.setAttribute("boardList", boardList);
	             dis.forward(request, response);
	             response.sendRedirect("boardList.bo");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
