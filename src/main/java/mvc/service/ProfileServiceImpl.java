package mvc.service;

import java.util.List;

import mvc.models.ProfileDAO;
import mvc.models.ProfileDAOImpl;
import mvc.models.ProfileDTO;

public class ProfileServiceImpl implements ProfileService {
	private static final ProfileService articleService = new ProfileServiceImpl();
	private ProfileDAO profileDAO = ProfileDAOImpl.getInstance();

	private ProfileServiceImpl() {
	}

	public static ProfileService getInstance() {
		return articleService;
	}

	/*-------------------------------
	   프로필 리스트 불러오기 
	-------------------------------*/
	@Override
	public List<ProfileDTO> getProfileList() throws Exception {
		return profileDAO.getProfileList();
	}
}