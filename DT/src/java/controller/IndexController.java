package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.mvc.ParameterizableViewController;

public class IndexController extends ParameterizableViewController {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
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