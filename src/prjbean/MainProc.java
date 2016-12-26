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
	
	// �α��� ���μ��� (index.jsp)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	// �α��� ���μ��� (index.jsp)
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
				System.out.println("����� rs �ؽ�Ʈ");
				
				dto.setUser_Id(rs.getString("user_Id"));
				dto.setUser_Password(rs.getString("user_Password"));
				dto.setUser_Current_Point(rs.getInt("user_Current_Point"));
		
				req.setAttribute("dto", dto);
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
				
				if(rs.getString("user_Id").equals(userId) && rs.getString("user_Password").equals(userPw)){
					System.out.println("����� �α� ����");
					session.setAttribute("logged", userId);
					dispatcher.forward(req, resp);
				}
				
				else if(guest.equals(req.getParameter("logout"))){
					System.out.println("����� �α׾ƿ�");
					session.invalidate();
					dispatcher.forward(req, resp);
				}
				else{
					System.out.println("����� ��ȸ��");
					session.invalidate();
					dispatcher.forward(req, resp);
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
		
		} // try ����
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(rs != null){try{rs.close();}catch(Exception err){}}
			if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
			if(con != null){try{con.close();}catch(Exception err){}}
		}
	}

	// ���� DB �α���
	public MainProc(){
		try{
			Context ctx = new InitialContext();
			
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			
			con = ds.getConnection();
		}
		catch(Exception err){
			System.out.println("DB ���� ����" + err);
		}
		finally{
			
		}
	}
	
	// �׽�Ʈ(�����ص� ��)
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
	
	// �׽�Ʈ(�����ص� ��)
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
	
	// �ű԰���(mypage/join_new.jsp)
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
	
	// shop ���� ��ǰ��� �ҷ�����
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
		
	// shop detail ��ǰ��������
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
	
	// ��ٱ��� �ߺ�Ȯ��(���̵�,��ǰ��ȣ), shop_cart
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
				System.out.println("true ���");
				bool = true;
			}
			else{
				System.out.println("false ���");
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
	
	// ��ٱ��� �߰�(���̵�, ��ǰ��ȣ) shop_cart
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
	
	// īƮ���� �ҷ�����(���̵�), shop_cart
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
	
	// īƮ���� ���μ��� (���δ�Ʈ �ѹ�, �������̵�) , shop_cart.jsp
	public void deleteCart(String[]product_Number, String userId){
		System.out.println("īƮ����");
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
	
	// ���� ����Ʈ ��������(�������̵�) , shop_cart
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
	
	// ���ŵ���ϱ�(String product), product=��ǰ��ȣ/�ֹ�����/��ǰ����, shop_buy_proc, 
	public void insertBuy(String product, String id){
		System.out.println("insertBuy ����");
		String [] infoProduct = product.split("/"); 
		System.out.println(infoProduct.length);
		
		try{
			con = ds.getConnection();
			
			for(int i=0; i<(infoProduct.length)/3; i++){
				String sql = "INSERT INTO buy (buy_id, buy_date, buy_product_number, buy_amount, buy_price, buy_progress, buy_invoice, buy_addressee, buy_destination, buy_phone, buy_tel, buy_sender, buy_etc)"
						+ " VALUES (?,sysdate,?,?,?,0,0,?,?,?,?,?,?)"; 
				
				 pstmt = con.prepareStatement(sql);
				
				for(int j=i*3; j<i*3+3 ; j++){
					
					pstmt.setString(1, dto.getUser_Id());
					pstmt.setString(2, dto.getUser_Email());
					pstmt.setString(3, dto.getUser_Password());
					pstmt.setString(4, dto.getUser_Name());
					pstmt.setString(5, dto.getUser_Address());
					pstmt.setString(6, dto.getUser_Phone_Number());
					
					pstmt.executeUpdate();
					
				
				}
			}
		}
		catch(Exception err){
			System.out.println("insertBuy : "  + err);
		}
		finally{
			freeConnection();
		}
	}
	
	
	// �ν��Ͻ� Ŭ���� �޼���
	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
}
