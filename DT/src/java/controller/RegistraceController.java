/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import model.HibernateUtil;
import model.Uzivatel;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

public class RegistraceController extends SimpleFormController {

public RegistraceController() {
    setCommandClass(Uzivatel.class);
    setCommandName("user");
    setSuccessView("login");
    setFormView("registrace");
}

@Override
protected ModelAndView onSubmit(Object command) throws Exception {
    Uzivatel user = (Uzivatel) command;
    try {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return new ModelAndView(new RedirectView("login.htm"));
    }
}
