/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HibernateUtil;
import model.Uzivatel;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

public class RegistraceController extends SimpleFormController {

	public RegistraceController() {
		setCommandClass(Uzivatel.class);
		setCommandName("user");
		setSuccessView("login");
		setFormView("registrace");
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession httpSession = request.getSession();
		int roleId = 0;
		Object roleIdAttribute = httpSession.getAttribute("roleId");
		if (roleIdAttribute != null) {
			roleId = (Integer) roleIdAttribute;
		}
		if (roleId != 1) {
			return new ModelAndView(new RedirectView("main.htm"));
		}
		ModelAndView modelAndView = new ModelAndView("registrace");
		if (httpSession.getAttribute("loggedInUserId") != null) {
			int userId = (Integer) httpSession.getAttribute("loggedInUserId");
			modelAndView.addObject("loggedInUserId", userId);
		} else {
			modelAndView.addObject("loggedInUserId", 0);
		}
		return super.handleRequest(request, response);
	}

	@Override
	protected ModelAndView onSubmit(Object command) throws Exception {
		Uzivatel user = (Uzivatel) command;
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("login.htm"));
	}
}
