package mvc.service;

import java.util.List;
import mvc.models.ProfileDTO;

public interface ProfileService {

	List<ProfileDTO> getProfileList(long page) throws Exception;
	
	long getListSize() throws Exception;
	
	void insertProfile(ProfileDTO profileDTO) throws Exception;

	ProfileDTO getDetail(long no) throws Exception;
	
	ProfileDTO getDetail(long no,  boolean updateReadcount) throws Exception;

	void updateProfile(ProfileDTO profileDTO) throws Exception;

	ProfileDTO getDelete(long no) throws Exception;

	void deleteProfile(ProfileDTO profileDTO) throws Exception;
	
	void update_Like(long profile_no) throws Exception;
	
	long select_Like(long profile_no) throws Exception;
}
