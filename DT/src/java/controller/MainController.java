package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MainController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("main");
		HttpSession httpSession = request.getSession();
		Object loggedInUserId = httpSession.getAttribute("loggedInUserId");
		if (loggedInUserId != null) {
			modelAndView.addObject("loggedInUserId", (Integer) loggedInUserId);
		} else {
			modelAndView.addObject("loggedInUserId", 0);
		}
		return modelAndView;
	}
}
