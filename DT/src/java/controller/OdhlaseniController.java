package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HibernateUtil;
import model.UcastNaAkci;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

public class OdhlaseniController extends SimpleFormController {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse hsr1) throws Exception {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("seznamAkci.htm"));
		String strDruhAkce = request.getParameter("druhAkce");
		String strIdAkce = request.getParameter("idAkce");
		int druhAkce = Integer.parseInt(strDruhAkce);
		int idAkce = Integer.parseInt(strIdAkce);
		HttpSession httpSession = request.getSession();
		int uzivatelId = 9999;
		if (httpSession.getAttribute("loggedInUserId") != null) {
			uzivatelId = (Integer) httpSession.getAttribute("loggedInUserId");
		}
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.createQuery("delete from UcastNaAkci where akceId = " +
				idAkce + " and uzivatelId = " + uzivatelId +
				" and druhAkce = " + druhAkce).executeUpdate();
		session.getTransaction().commit();
		return modelAndView;
	}
}
