package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MainController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse hsr1) throws Exception {
		ModelAndView modelAndView = new ModelAndView("main");
		HttpSession session = request.getSession();
		if (session.getAttribute("userLoggedIn") != null) {
			modelAndView.addObject("userLoggedIn", true);
		} else {
			modelAndView.addObject("userLoggedIn", false);
		}
		return modelAndView;
	}
}
