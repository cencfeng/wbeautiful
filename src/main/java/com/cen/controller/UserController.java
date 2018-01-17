package com.cen.controller;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.cen.entity.*;
import com.cen.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	@RequestMapping("/login")
	public String login(User user,Model mv,HttpServletResponse resp) throws IOException {
		if(userService.getUser(user) != null) {
			return "indexcontext";
		}
		return "failed";
	}
	@RequestMapping("/isexit")
	@ResponseBody
	public UserDetail exitUser(String username,String name) {
		UserDetail userDetail = userService.exitUser(username, name);
		
		return userDetail;
	}
	@RequestMapping(value = "{pageName1}")  
    public ModelAndView toPage(@PathVariable("pageName1") String pageName1) {  
        ModelAndView mv = new ModelAndView(pageName1);  
        return mv;  
    }  
	@RequestMapping("/accountApply")
	public String accountApply(UserDetail userDetail) {	
		userService.applyAccount(userDetail);
		return "sss";
	}
}
