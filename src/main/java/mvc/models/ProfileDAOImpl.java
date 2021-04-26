package mvc.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProfileDAOImpl implements ProfileDAO {

	private DataSource dataSource;
	private static final ProfileDAO memberDAO = new ProfileDAOImpl();

	private ProfileDAOImpl() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle2");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ProfileDAO getInstance() {
		return memberDAO;
	}

	@Override
	public List<ProfileDTO> getProfileList() throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select B.* ");
		sql.append("from  (select rownum as rnum, A.* ");
		sql.append("       from  (select no, username, nickname, read_count from t_profile ");
		sql.append("              order by no desc) A) B ");
		sql.append("where rnum between 1 and 10 ");

		List<ProfileDTO> list = new ArrayList<>();

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					ProfileDTO articleDTO = new ProfileDTO();
					articleDTO.setProfile_no(rs.getLong("no"));
					articleDTO.setUsername(rs.getString("username"));
					articleDTO.setNickname(rs.getString("nickname"));
					articleDTO.setRead_count(rs.getLong("read_count"));
					list.add(articleDTO);
				}
			}
		}
		return list;
	}
}
