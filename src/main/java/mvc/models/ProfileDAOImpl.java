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
	public List<ProfileDTO> getProfileList(long page) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select profile_no, username, nickname, regdate, likes ");
		sql.append("from t_profile ");
		sql.append("order by profile_no desc ");
		sql.append("offset 8 * ? rows fetch first 8 rows only ");

		List<ProfileDTO> list = new ArrayList<>();

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {

			ps.setLong(1, page);
			System.out.println("page : " + page);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					ProfileDTO articleDTO = new ProfileDTO();
					articleDTO.setProfile_no(rs.getLong("profile_no"));
					articleDTO.setUsername(rs.getString("username"));
					articleDTO.setNickname(rs.getString("nickname"));
					articleDTO.setRegdate(rs.getDate("regdate"));
					articleDTO.setLikes(rs.getLong("likes"));
					list.add(articleDTO);
				}
			}
		}
		return list;
	}

	public long getListSize() throws SQLException {

		long total = 0;
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) as total from t_profile ");

		List<ProfileDTO> list = new ArrayList<>();

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next())
					total = rs.getLong("total");
			}
		}
		return total;
	}

	/*-------------------------------
	     프로필 작성 후 등록하기 
	-------------------------------*/
	@Override
	public void insertProfile(ProfileDTO profileDTO) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append(
				"INSERT INTO t_profile(profile_no, nickname, username, password, email, likes, regdate, github, website, acmicpc_rank, acmicpc_solved, acmicpc_rate, tech_stacks, project_name, award_name, university_name, major, company_name, job) ");
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

	/*-------------------------------
			 프로필 상세보기 
	-------------------------------*/
	@Override
	public ProfileDTO getDetail(long profile_no) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append(
				"select nickname, username, email, likes, regdate, github, website, acmicpc_rank, acmicpc_solved, acmicpc_rate, tech_stacks, project_name, award_name, university_name, major, company_name, job ");
		sql.append("from   t_profile ");
		sql.append("where  profile_no=? ");

		ProfileDTO profileDTO = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {

			ps.setLong(1, profile_no);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					profileDTO = new ProfileDTO();
					profileDTO.setProfile_no(profile_no);
					profileDTO.setNickname(rs.getString("nickname"));
					profileDTO.setUsername(rs.getString("username"));
					profileDTO.setEmail(rs.getString("email"));
					profileDTO.setGithub(rs.getString("github"));
					profileDTO.setWebsite(rs.getString("website"));
					profileDTO.setLikes(rs.getLong("likes"));
					profileDTO.setAcmicpc_rank(rs.getLong("acmicpc_rank"));
					profileDTO.setAcmicpc_solved(rs.getLong("acmicpc_solved"));
					profileDTO.setAcmicpc_rate(rs.getLong("acmicpc_rate"));
					profileDTO.setTech_stacks(rs.getString("tech_stacks"));
					profileDTO.setProject_name(rs.getString("project_name"));
					profileDTO.setAward_name(rs.getString("award_name"));
					profileDTO.setUniversity_name(rs.getString("university_name"));
					profileDTO.setMajor(rs.getString("major"));
					profileDTO.setCompany_name(rs.getString("company_name"));
					profileDTO.setJob(rs.getString("job"));
				}
			}
		}
		return profileDTO;
	}

	@Override
	public void updateReadcount(long no) throws SQLException {

	}

	/*-------------------------------
	 		프로필 삭제하기
	-------------------------------*/
	@Override
	public ProfileDTO getDelete(long no) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select profile_no, password ");
		sql.append("from t_profile              ");
		sql.append("where profile_no=?          ");
		ProfileDTO profileDTO = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {
			ps.setLong(1, no);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					profileDTO = new ProfileDTO();
					profileDTO.setProfile_no(rs.getLong("profile_no"));
					profileDTO.setPassword(rs.getString("password"));
				}
			}
		}
		return profileDTO;
	}

	@Override
	public int deleteProfile(ProfileDTO profileDTO) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("delete from t_profile ");
		sql.append("where profile_no=?    ");
		sql.append("and password=?        ");

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {
			ps.setLong(1, profileDTO.getProfile_no());
			ps.setString(2, profileDTO.getPassword());
			return ps.executeUpdate();
		}
	}

	/*------------------------------
			프로필 수정하기
	------------------------------*/
	@Override
	public int updateProfile(ProfileDTO profileDTO) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE t_profile SET ");
		sql.append("       nickname=?     ");
		sql.append("      ,username=?      ");
		sql.append("      ,password=?   ");
		sql.append("      ,email=?      ");
		sql.append("      ,github=?   ");
		sql.append("      ,website=?      ");
		sql.append("      ,acmicpc_rank=?   ");
		sql.append("      ,acmicpc_solved=?      ");
		sql.append("      ,acmicpc_rate=?   ");
		sql.append("      ,tech_stacks=?      ");
		sql.append("      ,project_name=?   ");
		sql.append("      ,award_name=?      ");
		sql.append("      ,university_name=?   ");
		sql.append("      ,major=?      ");
		sql.append("      ,company_name=?   ");
		sql.append("      ,job=?   ");
		sql.append("WHERE  profile_no=? AND password=? ");

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
			ps.setLong(17, profileDTO.getProfile_no());
			ps.setString(18, profileDTO.getPassword());
			return ps.executeUpdate();
		}
	}

	// 좋아요 업데이트
	public int update_Like(long profile_no) throws SQLException {

		String sql = "update t_profile set likes=likes+1 where profile_no=?";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {
			ps.setLong(1, profile_no);
			return ps.executeUpdate();
		}
	}

	// 좋아요 개수 찾기
	public long select_Like(long profile_no) throws SQLException {

		String sql = "select likes from t_profile where profile_no=?";
		int likes = 0;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {

			ps.setLong(1, profile_no);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				likes = rs.getInt("likes");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return likes;
	}

}
