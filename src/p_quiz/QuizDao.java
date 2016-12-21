package p_quiz;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

import javax.naming.*;
import javax.sql.DataSource;


public class QuizDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public QuizDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");

			System.out.println("DB연결 성공");
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}

	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
	
	// 퀴즈 풀이 포인트 계산
	public ArrayList getQuiz_p(String category, int q_numbers){
		ArrayList<QuizDto> list = new ArrayList<>();
		ArrayList<Integer> arr_quiz_num = new ArrayList<>();
		int random_num[] = new int[q_numbers];
		Random r1 = new Random();

		String sql = null;
		
		try{
			con = ds.getConnection();
			
			sql = "SELECT quiz_number FROM quiz WHERE quiz_category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				arr_quiz_num.add(rs.getInt("quiz_number"));
			}
			
			if(arr_quiz_num.size() > q_numbers){
				for(int i = 0; i < random_num.length; i++){
					random_num[i] = r1.nextInt(arr_quiz_num.size());
					for(int j = 0; j < i; j++){
						if (random_num[i] == random_num[j]){
							i--;
							break;
						}
					}
				}
			}
			
			for(int i = 0; i < q_numbers; i++){
				sql = "SELECT * FROM quiz WHERE quiz_number = ? AND quiz_category = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, arr_quiz_num.get(random_num[i]));
				pstmt.setString(2, category);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					QuizDto dto = new QuizDto();
					
					dto.setQ_number(rs.getInt("quiz_number"));
					dto.setQ_cartegory(rs.getString("quiz_category"));
					dto.setQ_point(rs.getInt("quiz_point"));
					dto.setQ_contents(rs.getString("quiz_contents"));
					dto.setQ_exam1(rs.getString("quiz_exam1"));
					dto.setQ_exam2(rs.getString("quiz_exam2"));
					dto.setQ_exam3(rs.getString("quiz_exam3"));
					dto.setQ_exam4(rs.getString("quiz_exam4"));
					dto.setQ_answer(rs.getInt("quiz_answer"));

					list.add(dto);
				}
			}

		}
		catch(Exception err){
			System.out.println("getQuiz_p() : " + err);
		}
		finally{
			freeConnection();
		}

		return list;
	}
	
	// 퀴즈 풀이 후 포인트 업데이트
	public void acquired_point_update(String userID, int acquired_point){

		String sql = null;
		
		try{
			int user_total_point = 0;
			int user_current_point = 0;
			int user_month_point = 0;

			con = ds.getConnection();
			
			sql = "SELECT * FROM user WHERE user_Id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
				
			if(rs.next()){
				user_total_point = rs.getInt("user_total_point");
				user_current_point = rs.getInt("user_current_point");
				user_month_point = rs.getInt("user_month_point");
			}
			//System.out.println(userID + " : " + user_total_point + ", " + user_current_point + ", " + user_month_point);
			
			user_total_point += acquired_point;
			user_current_point += acquired_point;
			user_month_point += acquired_point;
			
			sql = "UPDATE user set user_total_point=?, user_current_point=?, user_month_point=? WHERE user_Id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_total_point);
			pstmt.setInt(2, user_current_point);
			pstmt.setInt(3, user_month_point);
			pstmt.setString(4, userID);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("acquired_point_update() : " + err);
		}
		finally{
			freeConnection();
		}

		
	}

}