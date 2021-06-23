
package com.tekskills.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.tekskills.DTO.LoginDTO;
import com.tekskills.DTO.SecurityBean;
import com.tekskills.DTO.UserInfoDto;
import com.tekskills.DTO.mailBean;
import com.tekskills.Service.MaaService;

@RestController
@PropertySource("/WEB-INF/Mail.properties")
public class MaaRestController {
	@Autowired
	private MaaService maaService;

	private static final Logger logger = Logger.getLogger(MaaRestController.class);

	@RequestMapping(value = { "/LoginValidations" }, method = RequestMethod.POST)
	public LoginDTO loginvalidate(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
	//	HttpSession session = req.getSession(true);
		
		LoginDTO loginDto=new LoginDTO();
		
		String username = req.getParameter("email").trim();
		String password = req.getParameter("password").trim();
		String role = req.getParameter("role");
		
		System.out.println(username+"*****"+password+"*******"+role);
		try {
			SecurityBean sbean = maaService.getAllSecuredPwd();
			if (sbean != null) {

				mailBean.setMail_User(sbean.getName());
				mailBean.setMail_password(Jsecurity.decipher(sbean.getPwd()));
			}

			UserInfoDto userInfo = maaService.validateUser(username, password, role);

			if (userInfo != null) {
				if (userInfo.getStatus() != 0) {
					

					/*session.setAttribute("userid", userInfo.getUserid());
					session.setAttribute("roleid", userInfo.getRoleid());
					session.setAttribute("username", userInfo.getEmail());

					model.addAttribute("userid", userInfo.getUserid());
					model.addAttribute("roleid", userInfo.getRoleid());
					*/
					loginDto.setRoleid(userInfo.getRoleid());
					loginDto.setUserid(userInfo.getUserid());
					loginDto.setUsername(userInfo.getEmail());

					if (userInfo.getRoleid() > 1 && userInfo.getRoleid() <= 4) {
						//return "redirect:/PropertyEntrance";
					} else if (userInfo.getRoleid() == 1) {
						//return "redirect:/MasterDashboard";
					} else {
						String message = "Invalid Credentials..Please check role";
						loginDto.setMessage(message);
						model.addAttribute("message", new Gson().toJson(message));
						//return "loginpage";

					}
				}

				else {
					String message = "Your cant login till property activated by admin";
					loginDto.setMessage(message);
					//model.addAttribute("message", new Gson().toJson(message));
					//return "loginpage";

				}

			} else {
				String message = "Invalid Credentials";
				loginDto.setMessage(message);
				//model.addAttribute("message", new Gson().toJson(message));
				// model.addAttribute("message", message);
				//return "loginpage";

			}
		} catch (Exception e) {
			logger.error("Ecxception occured while login---" + e);
			String message = "Database Exception Occured!!";
			loginDto.setMessage(message);
		//	model.addAttribute("message", new Gson().toJson(message));
			// model.addAttribute("message", message);

		}
		return loginDto;

	}
}
