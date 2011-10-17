package controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import model.Uzivatel;


/**
 *
 * @author Don HUS
 */
public class RegistraceValidator implements Validator {


	public boolean supports(Class aClass) {
		return Uzivatel.class.equals(aClass);
	}

	public void validate(Object obj, Errors errors) {
		Uzivatel user = (Uzivatel) obj;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "jmeno", "field.required", "Jméno musí být vyplněno!");

                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "field.required", "Přihlašovací jméno musí být vyplněno!");

                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "heslo", "field.required", "Heslo musí být vyplněno!");

                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "field.required", "E-mail musí být vyplněn!");
                if ( ! errors.hasFieldErrors("email")) {
                    if (user.getEmail().matches("^.+@.+\\.[a-z]{2,4}$") == false) {
                        errors.rejectValue("email", "spatny_tvar", "Špatný tvar e-mailu.");
                    }
                }

                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telefon", "field.required", "Telefon musí být vyplněn!");
                if ( ! errors.hasFieldErrors("telefon")) {
                    if (Integer.toString(user.getTelefon() ).matches("[0-9]{9}") == false) {
                        errors.rejectValue("telefon", "spatny_tvar", "Špatný tvar telefonního čísla.");
                    }
                }

//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "field.required", "Required field");
//		if ( ! errors.hasFieldErrors("price")) {
//			if (car.getPrice().intValue() == 0)
//				errors.rejectValue("price", "not_zero", "Can't be free!");
//		}
	}



}
