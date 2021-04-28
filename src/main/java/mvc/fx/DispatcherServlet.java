package mvc.fx;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/profile/*" }, loadOnStartup = 10)
public class DispatcherServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, AbstractController> controllerMap = new HashMap<String, AbstractController>();
	private ViewResolver viewResolver;

	@Override
	public void init() throws ServletException {

		Properties prop = new Properties();

		try {
			prop.load(new FileInputStream(this.getClass().getResource("dispatcher-sevlet.properties").getPath()));
			for (Object oKey : prop.keySet()) {
				String key = (String) oKey;
				Class className = Class.forName(prop.getProperty(key));
				controllerMap.put(key, (AbstractController) className.getConstructor().newInstance());
			}

			System.out.println(controllerMap.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewResolver = new ViewResolver();
		viewResolver.setPrefix("./");
		viewResolver.setSuffix("");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String action = uri.substring(contextPath.length());
		ModelAndView mv;
		AbstractController controller = controllerMap.get(action);

		mv = controller.handleRequestInternal(req, res);
		Map<String, Object> model = mv.getModel();
		Set<String> keySet = model.keySet();
		String viewName = mv.getViewName();

		if (viewName.startsWith("redirect:")) {
			res.sendRedirect(viewName.substring(9));
		} else {
			for (String key : keySet) {
				req.setAttribute(key, model.get(key));
			}
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewName);
			dispatcher.forward(req, res);
		}
		
//		process(req, res);
	}

//	protected void process(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String uri = request.getRequestURI();
//		String path = uri.substring(uri.lastIndexOf("/"));
//
//		AbstractController controller = controllerMap.get(path);
//
//		ModelAndView mv = controller.handleRequestInternal(request, response);
//		String viewName = mv.getViewName();
//
//		String view = null;
//
//		if (!viewName.contains(".do")) {
//			view = viewResolver.getView(viewName);
//		} else {
//			view = viewName;
//		}
//	}
}