package com.hotelreservation.controller;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.hotelreservation.dataobject.User;
import com.hotelreservation.service.SecurityService;
import com.hotelreservation.service.UserService;
import com.hotelreservation.validator.UserValidator;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private UserValidator userValidator;
    
    @Autowired
    private SecurityService securityService;
    
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.saveUser(userForm);

        securityService.autoLogin(userForm.getUserName(), userForm.getPassword());

        return "redirect:/welcome";
    }

    @GetMapping({"/","/login"})
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "loginpage";
    }
    
    @GetMapping("/welcome")
    public String welcome(Model model,Authentication auth) {
    Set<String> roles = auth.getAuthorities().stream()
    		     .map(r -> r.getAuthority()).collect(Collectors.toSet());
    if(roles.contains("ADMIN")) {
    	return "adminpage";
    }

        return "welcome";
    }

}
