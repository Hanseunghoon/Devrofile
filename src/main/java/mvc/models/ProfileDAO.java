package mvc.models;

import java.sql.SQLException;
import java.util.List;

public interface ProfileDAO {
	
	List<ProfileDTO> getProfileList(long page) throws SQLException;
	
	long getListSize() throws SQLException;

	void insertProfile(ProfileDTO profileDTO) throws SQLException;

	void updateReadcount(long no) throws SQLException;

	ProfileDTO getDetail(long no) throws SQLException;

	int updateProfile(ProfileDTO profileDTO) throws SQLException;

	ProfileDTO getDelete(long no) throws SQLException;

	int deleteProfile(ProfileDTO profileDTO) throws SQLException;
	
	int update_Like(long profile_no) throws SQLException;
	
	long select_Like(long profile_no) throws SQLException;
}