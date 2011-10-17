/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

/**
 *
 * @author Matej
 */
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HibernateUtil;
//import model.Uzivatel;
//import model.Uzivatel;
import model.UcastNaAkci;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

public class OdhlaseniController extends SimpleFormController {


      @Override
    public ModelAndView handleRequest(HttpServletRequest hsr,
                                      HttpServletResponse hsr1) throws Exception {
        
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


Session session =
HibernateUtil.getSessionFactory().getCurrentSession();
session.beginTransaction();

session.createQuery("delete from UcastNaAkci where akceId = " + idAkce + " and uzivatelId = " + uzivatelId + " and druhAkce = " + druhAkce).executeUpdate();



session.getTransaction().commit();

return mv;

  }

}


