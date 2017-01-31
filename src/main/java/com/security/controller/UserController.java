package com.security.controller;


import com.security.AuthorizedUser;
import com.security.model.User;
import com.security.service.SecurityService;
import com.security.service.UserService;
import com.security.validator.UserValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Yuriy on 10.12.2016.
 */


@Controller
public class UserController {

    public static Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private AuthorizedUser authorizedUser;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {

        return "index";
    }

    /*@RequestMapping(value = {"/profile","/profile/**"}, method = RequestMethod.GET)
    public String profile(Model model){

        if(authorizedUser.getUserByUsername() != null) {
            User user = authorizedUser.getUserByUsername();
            model.addAttribute("user",user);
        }
        return "profile";
    }*/


    //возвращает профиль пользователя по его имени или 404 если он не найден
    @RequestMapping(value = {"/profile/{name}/**"}, method = RequestMethod.GET)
    public ModelAndView profile(@PathVariable("name") String name){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("profile");

        User user = userService.findByUsername(name);

        if (user != null) {
            modelAndView.getModel().put("user", user);
            return modelAndView;
        }
        else {
            modelAndView.setViewName("404");
            modelAndView.getModel().put("user", name);
        }

        return modelAndView;
    }

    @RequestMapping(value = {"/profile"}, method = RequestMethod.GET)
    public String profile(Model model){

        if(authorizedUser.getUserByUsername() != null){
            model.addAttribute("user",authorizedUser.getUserByUsername());
            return "my";
        }

        return "404";
    }


    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model){

        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        logger.debug("New user "+ userForm.getUsername() + " register now.");

        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {


        if(authorizedUser.getUserByUsername() != null){
            User user = authorizedUser.getUserByUsername();

            model.addAttribute("user",user);
            System.err.println("Отработал контроллер /welcome  Name: " + user.getUsername() + " Email: " + user.getEmail() + " Password: "+user.getPassword());
        }


        return "welcome";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        logger.debug("User "+auth.getName()+ " visit admin page.");

        return "admin";
    }



}
