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
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import java.util.*;

public class VypisAkceController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest hsr,
			HttpServletResponse hsr1) throws Exception {
		ModelAndView mv = new ModelAndView("vypisAkce");
		//parsuje data z url, prevadi native int
		String strDruhAkce = hsr.getParameter("druhAkce");
		String strIdAkce = hsr.getParameter("idAkce");
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
			mv.addObject("nadpisAkce", nadpisSeznamu);
			mv.addObject("druhAkce", druhAkce);
			mv.addObject("detailyAkce", podrobnostiAkce);
			mv.addObject("prihlaseneUcasti", prihlaseneUcasti);
			mv.addObject("vsichniUzivatele", vsichniUzivatele);
			boolean jeVicedenni;
			if (druhAkce == 1) {
				jeVicedenni = false;
			} else {
				jeVicedenni = true;
			}
			mv.addObject("jeVicedenni", jeVicedenni);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
