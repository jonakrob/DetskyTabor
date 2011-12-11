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
import model.HibernateUtil;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

public class UserController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest hsr,
			HttpServletResponse hsr1) throws Exception {
		HttpSession httpSession = hsr.getSession();
		int roleId = 0;
		Object attributeRoleId = httpSession.getAttribute("roleId");
		if (attributeRoleId != null) {
			roleId = (Integer) attributeRoleId;
		}
		if (roleId != 1) {
			return new ModelAndView(new RedirectView("main.htm"));
		}
		ModelAndView mv = new ModelAndView("user");
		String out = "Výpis uživatelů: ";
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			List result = session.createQuery("from Uzivatel").list();
			//List role = session.createQuery("from Role").list();
			mv.addObject("users", result);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("message", out);
		HttpSession hsn = hsr.getSession();
		if (hsn.getAttribute("userLoggedIn") != null) {
			int userId = (Integer) hsn.getAttribute("userLoggedIn");
			mv.addObject("userId", userId);
		}
		//NumberContainer ai = new NumberContainer(1);
		//hsn.setAttribute("idAkce", ai);
		//NumberContainer da = new NumberContainer(2);
		//hsn.setAttribute("druhAkce", da);
		return mv;
	}
}
