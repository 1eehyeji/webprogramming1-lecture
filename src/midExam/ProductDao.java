package midExam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

	public static List<Product> findAll() throws Exception{
		String sql = "select p.*, c.name " +
				"from product p left join category c on p.categoryId = c.id";
		try(Connection connection = DB.getConnection("product");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()){
			ArrayList<Product> list = new ArrayList<Product>();
			while(resultSet.next()) {
				Product product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setTitle(resultSet.getString("title"));
				product.setCategoryId(resultSet.getInt("categoryId"));
				product.setUnitCost(resultSet.getInt("unitCost"));
				product.setQuantity(resultSet.getInt("quantity"));
				product.setCategoryName(resultSet.getString("c.name"));
				list.add(product);
			}
			return list;
		}

	}

	public static List<Product> findAll(int currentPage, int pageSize) throws Exception{
		String sql = "select p.*, c.name " +
				"from product p left join category c on p.categoryId = c.id " +
				"limit ?,?";
		try(Connection connection = DB.getConnection("product");
				PreparedStatement statment = connection.prepareStatement(sql)){
			statment.setInt(1, ((currentPage - 1) * pageSize));
			statment.setInt(2, pageSize);
			try(ResultSet resultSet = statment.executeQuery()){
				ArrayList<Product> list = new ArrayList<Product>();
				while(resultSet.next()) {
					Product product = new Product();
					product.setId(resultSet.getInt("id"));
					product.setTitle(resultSet.getString("title"));
					product.setCategoryId(resultSet.getInt("categoryId"));
					product.setUnitCost(resultSet.getInt("unitCost"));
					product.setQuantity(resultSet.getInt("quantity"));
					product.setCategoryName(resultSet.getString("c.name"));
					list.add(product);
				}
				return list;
			}
		}
	}

	public static List<Product> findByName(String name) throws Exception{
		String sql = "SELECT p.*, c.name " +
				"FROM product p LEFT JOIN category c ON p.categoryId = c.id " +
				"WHERE p.title LIKE ?";
		try(Connection connection = DB.getConnection("product");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, name + "%");
			try(ResultSet resultSet = statement.executeQuery()){
				ArrayList<Product> list = new ArrayList<Product>();
				while(resultSet.next()) {
					Product product = new Product();
					product.setId(resultSet.getInt("id"));
					product.setTitle(resultSet.getString("title"));
					product.setCategoryId(resultSet.getInt("categoryId"));
					product.setUnitCost(resultSet.getInt("unitCost"));
					product.setQuantity(resultSet.getInt("quantity"));
					product.setCategoryName(resultSet.getString("c.name"));
					list.add(product);
				}
				return list;
			}
		}
	}

	public static List<Product> findByCategoryName(int categoryId) throws Exception{
		String sql = "SELECT p.*, c.name " +
				"FROM product p LEFT JOIN category c ON p.categoryId = c.id " +
				"WHERE c.id = ?";
		try(Connection connection = DB.getConnection("product");
				PreparedStatement statment = connection.prepareStatement(sql)){
			statment.setInt(1, categoryId);
			try(ResultSet resultSet = statment.executeQuery()){
				ArrayList<Product> list = new ArrayList<Product>();
				while(resultSet.next()) {
					Product product = new Product();
					product.setId(resultSet.getInt("id"));
					product.setTitle(resultSet.getString("title"));
					product.setCategoryId(resultSet.getInt("categoryId"));
					product.setUnitCost(resultSet.getInt("unitCost"));
					product.setQuantity(resultSet.getInt("quantity"));
					product.setCategoryName(resultSet.getString("c.name"));
					list.add(product);
				}
				return list;
			}
		}
	}
	
	public static int count() throws Exception{
		String sql = "select * from product";
		try(Connection connection = DB.getConnection("product");
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
