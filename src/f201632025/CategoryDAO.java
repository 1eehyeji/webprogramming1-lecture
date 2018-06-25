package f201632025;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
	public static List<Category> findAll() throws Exception{
		String sql = "select * from category";
		try(Connection conn = DB.getConnection("book2");
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			try(ResultSet rs = pstmt.executeQuery()){
				ArrayList<Category> list = new ArrayList<>();
				while(rs.next())
				{
					Category category = new Category();
					category.setId(rs.getInt("id"));
					category.setCategoryName(rs.getString("categoryName"));
					list.add(category);
				}
				return list;
			}
		}
	}
}
