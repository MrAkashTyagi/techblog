package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;

import entities.Categories;
import entities.Post;
import entities.User;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Categories> getAllCategories() {

		ArrayList<Categories> list = new ArrayList<Categories>();

		try {

			String query = "select * from categories";
			Statement st = this.con.createStatement();

			ResultSet set = st.executeQuery(query);
			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Categories categories = new Categories(cid, name, description);
				list.add(categories);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post p) {

		boolean flag = false;

		try {

			String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}

	public List<Post> getAllPost() {

		List<Post> postList = new ArrayList<>();

		// fetch all posts
		try {

//			get all posts

			String query = "select * from posts order by pid desc";
			PreparedStatement pstmt = con.prepareStatement(query);

			ResultSet set = pstmt.executeQuery();

			while (set.next()) {

				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");

				Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				postList.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return postList;
	}

	public List<Post> getPostByCatID(int catId) {

		List<Post> post = new ArrayList<Post>();

//		fetch post by catId
		try {

//			get all posts

			String query = "select * from posts where catId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, catId);
			ResultSet set = pstmt.executeQuery();

			while (set.next()) {

				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");

				Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				post.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;
	}

	public Post getPostByPostId(int postId) {
		Post post = null;
		try {
			String query = "select * from posts where pid=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, postId);
			ResultSet set = pstmt.executeQuery();
			if (set.next()) {

				post = new Post();
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				int catId = set.getInt("catId");

				post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}

}
