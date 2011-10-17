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
//import model.Uzivatel;
import model.UcastNaAkci;
//import model.Uzivatel;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

public class PrihlaseniController extends SimpleFormController {


      @Override
    public ModelAndView handleRequest(HttpServletRequest hsr,
                                      HttpServletResponse hsr1) throws Exception {
        //ModelAndView mv = new ModelAndView("seznamAkci");
        //ModelAndView mv = new ModelAndView("seznamAkci.htm");
           ModelAndView mv = new ModelAndView(new RedirectView("seznamAkci.htm"));

            String strDruhAkce = hsr.getParameter("druhAkce");
            String strIdAkce = hsr.getParameter("idAkce");
            int druhAkce = Integer.parseInt(strDruhAkce);
            int idAkce = Integer.parseInt(strIdAkce);
            HttpSession ses = hsr.getSession();
            int uzivatelId = 9999;
            if(ses.getAttribute("userLoggedIn")!=null){
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

            return mv;
  }

}


