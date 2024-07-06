package dao;

import java.sql.*;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

public class LikeDao {

	Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean saveLike(int pid, int uid) {

		boolean flag = false;

		try {

			String query = "insert into liked (pid,uid) values(?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);

			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}

	public int getLikeCountOnPost(int pid) {
		int count = 0;

		try {
			String query = "select count (*) from liked where pid=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(0, pid);
			ResultSet set = pstmt.executeQuery();

			if (set.next()) {

				count = set.getInt("count(*)");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean flag = false;

		try {
			
			String query = "select * from liked where pid=? and uid=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				
				flag = true;	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}

	public boolean deleteLike(int pid, int uid) {
		boolean flag = false;
		
		try {
			
			PreparedStatement pstmt = this.con.prepareStatement("delete from liked where pid=? and uid=?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		return false;
		
		
	}
	
}
