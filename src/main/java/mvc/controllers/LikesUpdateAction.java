package mvc.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.service.ProfileService;
import mvc.service.ProfileServiceImpl;

public class LikesUpdateAction extends AbstractController {

	ProfileService profileService = ProfileServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		long profile_no = Long.parseLong(request.getParameter("profile_no"));

		ModelAndView mav = new ModelAndView();
		try {
			profileService.update_Like(profile_no);
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", profile_no + "번째 프로필을 좋아합니다!");
			mav.addObject("url", "detail?profile_no=" + profile_no);
		} catch (Exception e) {
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}
}