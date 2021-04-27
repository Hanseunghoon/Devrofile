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

	/*-------------------------------
	   프로필 작성 후 등록하기 
	-------------------------------*/
	@Override
	public void insertProfile(ProfileDTO profileDTO) throws Exception {
		profileDAO.insertProfile(profileDTO);
	}
	
	/*----------------------------------
	   프로필 상세 보기 및 조회수 증가
	----------------------------------*/
	@Override
	public ProfileDTO getDetail(long no) throws Exception {
		return getDetail(no, true);
	}

	@Override
	public ProfileDTO getDetail(long no, boolean updateReadcount) throws Exception {
		try {
			if (updateReadcount)
				profileDAO.updateReadcount(no);

			ProfileDTO articleDTO = profileDAO.getDetail(no);
			if (articleDTO == null) {
				throw new RuntimeException("상세보기 실패");
			}
			return articleDTO;
		} finally {
		}
	}
}