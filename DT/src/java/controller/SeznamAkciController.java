/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

/**
 *
 * @author Matej
 */
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.JednodenniAkce;
import model.UcastNaAkci;
import model.VicedenniAkce;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class SeznamAkciController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr,
                                      HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("seznamAkci");

        HttpSession ses = hsr.getSession();
            int uzivatelId = 9999;
            if(ses.getAttribute("userLoggedIn")!=null){
                uzivatelId = (Integer) ses.getAttribute("userLoggedIn");
            }

        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            List jednodenniVsechny = session.createQuery("from JednodenniAkce").list();
            List vicedenniVsechny = session.createQuery("from VicedenniAkce").list();
            List jednodenniUcast = session.createQuery("from UcastNaAkci where druhAkce = 1 and uzivatelId = "+uzivatelId).list();
            List vicedenniUcast = session.createQuery("from UcastNaAkci where druhAkce = 2 and uzivatelId = "+uzivatelId).list();
         
            
          


            for (int i = 0; i < jednodenniVsechny.size(); i++) {
                JednodenniAkce akce = (JednodenniAkce) jednodenniVsechny.get(i);
                if(akce.getCena()==42){
                    akce.setCena(4200);
                }
                for (int j = 0; j < jednodenniUcast.size(); j++) {
                    UcastNaAkci ucast = (UcastNaAkci) jednodenniUcast.get(j);
                    if(ucast.getAkceId() == akce.getId()){
                        akce.setCena(42);
                        break;
                    }
                }
            }
            for (int i = 0; i < vicedenniVsechny.size(); i++) {
                VicedenniAkce akce = (VicedenniAkce) vicedenniVsechny.get(i);
                if(akce.getCena()==42){
                    akce.setCena(4200);
                }
                for (int j = 0; j < vicedenniUcast.size(); j++) {
                    UcastNaAkci ucast = (UcastNaAkci) vicedenniUcast.get(j);
                    if(ucast.getAkceId() == akce.getId()){
                        akce.setCena(42);
                        break;
                    }
                }
            }

            mv.addObject("jednodenni", jednodenniVsechny);
            
            mv.addObject("vicedenni", vicedenniVsechny);
            
            //session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //mv.addObject("message", out);
        return mv;
    }
}
