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

import prjdata.QuizAdminDTO;
import prjdata.QuizBuyDTO;
import prjdata.QuizCartDTO;
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
		
		String userId = (String)req.getParameter("user_Id");            // index.jsp text name="user_Id"
		String prepareId = null;										// 관리자인지 구별을 위한 변수
		String userPw = (String)req.getParameter("user_Pw");            // index.jsp의 text name="user_Pw"
		String guest = "guest";											// logout 구별을 위한 변수
		String sql = null;												// sql query용 변수
		
		System.out.println("doPost userId : " + userId);
		
		if(userId != null){
			System.out.println("여기는 if(userId != null)");
			if(userId.length() > 4){
				System.out.println("if(userId.length() > 4)");
				prepareId = userId.substring(0, 5);
			}
			else{
				prepareId = "minda";
			}
		}
		else{
			prepareId = "minda";
		}
		
		session = req.getSession();
		
		try{
			con = ds.getConnection();
		
			System.out.println("prepareId : " + prepareId);
			
			if(prepareId.equals("minda")){
				System.out.println("여기는 prepareId minda");
			}
			else if(prepareId.equals("admin")){
				sql = "select * from admin where admin_Id='" + userId + "'";
				
				QuizAdminDTO dto = new QuizAdminDTO();
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("여기는 admin rs 넥스트");
					
					dto.setAdmin_Id(rs.getString("admin_Id"));
					dto.setAdmin_Password(rs.getString("admin_Password"));
			
					req.setAttribute("dto", dto);
					
					session.setAttribute("admin", userId);
				}
			}
			else{
				sql = "select * from user where user_Id='" + userId + "'";
				
				QuizUserDTO dto = new QuizUserDTO();
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("여기는 user rs 넥스트");
					
					dto.setUser_Id(rs.getString("user_Id"));
					dto.setUser_Password(rs.getString("user_Password"));
					dto.setUser_Current_Point(rs.getInt("user_Current_Point"));
			
					req.setAttribute("dto", dto);
					
					session.setAttribute("admin", "User");
				}
			}
			
		
		dispatcher = req.getRequestDispatcher("index.jsp");
		
		if(session.getAttribute("logged") == null){			
			System.out.println("����� ���� �� : " + session.getAttribute("logged"));
			
			if(req.getParameter("user_Id") == "" && req.getParameter("user_Pw") == ""){				
				System.out.println("����� id pw ���� : " + req.getParameter("user_Id") + ", " + req.getParameter("user_Pw"));
				dispatcher.forward(req, resp);
			}
			else if(req.getParameter("user_Id") != null && req.getParameter("user_Pw") != null){				
				System.out.println("����� id pw ���� : " + req.getParameter("user_Id") + ", " + req.getParameter("user_Pw"));				
				System.out.println("userId , userPw : " + userId + ", " + userPw);				
				
				if(session.getAttribute("admin").equals(userId)){
					if(rs.getString("admin_Id").equals(userId) && rs.getString("admin_Password").equals(userPw)){
						System.out.println("����� admin �α� ����");
						session.setAttribute("admin", userId);
						session.setAttribute("logged", userId);
						dispatcher.forward(req, resp);
					}
					else if(guest.equals(req.getParameter("logout"))){
						System.out.println("����� admin �α׾ƿ�");
						session.invalidate();
						dispatcher.forward(req, resp);
					}
					else{
						System.out.println("����� admin ��ȸ��");
						session.invalidate();
						dispatcher.forward(req, resp);
					}
				}
				else{
					if(rs.getString("user_Id").equals(userId) && rs.getString("user_Password").equals(userPw)){
						System.out.println("����� user �α� ����");
						session.setAttribute("logged", userId);
						dispatcher.forward(req, resp);
					}				
					else if(guest.equals(req.getParameter("logout"))){
						System.out.println("����� user �α׾ƿ�");
						session.invalidate();
						dispatcher.forward(req, resp);
					}
					else{
						System.out.println("����� user ��ȸ��");
						session.invalidate();
						dispatcher.forward(req, resp);
					}
				}
			}
			else{
				System.out.println("����� id pw ������ else");
				
				dispatcher.forward(req, resp);		
			}
		}
		else if(session.getAttribute("logged") != null){
			System.out.println(userId + ", " + session.getAttribute("logged"));
			
			if(guest.equals(req.getParameter("logout"))){
				System.out.println("����� ���� ������ guest.equals = " + req.getParameter("logout"));
				session.invalidate();
				dispatcher.forward(req, resp);
			}
			else if(userId.equals(session.getAttribute("logged"))){
				System.out.println("����� userId.equals(logged) = " + session.getAttribute("logged"));
				dispatcher.forward(req, resp);
			}
			else{
				System.out.println("����� guest.equals�� else = " + req.getParameter("logout"));
				dispatcher.forward(req, resp);
			}
		}
		else{
			
		}
		
		} // try close
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
	
	// 특정 user를 DB 에서 가져오기
		public QuizUserDTO getUser(HttpServletRequest req, String user_Name){
			
			QuizUserDTO dto = new QuizUserDTO();
			
			try {
				con = ds.getConnection();
				
				session = req.getSession();
				
				String sql = "select * from user where user_id = ?";
				pstmt = con.prepareStatement(sql);  
				pstmt.setString(1, user_Name);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					dto.setUser_Id(rs.getString("user_Id"));
					dto.setUser_Email(rs.getString("user_Email"));
					dto.setUser_Password(rs.getString("user_Password"));
					dto.setUser_Name(rs.getString("user_Name"));
					dto.setUser_Address(rs.getString("user_Address"));
					dto.setUser_Phone_Number(rs.getString("user_Phone_Number"));
					dto.setUser_Total_Point(rs.getInt("user_Total_Point"));
					dto.setUser_Current_Point(rs.getInt("user_Current_Point"));
					dto.setUser_Month_Point(rs.getInt("user_Month_Point"));
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				freeConnection();
			}
			return dto;
		}
		
		// 회원 정보 수정 (mypage/replace_user_info.jsp, mypage/replace_user_proc.jsp)
		public void replaceUser(QuizUserDTO dto){
			
			try{
				con = ds.getConnection();
				
				System.out.println("여기는 replaceUser(QuizUserDTO dto) : " + dto.getUser_Email() + ", " + dto.getUser_Password() + ", " +  dto.getUser_Id());
				
				String sql = "UPDATE user SET user_email=?, user_password=?, user_address=?, user_phone_number=? WHERE user_id=?";
				
				pstmt = con.prepareStatement(sql);  
							
				pstmt.setString(1, dto.getUser_Email());
				pstmt.setString(2, dto.getUser_Password());			
				pstmt.setString(3, dto.getUser_Address());
				pstmt.setString(4, dto.getUser_Phone_Number());
				pstmt.setString(5, dto.getUser_Id());
				
				pstmt.executeUpdate();
			}
			catch(Exception err){
				err.printStackTrace();
			}
			finally{
				freeConnection();
			}
		}
		
		// 랭크
		public ArrayList getRank(){
			
			ArrayList list = new ArrayList();
			
			try {
				con = ds.getConnection();
				
				String sql = "select * from user order by user_Month_Point desc";
				pstmt = con.prepareStatement(sql);  
								
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					QuizUserDTO dto = new QuizUserDTO();
					
					dto.setUser_Id(rs.getString("user_Id"));
					dto.setUser_Email(rs.getString("user_Email"));
					dto.setUser_Password(rs.getString("user_Password"));
					dto.setUser_Name(rs.getString("user_Name"));
					dto.setUser_Address(rs.getString("user_Address"));
					dto.setUser_Phone_Number(rs.getString("user_Phone_Number"));
					dto.setUser_Total_Point(rs.getInt("user_Total_Point"));
					dto.setUser_Current_Point(rs.getInt("user_Current_Point"));
					dto.setUser_Month_Point(rs.getInt("user_Month_Point"));
					
					list.add(dto);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				freeConnection();
			}
			return list;
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
	
	// 회원 삭제(fix_user.jsp)
		public void deleteUser(String user_Id){
			try{
				con = ds.getConnection();
				
				System.out.println("deleteUser(String user_Id) : " + user_Id);
				
				String sql = "DELETE FROM user WHERE user_Id=?"; 
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_Id);
				
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
		
	// shop detail 상품가져오기
	public QuizProductDTO getProduct(int product_Number){
	
		String sql = null;
		QuizProductDTO dto = new QuizProductDTO();
		
		try{
			con = ds.getConnection();
			
			sql = "select * from product where product_Number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_Number);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setProduct_Number(rs.getInt("product_Number"));
				dto.setProduct_Name(rs.getString("product_Name"));
				dto.setProduct_Price(rs.getInt("product_Price"));
				dto.setProduct_Image(rs.getString("product_Image"));
				dto.setProduct_Stock(rs.getInt("product_Stock"));
				dto.setProduct_Company(rs.getString("product_Company"));
				dto.setProduct_Contents(rs.getString("product_Contents"));
			}
		}
		catch(Exception err){
			System.out.println("getProdduct() : " + err);
		}
		finally{
			freeConnection();
		}
		
		return dto;
		
	}
	
	// 장바구니 중복확인(아이디,상품번호), shop_cart
	public boolean compareCart(String id, int pnum){
		
		String sql = null;
		boolean bool = true;
		
		try{
			con = ds.getConnection();
			
			sql = "select * from cart where cart_user_id=? and cart_product_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("true 출력");
				bool = true;
			}
			else{
				System.out.println("false 출력");
				bool = false;
				
			}
		}
		catch(Exception err){
			System.out.println("compareCart() : " + err);
		}
		finally{
			freeConnection();
		}
		return bool;
		
	}
	
	// 장바구니 추가(아이디, 상품번호) shop_cart
	public void insertCart(String id, int pnum){
		String sql = null;
		boolean bool = false;
		
		try{
			con = ds.getConnection();
			
			sql = "insert into cart (cart_user_id,cart_product_number) values(?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pnum);
			pstmt.executeUpdate();
			
		}
		catch(Exception err){
			System.out.println("compareCart() : " + err);
		}
		finally{
			freeConnection();
		}
	}
	
	// 카트정보 불러오기(아이디), shop_cart
	public ArrayList getCart(String id){
		
		ArrayList list = new ArrayList();
		String sql = null;
		
		
		try{
			con = ds.getConnection();
			
			sql = "select product_image,product_name,product_price,product_number from product where product_number in (select cart_product_number from cart where cart_user_id=?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				QuizProductDTO dto = new QuizProductDTO();
				
				dto.setProduct_Image(rs.getString("product_image"));
				dto.setProduct_Name(rs.getString("product_name"));
				dto.setProduct_Price(rs.getInt("product_price"));
				dto.setProduct_Number(rs.getInt("product_number"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getCart() : " + err);
		}
		finally{
			freeConnection();
		}
		
		return list;
		
	}
	
	// 카트삭제 프로세스 (프로덕트 넘버, 유저아이디) , shop_cart.jsp
	public void deleteCart(String[]product_Number, String userId){
		System.out.println("카트삭제");
		String sql = null;
		
		try{
		con = ds.getConnection();
		
		for(int i=0; i<product_Number.length; i++){
			sql = "delete from cart where cart_product_number=? and cart_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product_Number[i]);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}
		}
		catch(Exception err){System.out.println("deleteCart : " + err);}
		finally{freeConnection();}
	}
	
	// 유저 포인트 가져오기(유저아이디) , shop_cart
	public int getUserPoint(String id){
		String sql = null;
		int point = 0;
		
		try{
			con = ds.getConnection();
			sql = "select user_current_point from user where user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				QuizUserDTO dto = new QuizUserDTO();
				point = rs.getInt("user_current_point");
			}
			
			}
			catch(Exception err){System.out.println("getUserPoint : " + err);}
			finally{freeConnection();}
			return point;
	}
	
	// 구매등록하기(Dto,String product,id)&포인트 차감, product=상품번호/주문수량/상품가격, shop_buy_proc, 
	public void insertBuy(QuizBuyDTO dto, String product, String id){
		
		String [] infoProduct = product.split("/"); 

		try{
			con = ds.getConnection();
			// 구매등록
			for(int i=0; i<(infoProduct.length)/3; i++){
				String sql = "INSERT INTO buy (buy_id, buy_date, buy_product_number, buy_amount, buy_price, buy_progress, buy_invoice, buy_addressee, buy_destination, buy_phone, buy_tel, buy_sender, buy_etc)"
						+ " VALUES (?,now(),?,?,?,0,0,?,?,?,?,?,?)"; 
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				for(int j=i*3; j<i*3+3 ; j++){
					pstmt.setInt(((j+2)-(i*3)), Integer.parseInt(infoProduct[j]));
				}
				pstmt.setString(5, dto.getBuy_addressee());
				pstmt.setString(6, dto.getBuy_destination());
				pstmt.setString(7, dto.getBuy_phone());
				pstmt.setString(8, dto.getBuy_tel());
				pstmt.setString(9, dto.getBuy_sender());
				pstmt.setString(10, dto.getBuy_etc());
				
				pstmt.executeUpdate();
				
			// 포인트 차감	
				int deduct = Integer.parseInt(infoProduct[i*3+1])*Integer.parseInt(infoProduct[i*3+2]);
				System.out.println("차감 포인트 : " + deduct);
				System.out.println(dto.getBuy_addressee());
				sql = "update user set user_current_point=user_current_point - ? where user_id=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, deduct);
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();
			}
		}
		catch(Exception err){
			System.out.println("insertBuy : "  + err);
		}
		finally{
			freeConnection();
		}
	}
	
	// 인스턴스 클로즈 메서드
	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
}
