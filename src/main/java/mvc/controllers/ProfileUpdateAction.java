package mvc.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.ProfileDTO;
import mvc.service.ProfileService;
import mvc.service.ProfileServiceImpl;

public class ProfileUpdateAction extends AbstractController {

	ProfileService profileService = ProfileServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		long profile_no = Long.parseLong(request.getParameter("profile_no"));
		String nickname = request.getParameter("nickname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String github = request.getParameter("github");
		String website = request.getParameter("website");
		long acmicpc_rank = Long.parseLong(request.getParameter("acmicpc_rank"));
		long acmicpc_solved = Long.parseLong(request.getParameter("acmicpc_solved"));
		long acmicpc_rate = Long.parseLong(request.getParameter("acmicpc_rate"));
		String tech_stacks = request.getParameter("tech_stacks");
		String project_name = request.getParameter("project_name");
		String award_name = request.getParameter("award_name");
		String university_name = request.getParameter("university_name");
		String major = request.getParameter("major");
		String company_name = request.getParameter("company_name");
		String job = request.getParameter("job");

		ProfileDTO profileDTO = new ProfileDTO();
		profileDTO.setProfile_no(profile_no);
		profileDTO.setNickname(nickname);
		profileDTO.setUsername(username);
		profileDTO.setPassword(password);
		profileDTO.setEmail(email);
		profileDTO.setGithub(github);
		profileDTO.setWebsite(website);
		profileDTO.setAcmicpc_rank(acmicpc_rank);
		profileDTO.setAcmicpc_solved(acmicpc_solved);
		profileDTO.setAcmicpc_rate(acmicpc_rate);
		profileDTO.setTech_stacks(tech_stacks);
		profileDTO.setProject_name(project_name);
		profileDTO.setAward_name(award_name);
		profileDTO.setUniversity_name(university_name);
		profileDTO.setMajor(major);
		profileDTO.setCompany_name(company_name);
		profileDTO.setJob(job);

		ModelAndView mav = new ModelAndView();
		try {
			profileService.updateProfile(profileDTO);
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "게시물이 수정되었습니다.");
			mav.addObject("url", "detail?profile_no=" + profileDTO.getProfile_no());
		} catch (Exception e) {
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}
}