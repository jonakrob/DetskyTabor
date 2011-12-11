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
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import java.util.*;
import javax.servlet.http.HttpSession;

public class VypisAkceController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView ModelAndView = new ModelAndView("vypisAkce");
		//parsuje data z url, prevadi native int
		String strDruhAkce = request.getParameter("druhAkce");
		String strIdAkce = request.getParameter("idAkce");
		int druhAkce = Integer.parseInt(strDruhAkce);
		int idAkce = Integer.parseInt(strIdAkce);
		String nazevTabulky = "";
		String nadpisSeznamu = "";
		// podle typu akce vybere nadpisy a vhodny databazovy tabulky
		switch (druhAkce) {
			case 1:
				nazevTabulky = "JednodenniAkce";
				break;
			case 2:
				nazevTabulky = "VicedenniAkce";
				break;
		}
		switch (druhAkce) {
			case 1:
				nadpisSeznamu = "jednodenní akce";
				break;
			case 2:
				nadpisSeznamu = "vicedenní akce";
				break;
		}
		//vybere data z databaze a pripravi je k odeslani do databaze
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			List podrobnostiAkce = session.createQuery("from " + nazevTabulky + " where id = " + idAkce).list();
			List prihlaseneUcasti = session.createQuery("from UcastNaAkci where akceId = " + idAkce + " and druhAkce = " + druhAkce).list();
			List vsichniUzivatele = session.createQuery("from Uzivatel").list();
			//mv.addObject("users", result);
			session.getTransaction().commit();
			ModelAndView.addObject("nadpisAkce", nadpisSeznamu);
			ModelAndView.addObject("druhAkce", druhAkce);
			ModelAndView.addObject("detailyAkce", podrobnostiAkce);
			ModelAndView.addObject("prihlaseneUcasti", prihlaseneUcasti);
			ModelAndView.addObject("vsichniUzivatele", vsichniUzivatele);
			boolean jeVicedenni;
			if (druhAkce == 1) {
				jeVicedenni = false;
			} else {
				jeVicedenni = true;
			}
			ModelAndView.addObject("jeVicedenni", jeVicedenni);
		} catch (Exception e) {
			e.printStackTrace();
		}
                HttpSession session = request.getSession();
		if (session.getAttribute("userLoggedIn") != null) {
			ModelAndView.addObject("userLoggedIn", true);
		} else {
			ModelAndView.addObject("userLoggedIn", false);
		}
		return ModelAndView;
	}
}
