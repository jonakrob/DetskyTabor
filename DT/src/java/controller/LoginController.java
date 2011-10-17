/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

/**
 *
 * @author Matej
 */

import org.hibernate.Session;
import org.springframework.web.servlet.mvc.SimpleFormController;
import model.HibernateUtil;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Uzivatel;
import model.Login;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.view.RedirectView;

@SuppressWarnings("deprecation")
public class LoginController extends SimpleFormController {

  
    protected ModelAndView onSubmit(Object command/*, HttpServletRequest hsr*/) throws Exception {
        Login login = (Login) command;
        String username = login.getLogin();
        String heslo = login.getHeslo();

        int userId = 0;
        Uzivatel uzivatel = new Uzivatel();
       // uzivatel.setLogin(username);
        //uzivatel.setHeslo(heslo);

        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            List uzivatele = session.createQuery("from Uzivatel").list();
            //Uzivatel exists = session.get(Uzivatel.class, uzivatel);
            session.getTransaction().commit();
            
            
            for (int i = 0; i < uzivatele.size(); i++) {
                Uzivatel user = (Uzivatel) uzivatele.get(i);
                if(user.getLogin().equals(username) && user.getHeslo().equals(heslo)){
                    userId = user.getId();
                    uzivatel = user;
                    break;
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

      
        if(userId!=0){
           String messageStatus = "Byl/a jste úspěšně přihlášen/a jako "+uzivatel.getJmeno();
           String messageLink = "Můžete pokračovat <a href=\"main.htm\">zde - ></a>";

           HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
           HttpSession hts = request.getSession();
           hts.setAttribute("userLoggedIn", userId);

           ModelAndView modelAndView = new ModelAndView("succesfullLogin");
           modelAndView.addObject("messageStatus", messageStatus);
           modelAndView.addObject("messageLink", messageLink);

         return modelAndView;

        }
        else{
            ModelAndView modelAndView = new ModelAndView(new RedirectView("login.htm"));
            return modelAndView;
        }

        
          
      }

    

    }
