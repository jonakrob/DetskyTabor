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

public class MainController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr,
                                      HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("main");

        HttpSession ses = hsr.getSession();
        if(ses.getAttribute("userLoggedIn")!=null){
            mv.addObject("userLoggedIn", true);
        }
        else{
            mv.addObject("userLoggedIn", false);
        }

        return mv;
    }
}

