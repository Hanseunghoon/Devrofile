package mvc.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.ProfileDTO;
import mvc.service.ProfileService;
import mvc.service.ProfileServiceImpl;

public class ProfileDeleteAction extends AbstractController {
	ProfileService profileService = ProfileServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		long profile_no = Long.parseLong(request.getParameter("profile_no"));
		String password = request.getParameter("password");

		ProfileDTO profileDTO = new ProfileDTO();
		profileDTO.setProfile_no(profile_no);
		profileDTO.setPassword(password);
		ModelAndView mav = new ModelAndView();

		try {
			profileService.deleteProfile(profileDTO);
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "게시물이 삭제되었습니다. ");
			mav.addObject("url", "list");

		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}
}
