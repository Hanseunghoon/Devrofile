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
	private static final ProfileDAO profileDAO = new ProfileDAOImpl();

	private ProfileDAOImpl() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ProfileDAO getInstance() {
		return profileDAO;
	}

	/*-------------------------------
	 	   프로필 리스트 불러오기 
	 -------------------------------*/
	@Override
	public List<ProfileDTO> getProfileList() throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select B.* ");
		sql.append("from  (select rownum as rnum, A.* ");
		sql.append("       from  (select profile_no, username, nickname, regdate, read_count from t_profile ");
		sql.append("              order by profile_no desc) A) B ");
		sql.append("where rnum between 1 and 10 ");

		List<ProfileDTO> list = new ArrayList<>();

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					ProfileDTO articleDTO = new ProfileDTO();
					articleDTO.setProfile_no(rs.getLong("profile_no"));
					articleDTO.setUsername(rs.getString("username"));
					articleDTO.setNickname(rs.getString("nickname"));
					articleDTO.setRegdate(rs.getDate("regdate"));
					articleDTO.setRead_count(rs.getLong("read_count"));
					list.add(articleDTO);
				}
			}
		}
		return list;
	}
	
	/*-------------------------------
	     프로필 작성 후 등록하기 
	-------------------------------*/
	@Override
	public void insertProfile(ProfileDTO profileDTO) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO t_profile(profile_no, nickname, username, password, email, read_count, regdate, github, website, acmicpc_rank, acmicpc_solved, acmicpc_rate, tech_stacks, project_name, award_name, university_name, major, company_name, job) ");
		sql.append("VALUES(t_profile_no_seq.nextval, ?, ?, ?, ?, 0, sysdate, ?, ?, ?, ?, ? ,? ,?, ?, ?, ?, ?, ?) ");

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {
			ps.setString(1, profileDTO.getNickname());
			ps.setString(2, profileDTO.getUsername());
			ps.setString(3, profileDTO.getPassword());
			ps.setString(4, profileDTO.getEmail());
			ps.setString(5, profileDTO.getGithub());
			ps.setString(6, profileDTO.getWebsite());
			ps.setLong(7, profileDTO.getAcmicpc_rank());
			ps.setLong(8, profileDTO.getAcmicpc_solved());
			ps.setLong(9, profileDTO.getAcmicpc_rate());
			ps.setString(10, profileDTO.getTech_stacks());
			ps.setString(11, profileDTO.getProject_name());
			ps.setString(12, profileDTO.getAward_name());
			ps.setString(13, profileDTO.getUniversity_name());
			ps.setString(14, profileDTO.getMajor());
			ps.setString(15, profileDTO.getCompany_name());
			ps.setString(16, profileDTO.getJob());
			ps.executeUpdate();
		}
	}
}
