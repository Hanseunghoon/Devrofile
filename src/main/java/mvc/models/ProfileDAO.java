package mvc.models;

import java.sql.SQLException;
import java.util.List;

public interface ProfileDAO {
	
	List<ProfileDTO> getProfileList() throws SQLException;

	void insertProfile(ProfileDTO profileDTO) throws SQLException;

	void updateReadcount(long no) throws SQLException;

	ProfileDTO getDetail(long no) throws SQLException;

//	int updateProfile(ProfileDTO profileDTO) throws SQLException;
//
	ProfileDTO getDelete(long no) throws SQLException;

	int deleteProfile(ProfileDTO profileDTO) throws SQLException;
}