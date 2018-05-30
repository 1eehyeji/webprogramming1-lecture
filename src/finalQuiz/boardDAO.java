package finalQuiz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class boardDAO {
	public static List<boardDTO> findAll() throws Exception {
		String sql = "SELECT * FROM board";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<boardDTO> list = new ArrayList<boardDTO>();
			while (resultSet.next()) {
				boardDTO board = new boardDTO();
				board.setId(resultSet.getInt("id"));
				board.setBoardName(resultSet.getString("boardName"));
				list.add(board);
			}
			return list;
		}
	}
}
