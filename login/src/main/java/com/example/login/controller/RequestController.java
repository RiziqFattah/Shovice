package com.example.login.controller;

/*import java.util.Date;*/

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


/*import com.example.login.model.Notes;*/
import com.example.login.model.Request;
import com.example.login.model.User;
import com.example.login.repositories.RequestRepository;
import com.example.login.services.CustomUserDetailsService;

@Controller
public class RequestController {
	@Autowired
    private CustomUserDetailsService userService;
    
    @Autowired
    private RequestRepository requestRepository;
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView notes() {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject("request", requestRepository.findAll());
        modelAndView.addObject("currentUser", user);
        modelAndView.addObject("fullName", "Welcome " + user.getFullname());
        modelAndView.addObject("adminMessage", "Content Available Only for Users with Admin Role");
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/index/create")
    public ModelAndView create() {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject("currentUser", user);
        modelAndView.addObject("fullName", "Welcome " + user.getFullname());
        modelAndView.addObject("adminMessage", "Content Available Only for Users with Admin Role");
        modelAndView.setViewName("create");
        return modelAndView;
    }

//    @RequestMapping("/index/save")
//    public String save(@RequestParam String req_name, @RequestParam String scope, @RequestParam String type, 
//    		@RequestParam String price, @RequestParam String location, @RequestParam String description) {
//		
//        Request request = new Request();
//        request.setReq_name(req_name);
//        request.setScope(scope);
//        request.setType(type);
//        request.setPrice(price);
//        request.setLocation(location);
//        request.setDescription(description);
//        requestRepository.save(request);
//
//        return "redirect:/index/show/" + request.getId();
//    }
    
    
    
    @RequestMapping("/index/save")
    public String save(@ModelAttribute Request request) {
		
    		Request newrequest = new Request();
       
        newrequest.setReq_name(request.getReq_name());
        newrequest.setScope(request.getScope());
        newrequest.setType(request.getType());
        newrequest.setPrice(request.getPrice());
        newrequest.setLocation(request.getLocation());
        newrequest.setDescription(request.getDescription());
        requestRepository.save(request);

        return "redirect:/index/show/" + request.getId();
    }

    @RequestMapping("/index/show/{id}")
    public ModelAndView show(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject("currentUser", user);
        modelAndView.addObject("fullName", "Welcome " + user.getFullname());
        modelAndView.addObject("adminMessage", "Content Available Only for Users with Admin Role");
        modelAndView.addObject("request", requestRepository.findById(id).orElse(null));
        modelAndView.setViewName("show");
        return modelAndView;
    }

    @RequestMapping("/index/delete")
    public String delete(@RequestParam Long id) {
		
        Request request = requestRepository.findById(id).orElse(null);
        requestRepository.delete(request);

        return "redirect:/index";
    }

    @RequestMapping("/index/edit/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject("currentUser", user);
        modelAndView.addObject("fullName", "Welcome " + user.getFullname());
        modelAndView.addObject("adminMessage", "Content Available Only for Users with Admin Role");
        modelAndView.addObject("request", requestRepository.findById(id).orElse(null));
        modelAndView.setViewName("edit");
        return modelAndView;
    }


    @RequestMapping("/index/update")
    public String update(@RequestParam Long id, @RequestParam String req_name, @RequestParam String scope, @RequestParam String type,
    		@RequestParam String price, @RequestParam String location, @RequestParam String description) {
        Request request = requestRepository.findById(id).orElse(null);
		
        request.setReq_name(req_name);
        request.setScope(scope);
        request.setType(type);
        request.setPrice(price);
        request.setLocation(location);
        request.setDescription(description);
        requestRepository.save(request);
        return "redirect:/index/show/" + request.getId();
    }
}
