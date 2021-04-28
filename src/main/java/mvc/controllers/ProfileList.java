package mvc.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.ProfileDTO;
import mvc.service.ProfileService;
import mvc.service.ProfileServiceImpl;

public class ProfileList extends AbstractController {
	
	private ProfileService profileService = ProfileServiceImpl.getInstance();	
	long endPage = 0;
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {

		long page = 1;
		
		try{
			page = Long.parseLong(request.getParameter("page"));
		}
		catch (Exception e){
		}
		
		ModelAndView mav = new ModelAndView();		
		try {
			List<ProfileDTO> list = profileService.getProfileList(page);
			long total = profileService.getListSize();
			
			if(total % 10 == 0)
				endPage = (total / 10);
			else
				endPage = (total / 10) + 1;
			
			for (ProfileDTO dto : list) {
				System.out.println(dto);
				break;
			}
			
			mav.setViewName("/WEB-INF/views/list.jsp");
			mav.addObject("list", list);
			mav.addObject("page", page);
			mav.addObject("total", total);
			mav.addObject("endPage", endPage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}