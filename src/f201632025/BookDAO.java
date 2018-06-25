package f201632025;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
	public static List<Book> findAll() throws Exception{
		String sql = "select b.id, b.title title1, b.author, b. categoryId, b.price, b.publisherId, b.available, c.categoryName, p.title title2 " +
				"from book b left join category c on b.categoryId = c.id " +
				"left join publisher p on b.publisherId = p.id " + "order by b.id";
		try(Connection conn = DB.getConnection("book2");
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			try(ResultSet rs = pstmt.executeQuery()){
				ArrayList<Book> list = new ArrayList<>();
				while(rs.next())
				{
					Book book = new Book();
					book.setId(rs.getInt("id"));
					book.setTitle(rs.getString("title1"));
					book.setAuthor(rs.getString("author"));
					book.setCategoryid(rs.getInt("categoryId"));
					book.setPrice(rs.getInt("price"));
					book.setPublisherid(rs.getInt("publisherId"));
					book.setAvailable(rs.getBoolean("available"));
					book.setCategoryName(rs.getString("categoryName"));
					book.setPublisherName(rs.getString("title2"));
					list.add(book);
				}
				return list;
			}
		}
	}
	
	public static List<Book> findAll(int currentPage, int pageSize) throws Exception{
		String sql = "call book_findAll(?, ?)";
		try(Connection conn = DB.getConnection("book2");
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, ((currentPage - 1) * pageSize));
			pstmt.setInt(2, pageSize);
			try(ResultSet rs = pstmt.executeQuery()){
				ArrayList<Book> list = new ArrayList<>();
				while(rs.next())
				{
					Book book = new Book();
					book.setId(rs.getInt("id"));
					book.setTitle(rs.getString("title"));
					book.setAuthor(rs.getString("author"));
					book.setCategoryid(rs.getInt("categoryId"));
					book.setPrice(rs.getInt("price"));
					book.setPublisherid(rs.getInt("publisherId"));
					book.setAvailable(rs.getBoolean("available"));
					book.setCategoryName(rs.getString("categoryName"));
					list.add(book);
				}
				return list;
			}
		}
	}

	public static List<Book> findAll(int currentPage, int pageSize, String ss, String st) throws Exception{
		String sql = "call book_findAll(?, ?, ?, ?)";
		try(Connection conn = DB.getConnection("book2");
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, ((currentPage - 1) * pageSize));
			pstmt.setInt(2, pageSize);
			pstmt.setString(3, ss);                        // 조회방법
			pstmt.setString(4, st);                        
			try(ResultSet rs = pstmt.executeQuery()){
				ArrayList<Book> list = new ArrayList<>();
				while(rs.next())
				{
					Book book = new Book();
					book.setId(rs.getInt("id"));
					book.setTitle(rs.getString("title"));
					book.setAuthor(rs.getString("author"));
					book.setCategoryid(rs.getInt("categoryId"));
					book.setPrice(rs.getInt("price"));
					book.setPublisherid(rs.getInt("publisherId"));
					book.setAvailable(rs.getBoolean("available"));
					book.setCategoryName(rs.getString("categoryName"));
					list.add(book);
				}
				return list;
			}
		}
	}

	public static int count() throws Exception{
		String sql = "select count(*) from book";
		try(Connection conn = DB.getConnection("book2");
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) return rs.getInt(1);
		}
		return 0;
	}

	public static int count(String ss, String st) throws Exception{
		String sql = "call book_count(?, ?)";
		try(Connection conn = DB.getConnection("book2");
				PreparedStatement pstmt = conn.prepareStatement(sql)){
				pstmt.setString(1, ss);
				pstmt.setString(2, st);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) return rs.getInt(1);
			}
		}
		return 0;
	}

	public static Book findOne(int id) throws Exception {
		String sql = "SELECT * FROM book WHERE id=?";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			try (ResultSet rs = statement.executeQuery()) {
				if (rs.next()) {
					Book book = new Book();
					book.setId(rs.getInt("id"));
					book.setTitle(rs.getString("title"));
					book.setAuthor(rs.getString("author"));
					book.setCategoryid(rs.getInt("categoryId"));
					book.setPrice(rs.getInt("price"));
					book.setPublisherid(rs.getInt("publisherId"));
					book.setAvailable(rs.getBoolean("available"));
					return book;
				}
			}
			return null;
		}
	}

	public static void update(Book book) throws Exception {
		String sql = "UPDATE book SET title=?, author=?, categoryId=?, publisherId=?, price=?, available=?" +
				" WHERE id = ?";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, book.getTitle());
			statement.setString(2, book.getAuthor());
			statement.setInt(3, book.getCategoryid());
			statement.setInt(4, book.getPublisherid());
			statement.setInt(5, book.getPrice());
			statement.setBoolean(6, book.isAvailable());
			statement.setInt(7, book.getId());
			statement.executeUpdate();
		}
	}

	public static void delete(int id) throws Exception {
		String sql = "DELETE FROM book WHERE id = ?";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			statement.executeUpdate();
		}
	}

}
