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
					user.setId(resultSet.getInt("id"));
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
					user.setId(resultSet.getInt("id"));
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

	public static User findOne(String id) throws Exception{
		String sql = "select s.*, d.departmentName " +
				"from user s left join department d on s.departmentId = d.id " +
				"where s.id = ?";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statment = connection.prepareStatement(sql)){
			statment.setString(1, id);
			try(ResultSet resultSet = statment.executeQuery()){
				if (resultSet.next()) {
					User user = new User();
					user.setId(resultSet.getInt("id"));
					user.setUserid(resultSet.getString("userid"));
					user.setName(resultSet.getString("name"));
					user.setEmail(resultSet.getString("email"));
					user.setDepartmentId(resultSet.getInt("departmentId"));
					user.setEnabled(resultSet.getInt("enabled") == 1 ? true : false);
					user.setUserType(resultSet.getString("userType"));
					return user;
				}
			}
			return null;
		}
	}


	public static void update(User user) throws Exception {
		String sql = "UPDATE user SET userid=?, name=?, email=?, departmentId=?, enabled=?, userType=? " +
				" WHERE id = ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, user.getUserid());
			statement.setString(2, user.getName());
			statement.setString(3, user.getEmail());
			statement.setInt(4, user.getDepartmentId());
			statement.setInt(5, user.isEnabled()? 1 : 0);
			statement.setString(6, user.getUserType());
			statement.setInt(7, user.getId());
			statement.executeUpdate();
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

	public static List<User> findByName(String name, int currentPage, int pageSize) throws Exception {
		String sql = "select s.*, d.departmentName " +
				"from user s left join department d on s.departmentId = d.id " + 
				"where name LIKE ?" +
				"LIMIT ?, ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, name + "%");
			statement.setInt(2, (currentPage - 1) * pageSize);
			statement.setInt(3, pageSize);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<User> list = new ArrayList<User>();
				while (resultSet.next()) {
					User user = new User();
					user.setId(resultSet.getInt("id"));
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

	public static int count(String name) throws Exception{
		String sql = "SELECT COUNT(*) FROM user WHERE name LIKE ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, name + "%");
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next())
					return resultSet.getInt(1);
			}
		}
		return 0;
	}

	public static void insert(User user) throws Exception {
		String sql = "INSERT user (userid, password, name, email, departmentId, enabled, userType)" +
				" VALUES (?, ?, ?, ?, ?, 1, ?)";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, user.getUserid());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getName());
			statement.setString(4, user.getEmail());
			statement.setInt(5, user.getDepartmentId());
			statement.setString(6, user.getUserType());
			statement.executeUpdate();
		}
	}

	public static void delete(int id) throws Exception {
		String sql = "DELETE FROM user WHERE id = ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			statement.executeUpdate();
		}
	}

}
