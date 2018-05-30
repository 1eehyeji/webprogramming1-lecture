package finalQuiz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDAO {
	public static List<userDTO> findAll() throws Exception {
		String sql = "SELECT * FROM user";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<userDTO>list = new ArrayList<userDTO>();
			while (resultSet.next()) {
				userDTO user = new userDTO();
				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				list.add(user);
			}
			return list;
		}
	}

}
