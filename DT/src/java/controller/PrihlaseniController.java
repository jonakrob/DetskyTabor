/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Matej
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HibernateUtil;
import model.UcastNaAkci;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

public class PrihlaseniController extends SimpleFormController {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("seznamAkci.htm"));
		int druhAkce = Integer.parseInt(request.getParameter("druhAkce"));
		int idAkce = Integer.parseInt(request.getParameter("idAkce"));
		HttpSession ses = request.getSession();
		int uzivatelId = 9999;
		if (ses.getAttribute("userLoggedIn") != null) {
			uzivatelId = (Integer) ses.getAttribute("userLoggedIn");
		}
		UcastNaAkci ucast = new UcastNaAkci();
		ucast.setAkceId(idAkce);
		ucast.setDruhAkce(druhAkce);
		ucast.setUzivatelId(uzivatelId);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(ucast);
		session.getTransaction().commit();
		return modelAndView;
	}
}
