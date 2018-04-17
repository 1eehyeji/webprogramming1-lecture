package jdbc02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

	public static List<User> findAll() throws Exception{
		String sql = "select s.*, d.departmentName " +
						"from user s left join department d on s.departmentId = d.id";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statment = connection.prepareStatement(sql);
				ResultSet resultSet = statment.executeQuery()){
			ArrayList<User> list = new ArrayList<User>();
			while(resultSet.next()) {
				User user = new User();
				user.setUserid(resultSet.getString("userid"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setDepartmentName(resultSet.getString("departmentName"));
				user.setUserType(resultSet.getString("userType"));
				list.add(user);
			}
			return list;
		}
	}
}
