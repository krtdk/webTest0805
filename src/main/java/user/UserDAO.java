package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;

public class UserDAO {
    // JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    private String USER_LIST = "select * from user";
    private String USER_ONE = "select * from user where id = ?";
    private String USER_INSERT = "insert into user(id, name, password, ssn, email) values(?, ?, ?, ?, ?)";
    private String USER_COUNT = "SELECT count(*) as cnt FROM user where id = ? and password = ?";
    private String USER_GET_NAME = "SELECT name from user where id = ? and password = ?";
    
    // 로그인 확인
    public boolean checkLogin(String id, String password) {
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(USER_COUNT);
            stmt.setString(1, id);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            rs.next();
            if (rs.getInt("cnt") == 1) {
                return true;  // 로그인 성공
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return false;  // 로그인 실패
    }
    
    public String getUserName(String id, String password) {
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(USER_GET_NAME);
            stmt.setString(1, id);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            rs.next();
//            if (rs.getInt("cnt") == 1) {
                return rs.getString("name");  // 로그인 성공
//            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return null;  // 로그인 실패
    }
    
    // 사용자 등록
    public void insertUser(UserDTO dto) {
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(USER_INSERT);
            stmt.setString(1, dto.getId());
            stmt.setString(2, dto.getName());
            stmt.setString(3, dto.getPassword());
            stmt.setInt(4, dto.getSsn());
            stmt.setString(5, dto.getEmail());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
    
    // 사용자 정보 조회
    public UserDTO getUser(String id) {
        UserDTO dto = null;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(USER_ONE);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                dto = new UserDTO(rs.getString("id"), rs.getString("name"),
                        rs.getString("password"), rs.getInt("ssn"), rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return dto;
    }
    
    // 사용자 목록 조회
    public List<UserDTO> getUserList() {
        List<UserDTO> list = new ArrayList<>();
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(USER_LIST);
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserDTO dto = new UserDTO(rs.getString("id"), rs.getString("name"),
                        rs.getString("password"), rs.getInt("ssn"), rs.getString("email"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return list;
    }
}
