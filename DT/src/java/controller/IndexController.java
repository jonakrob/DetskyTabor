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
			HttpServletResponse hsr1) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("userLoggedIn") != null) {
			modelAndView.addObject("userLoggedIn", true);
		} else {
			modelAndView.addObject("userLoggedIn", false);
		}
		return modelAndView;
	}
}