package jdbc02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

	public static List<User> findAll(int currentPage, int pageSize) throws Exception{
		String sql = "SELECT s.*, d.departmentName " +
				"from user s left join department d on s.departmentId = d.id " +
				"limit ?,?";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statment = connection.prepareStatement(sql)){
				statment.setInt(1, ((currentPage - 1) * pageSize));
				statment.setInt(2, pageSize);
			try(ResultSet resultSet = statment.executeQuery()){
				ArrayList<User> list = new ArrayList<User>();
				while(resultSet.next()) {
					User user = new User();
					user.setUserid(resultSet.getString("userid"));
					user.setName(resultSet.getString("name"));
					user.setEmail(resultSet.getString("email"));
					user.setDepartmentName(resultSet.getString("departmentName"));
					user.setEnabled(resultSet.getInt("enabled") == 1 ? true : false);
					user.setUserType(resultSet.getString("userType"));
					list.add(user);
				}
				return list;
			}
		}
	}

	public static List<User> findByEnable(String enabled) throws Exception{
		String sql = "select s.*, d.departmentName " +
				"from user s left join department d on s.departmentId = d.id " +
				"where enabled = ?";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statment = connection.prepareStatement(sql)){
			statment.setString(1, enabled);
			try(ResultSet resultSet = statment.executeQuery()){
				ArrayList<User> list = new ArrayList<User>();
				while(resultSet.next()) {
					User user = new User();
					user.setUserid(resultSet.getString("userid"));
					user.setName(resultSet.getString("name"));
					user.setEmail(resultSet.getString("email"));
					user.setDepartmentName(resultSet.getString("departmentName"));
					user.setEnabled(resultSet.getInt("enabled") == 1 ? true : false);
					user.setUserType(resultSet.getString("userType"));
					list.add(user);
				}
				return list;
			}
		}
	}

	/* mysql에서는 지원하지 않는 메소드 (createArrayOf)
    public static List<User> findByUserType(String[] userType) throws Exception {
        String sql = "select s.*, d.departmentName " +
                     "from user s left join department d on s.departmentId = d.id " +
                     "where userType IN (?)";
        try (Connection connection = DB.getConnection("student1");
                PreparedStatement statment = connection.prepareStatement(sql)) {
            statment.setArray(1, connection.createArrayOf("VARCHAR", userType));
            try (ResultSet resultSet = statment.executeQuery()) {
                ArrayList<User> list = new ArrayList<User>();
                while (resultSet.next()) {
                    User user = new User();
                    user.setUserid(resultSet.getString("userid"));
                    user.setName(resultSet.getString("name"));
                    user.setEmail(resultSet.getString("email"));
                    user.setDepartmentName(resultSet.getString("departmentName"));
                    user.setEnabled(resultSet.getInt("enabled") == 1 ? true : false);
                    user.setUserType(resultSet.getString("userType"));
                    list.add(user);
                }
                return list;
            }
        }
    }
	 */

	public static List<User> findByUserType(String[] userType) throws Exception {
		String sql = "select s.*, d.departmentName " +
				"from user s left join department d on s.departmentId = d.id ";

		if (userType.length > 0) {
			String s = " where userType in ('" + String.join("', '", userType) + "')";
			sql = sql + s;
		}

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statment = connection.prepareStatement(sql)) {
			try (ResultSet resultSet = statment.executeQuery()) {
				ArrayList<User> list = new ArrayList<User>();
				while (resultSet.next()) {
					User user = new User();
					user.setUserid(resultSet.getString("userid"));
					user.setName(resultSet.getString("name"));
					user.setEmail(resultSet.getString("email"));
					user.setDepartmentName(resultSet.getString("departmentName"));
					user.setEnabled(resultSet.getInt("enabled") == 1 ? true : false);
					user.setUserType(resultSet.getString("userType"));
					list.add(user);
				}
				return list;
			}
		}
	}

	/*
	 *	String[] a = {"관리자", "교수"};
	 *	String s1 = String.join("', '", a); // "관리자', '교수"
	 *	String s2 = "userType IN ('" + String.join("', '", a) + "')"; // "userType IN ('관리자', '교수')"
	 */ 

	public static int count() throws Exception{
		String sql = "select * from user";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statment = connection.prepareStatement(sql);
				ResultSet resultSet = statment.executeQuery()){
			int recordCount = 0;
			while(resultSet.next()) {
				++recordCount;
			}
			return recordCount;
		}
	}

}
