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
	public List<ProfileDTO> getProfileList(long page) throws Exception {
		return profileDAO.getProfileList(page);
	}
	
	public long getListSize() throws Exception {
		return profileDAO.getListSize();
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

			ProfileDTO profileDTO = profileDAO.getDetail(no);
			if (profileDTO == null) {
				throw new RuntimeException("상세보기 실패");
			}
			return profileDTO;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*----------------------------
	   	    프로필 삭제하기
	-----------------------------*/
	@Override
	public void deleteProfile(ProfileDTO profileDTO) throws Exception {
		if (profileDAO.deleteProfile(profileDTO) != 1) {
			throw new RuntimeException("글이 없거나 비밀번호가 틀립니다.");
		}
	}

	@Override
	public ProfileDTO getDelete(long profile_no) throws Exception {
		try {
			ProfileDTO profileDTO = profileDAO.getDelete(profile_no);
			if (profileDTO == null) {
				throw new RuntimeException("글 삭제를 위한 폼 읽어오기 실패");
			}
			return profileDTO;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*----------------------------
	    	프로필 수정하기
	-----------------------------*/
	@Override
	public void updateProfile(ProfileDTO profileDTO) throws Exception {
		if (profileDAO.updateProfile(profileDTO) == 0) {
			throw new RuntimeException("글이 없거나 비밀번호가 틀립니다.");
		}
	}
}