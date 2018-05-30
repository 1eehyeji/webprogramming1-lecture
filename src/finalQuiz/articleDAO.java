package finalQuiz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class articleDAO {

	public static List<articleDTO> findAll(int currentPage, int pageSize, String ss, String st, String od) 
			throws Exception {
		String order = "ID"; 
		String ss1 = "";
		switch (ss) { 
		case "1": ss1 = "where u.name like \"%" + st + "%\""; break;
		case "2": ss1 = "where title like \"%" + st + "%\""; break; 
		} 
		switch (od) { 
		case "1": order = "u.name"; break; 
		case "2": order = "u.name desc"; break; 
		case "3": order = "no desc"; break;
		case "4": order = "title"; break;
		} 
		String sql = "SELECT a.*, u.name" + 
				" FROM article a LEFT JOIN user u ON a.userId = u.id " + 
				ss1 + " ORDER BY " + order + " LIMIT ?, ?";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, (currentPage - 1) * pageSize); // firstRecordIndex
			statement.setInt(2, pageSize);                     // pageSize
			try (ResultSet rs = statement.executeQuery()) {
				ArrayList<articleDTO>list = new ArrayList<articleDTO>();
				while (rs.next()) {
					articleDTO article = new articleDTO();
					article.setId(rs.getInt("id"));
					article.setUserId(rs.getInt("userId"));
					article.setBoardId(rs.getInt("boardId"));
					article.setNo(rs.getInt("no"));
					article.setWriteTime(rs.getTimestamp("writeTime"));
					article.setTitle(rs.getString("title"));
					article.setBody(rs.getString("body"));
					article.setNotice(rs.getBoolean("notice"));
					article.setUserName(rs.getString("name"));
					list.add(article);
				}
				return list;
			}
		}
	}

	public static int count(String ss, String st) throws Exception {
		String ss1 = "";
		switch (ss) { 
		case "1": ss1 = "where u.name like \"%" + st + "%\""; break;
		case "2": ss1 = "where title like \"%" + st + "%\""; break; 
		}
		String sql = "SELECT count(a.id)" + 
				" FROM article a LEFT JOIN user u ON a.userId = u.id " + ss1;
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next())
					return resultSet.getInt(1);
			}
		}
		return 0;
	}

	public static articleDTO findOne(int id) throws Exception {
		String sql = "select a.*, u.name from article a LEFT JOIN user u ON a.userId = u.id "
				+ "where a.id = ?";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id); // firstRecordIndex
			try (ResultSet rs = statement.executeQuery()) {
				if (rs.next()) {
					articleDTO article = new articleDTO();
					article.setId(rs.getInt("id"));
					article.setUserId(rs.getInt("userId"));
					article.setBoardId(rs.getInt("boardId"));
					article.setNo(rs.getInt("no"));
					article.setWriteTime(rs.getTimestamp("writeTime"));
					article.setTitle(rs.getString("title"));
					article.setBody(rs.getString("body"));
					article.setNotice(rs.getBoolean("notice"));
					article.setUserName(rs.getString("name"));
					return article;
				}
				return null;
			}
		}
	}

	public static void update(articleDTO article) throws Exception {
		String sql = "UPDATE article SET title=?, body=?, userId=?, notice=? " +
				" WHERE id = ?";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, article.getTitle());
			statement.setString(2, article.getBody());
			statement.setInt(3, article.getUserId());
			statement.setInt(4, article.isNotice() ? 1 : 0);
			statement.setInt(5, article.getId());
			statement.executeUpdate();
		}
	}

	public static void insert(articleDTO article) throws Exception {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String sql = "INSERT article (no, title, body, userId, boardId, notice, writeTime)" +
				" VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, article.getNo());
			statement.setString(2, article.getTitle());
			statement.setString(3, article.getBody());
			statement.setInt(4, article.getUserId());
			statement.setInt(5, article.getBoardId());
			statement.setInt(6, article.isNotice() ? 1 : 0);
			statement.setTimestamp(7, timestamp);
			statement.executeUpdate();
		}
	}

}
