package f201632025;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PublisherDAO {
	public static List<Publisher> findAll() throws Exception{
		String sql = "select * from publisher";
		try(Connection conn = DB.getConnection("book2");
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			try(ResultSet rs = pstmt.executeQuery()){
				ArrayList<Publisher> list = new ArrayList<>();
				while(rs.next())
				{
					Publisher publisher = new Publisher();
					publisher.setId(rs.getInt("id"));
					publisher.setTitle(rs.getString("title"));
					list.add(publisher);
				}
				return list;
			}
		}
	}
}
