package controller;

import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

@SuppressWarnings("deprecation")
public class LogoutController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loggedInUserId", null);
		httpSession.setAttribute("roleId", 0);
		//ModelAndView modelAndView = new ModelAndView(new RedirectView("main.htm"));
		ModelAndView modelAndView = new ModelAndView("main");
		modelAndView.addObject("loggedInUserId", 0);
		modelAndView.addObject("roleId", 0);
		return modelAndView;
	}
}
