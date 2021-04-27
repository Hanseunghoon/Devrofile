package mvc.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.ProfileDTO;
import mvc.service.ProfileService;
import mvc.service.ProfileServiceImpl;

public class ProfileDetail extends AbstractController {
	ProfileService profileService = ProfileServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		long profile_no = Long.parseLong(request.getParameter("profile_no"));

		try {
			ProfileDTO profileDTO = profileService.getDetail(profile_no);
			return new ModelAndView("/WEB-INF/views/detail.jsp", "profileDTO", profileDTO);
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("/WEB-INF/views/result.jsp");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "list");
			return mav;
		}
	}
}