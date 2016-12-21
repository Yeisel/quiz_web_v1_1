package prjbean;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import prjdata.QuizProductDTO;
import prjdata.QuizUserDTO;

public class MainProc extends HttpServlet {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	HttpSession session = null;
	RequestDispatcher dispatcher = null;
	
	// 로그인 프로세스 (index.jsp)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	// 로그인 프로세스 (index.jsp)
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = (String)req.getParameter("user_Id");
		String userPw = (String)req.getParameter("user_Pw");
		String guest = "guest";
		
		session = req.getSession();
		
		QuizUserDTO dto = new QuizUserDTO();
		
		String sql = "select * from user where user_Id='" + userId + "'";
		
		try{
			con = ds.getConnection();
		
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("여기는 rs 넥스트");
				
				dto.setUser_Id(rs.getString("user_Id"));
				dto.setUser_Password(rs.getString("user_Password"));
				dto.setUser_Current_Point(rs.getInt("user_Current_Point"));
		
				req.setAttribute("dto", dto);
			}
		
		dispatcher = req.getRequestDispatcher("index.jsp");
		
		if(session.getAttribute("logged") == null){			
			System.out.println("여기는 세션 널 : " + session.getAttribute("logged"));
			
			if(req.getParameter("user_Id") == "" && req.getParameter("user_Pw") == ""){				
				System.out.println("여기는 id pw 공백 : " + req.getParameter("user_Id") + ", " + req.getParameter("user_Pw"));
				dispatcher.forward(req, resp);
			}
			else if(req.getParameter("user_Id") != null && req.getParameter("user_Pw") != null){				
				System.out.println("여기는 id pw 낫널 : " + req.getParameter("user_Id") + ", " + req.getParameter("user_Pw"));				
				System.out.println("userId , userPw : " + userId + ", " + userPw);				
				
				if(rs.getString("user_Id").equals(userId) && rs.getString("user_Password").equals(userPw)){
					System.out.println("여기는 로긴 성공");
					session.setAttribute("logged", userId);
					dispatcher.forward(req, resp);
				}
				
				else if(guest.equals(req.getParameter("logout"))){
					System.out.println("여기는 로그아웃");
					session.invalidate();
					dispatcher.forward(req, resp);
				}
				else{
					System.out.println("여기는 비회원");
					session.invalidate();
					dispatcher.forward(req, resp);
				}
			}
			else{
				System.out.println("여기는 id pw 공백의 else");
				
				dispatcher.forward(req, resp);		
			}
		}
		else if(session.getAttribute("logged") != null){
			System.out.println(userId + ", " + session.getAttribute("logged"));
			
			if(guest.equals(req.getParameter("logout"))){
				System.out.println("여기는 세션 낫널의 guest.equals = " + req.getParameter("logout"));
				session.invalidate();
				dispatcher.forward(req, resp);
			}
			else if(userId.equals(session.getAttribute("logged"))){
				System.out.println("여기는 userId.equals(logged) = " + session.getAttribute("logged"));
				dispatcher.forward(req, resp);
			}
			else{
				System.out.println("여기는 guest.equals의 else = " + req.getParameter("logout"));
				dispatcher.forward(req, resp);
			}
		}
		else{
			
		}
		
		} // try 닫음
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(rs != null){try{rs.close();}catch(Exception err){}}
			if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
			if(con != null){try{con.close();}catch(Exception err){}}
		}
	}

	// 석준 DB 로그인
	public MainProc(){
		try{
			Context ctx = new InitialContext();
			
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			
			con = ds.getConnection();
		}
		catch(Exception err){
			System.out.println("DB 연결 실패" + err);
		}
		finally{
			
		}
	}
	
	// 테스트(변경해도 됨)
	public void selectUser(String user_Name){
		
		try {
			con = ds.getConnection();
			
			String sql = "select * from user where user_id = ?";
			pstmt = con.prepareStatement(sql);  
			pstmt.setString(1, user_Name);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println(rs.getString("user_id"));
				System.out.println(rs.getString("user_email"));
				System.out.println(rs.getString("user_password"));
				System.out.println(rs.getString("user_name"));
				System.out.println(rs.getString("user_address"));
				System.out.println(rs.getString("user_phone_number"));
				System.out.println(rs.getString("user_total_point"));
				System.out.println(rs.getString("user_current_point"));
				System.out.println(rs.getString("user_month_point"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			freeConnection();
		}
	}
	
	// 테스트(변경해도 됨)
	public void selectProduct(String product_Name){
		try {
			con = ds.getConnection();
			
			String sql = "select * from user where user_id like ? order by desc"; 
			pstmt = con.prepareStatement(sql);  
			pstmt.setString(1, "'%" + product_Name + "%'");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println(rs.getString("product_number"));
				System.out.println(rs.getString("product_name"));
				System.out.println(rs.getString("product_price"));
				System.out.println(rs.getString("product_image"));
				System.out.println(rs.getString("product_stock"));
				System.out.println(rs.getString("product_company"));
				System.out.println(rs.getString("product_contents"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 신규가입(mypage/join_new.jsp)
	public void inputNewUser(QuizUserDTO dto){
		System.out.println("inputNewUser(QuizUserDTO dto) : ");
		
		try{
			con = ds.getConnection();
			
			String sql = "INSERT INTO user (user_id, user_email, user_password, user_name, user_address, user_phone_number, user_total_point, user_current_point, user_month_point) VALUES (?, ?, ?, ?, ?, ?, 0, 0, 0)"; 
			
			pstmt = con.prepareStatement(sql);  
			
			pstmt.setString(1, dto.getUser_Id());
			pstmt.setString(2, dto.getUser_Email());
			pstmt.setString(3, dto.getUser_Password());
			pstmt.setString(4, dto.getUser_Name());
			pstmt.setString(5, dto.getUser_Address());
			pstmt.setString(6, dto.getUser_Phone_Number());
			
			pstmt.executeUpdate();
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			freeConnection();
		}
	}
	
	// shop 메인 상품목록 불러오기
		public ArrayList getProductList(){
			
			ArrayList list = new ArrayList();
			String sql = null;
			sql = "select * from product";
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					QuizProductDTO dto = new QuizProductDTO();
					
					dto.setProduct_Number(rs.getInt("product_Number"));
					dto.setProduct_Name(rs.getString("product_Name"));
					dto.setProduct_Price(rs.getInt("product_Price"));
					dto.setProduct_Image(rs.getString("product_Image"));
					dto.setProduct_Stock(rs.getInt("product_Stock"));
					dto.setProduct_Company(rs.getString("product_Company"));
					dto.setProduct_Contents(rs.getString("product_Contents"));

					list.add(dto);
				}
				
			} catch (SQLException err) {
				System.out.println("getBoardList() : " + err);
			}
			finally{
				freeConnection();
			}
			return list;			
		}
	
	// 인스턴스 클로즈 메서드
	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
}
