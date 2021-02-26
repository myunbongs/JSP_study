package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 실제 mysql에 접속하는 부분 
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "user";
			String dbPassword = "001030";
			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql driver 찾기 (mysql에 접속을 돕는 매개체 드라이브 라이브러리)
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// login 처리하는 함수 
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); // pstmt에 정해진 sql 문장을 데이터베이스에 삽입하여 인스턴스 가져오기
			pstmt.setNString(1,  userID); // 해킹 방어 수단 (prepareStatement에 '?'를 넣어놨다가 userID 넣기)
			rs = pstmt.executeQuery(); // SQL 실행한 결과~~~~ 
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공!
				}
				else { 
					return 0; //비밀번호 불일치 
				}
			}
			return -1; // 아이디 無
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5, user.getUserGender());
			return pstmt.executeUpdate(); // ?에 해당 변수 채워넣고 해당 문장를 실행한 결과를 넣도록!!! 
			// insert 문장이 실행된 경우 반드시 0 이상의 숫자가 반환됨~ 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
