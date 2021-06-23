package com.tekskills.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.tekskills.DTO.ClassifedDTO;
import com.tekskills.DTO.ClassifiedDTO;
import com.tekskills.DTO.ClassifiedInformationView;
import com.tekskills.Service.MiscellaneousService;
import com.tekskills.Service.OwnerService;
import com.tekskills.entity.BlogEntity;
import com.tekskills.entity.ClassifiedHouseHunting;
import com.tekskills.entity.ClassifiedImages;

@Controller
public class UserdefinedController {
	private static final Logger logger = Logger.getLogger(UserdefinedController.class);

	@Autowired
	private OwnerService ownerService;
	@Autowired
	private MiscellaneousService misService;
	
	@RequestMapping(value = { "/forgotPassword" }, method = RequestMethod.POST)
	@ResponseBody
	String forgotPassword(HttpServletRequest request, HttpServletResponse response) {
		String password = null;
		try {
			String mail = request.getParameter("mail");
			String prtyname= request.getParameter("prtyname");
			 password=ownerService.getPasswordByMail(mail,prtyname);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return password;
		
	}
	
	@RequestMapping(value = { "/displayPassowdPage" }, method = RequestMethod.GET)
	public String forgotPasswordPage() {
		return "forgotpassword";
	}
	
	
	
	@RequestMapping(value = { "/saveClassifiedSale" }, method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public int saveClassifiedSale(HttpServletRequest request, HttpServletResponse response,@RequestBody ClassifiedDTO classifiedObj) {
		int id=0;
		try {
			id=misService.saveClassifiedOthers(classifiedObj);
			
				
		}catch(Exception e) {
			logger.error("Exception in saveClassifiedSale--"+e.getMessage());
		}
		return id;
	}
	
	@RequestMapping(value = { "/saveHHClassified" }, method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public String saveHHClassified(HttpServletRequest request, HttpServletResponse response,@RequestBody ClassifiedHouseHunting classifiedObj) {
		String message=null;
		try {
			
			message=misService.saveClassified(classifiedObj);
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return message;
	}
	
	
	

	@RequestMapping(value = { "/updateClassifiedRent" }, method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public String updateClassifiedRent(HttpServletRequest request, HttpServletResponse response,
			@RequestBody ClassifiedDTO classifiedObj) {
		String classifiedid=null;
		int id=0;
		try {
			 classifiedid=request.getParameter("classifiedid");
			 
			 String csfCategory=request.getParameter("csfCategory");
				id=misService.updateClassifiedOthers(classifiedObj,classifiedid,csfCategory);
		}catch(Exception e) {
			logger.error("There was a service error:  : " + e.getCause().getMessage());
		}
		return classifiedid;
	}
	@RequestMapping(value = { "/updateHHClassified" }, method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public String updateHHClassified(HttpServletRequest request, HttpServletResponse response,
			@RequestBody ClassifiedHouseHunting classifiedObj) {
		String message=null;
		try {
			
			String classifiedid=request.getParameter("classifiedid");
			message=misService.updateClassified(classifiedObj,classifiedid);
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return message;
	}
	
	@RequestMapping(value = { "/saveClassifiedImages" }, method = RequestMethod.POST,consumes = { "multipart/form-data" })
	@ResponseBody
	public String  saveClassifiedImages(HttpServletRequest request, HttpServletResponse response,@RequestParam("files[]") MultipartFile[] files) {
		String message=null;
		
		try {
			String id= request.getParameter("id");
			
			message=misService.saveClassifiedImages(id,files);
				
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return message;
	}
	/*@RequestMapping(value = { "/saveClassifiedImages" }, method = RequestMethod.POST,consumes = { "multipart/form-data" })
	@ResponseBody
	public String  saveClassifiedImages(HttpServletRequest request, HttpServletResponse response,@RequestParam("files[]") MultipartFile[] files) {
		String message=null;
		System.out.println("calling url saveClassifiedImages");
		try {
			String id= request.getParameter("id");
			String prty_id= request.getParameter("prty_id");
			String prty_Name= request.getParameter("prty_Name");
			
			message=misService.saveClassifiedImages(id,files);
				
			return "redirect:classifides?prtyid="+prty_id+"&prptyName="+prty_Name+"";
				
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return null;
		
	}*/
	@RequestMapping(value = { "/updateClassifiedStatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String  updateClassifiedStatus(HttpServletRequest request, HttpServletResponse response) {
		String message=null;
		try {
			String id= request.getParameter("id");
			String csftype= request.getParameter("csftype");
			
			message=misService.updateClassifiedStatus(id,csftype,"NA");
				
				
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return message;
	}
	
	
@RequestMapping(value = { "/EditClassified" }, method = RequestMethod.GET)
	
	public String EditClassified(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		try {
			String classifiedid = request.getParameter("classifiedid");
			String prtyid= request.getParameter("prtyid");
			String prtyName= request.getParameter("prptyName");
			String type= request.getParameter("type");
			String csfCategory= request.getParameter("csfCategory");
			
		
			//Avail--NA
			int id=0;
			if(!classifiedid.isEmpty()) {
				id=Integer.parseInt(classifiedid);
			}
			
			if(type.equalsIgnoreCase("CS")) {
				ClassifiedInformationView viewObject=misService.getClassifiedInformatioByid(classifiedid,prtyid);
				List<ClassifiedImages> images=misService.getClassifiedImagesEdit(id);
				
				model.addAttribute("images", new Gson().toJson(images));
				model.addAttribute("viewObject", new Gson().toJson(viewObject));
				model.addAttribute("type", new Gson().toJson(type));
				model.addAttribute("csfCategory", new Gson().toJson(csfCategory));
				
			}else {
				ClassifiedHouseHunting viewObject=misService.getClassHHuntingByCID(classifiedid,prtyid);
				model.addAttribute("viewObject", new Gson().toJson(viewObject));
				model.addAttribute("type", new Gson().toJson(type));
				
			}
			model.addAttribute("prptyid", prtyid);
			model.addAttribute("prptyName", prtyName);
			model.addAttribute("classifiedid", classifiedid);
			model.addAttribute("csfCategory", csfCategory);
			
			return "classifides-edit";
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return null;
		
	}
@RequestMapping(value = { "/VewClassified" }, method = RequestMethod.GET)
	public String VewClassified(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		try {
			String classifiedid = request.getParameter("classifiedid");
			String prtyid= request.getParameter("prtyid");
			String prtyName= request.getParameter("prptyName");
			String type= request.getParameter("type");
			int id=0;
			if(!classifiedid.isEmpty()) {
				id=Integer.parseInt(classifiedid);
			}
			if(type.equalsIgnoreCase("CS")) {
				ClassifiedInformationView viewObject=misService.getClassifiedInformatioByid(classifiedid,prtyid);
				List<String> images=misService.getClassifiedImages(id);
				

				
				model.addAttribute("images", new Gson().toJson(images));
				model.addAttribute("viewObject", viewObject);
				model.addAttribute("prptyid", prtyid);
				model.addAttribute("prptyName", prtyName);
				
				return "classifides-single";
			}else {
				ClassifiedHouseHunting viewObject=misService.getClassHHuntingByCID(classifiedid,prtyid);
				model.addAttribute("viewObject", viewObject);
				model.addAttribute("prptyid", prtyid);
				model.addAttribute("prptyName", prtyName);
				return "classifides-singleHH";
			}
			
			
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return null;
		
	}
@RequestMapping(value = { "/deleteClassified" }, method = RequestMethod.POST)
@ResponseBody
	public String deleteClassified(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		try {
			String classifiedid = request.getParameter("classifiedid");
			String prtyid= request.getParameter("prtyid");
			String prtyName= request.getParameter("prptyName");
			String type= request.getParameter("type");
			int id=0;
			if(!classifiedid.isEmpty()) {
				id=Integer.parseInt(classifiedid);
			}
			if(type.equalsIgnoreCase("CS")) {
				String message=misService.deleteClassified(classifiedid,prtyid);
				return message;
			}else {
				String message=misService.deleteClassifiedHH(classifiedid,prtyid);
				return message;
			}
			
			//return "redirect:/propertyclassifides?prtyid="+prtyid+"&prptyName="+prtyName+"";
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return null;
		
	}

@RequestMapping(value = { "/classifides" }, method = RequestMethod.GET)
public String classifides(HttpServletRequest request, HttpServletResponse response,Model model) {
      
       try {
    	   String prtyid=null;
       ClassifedDTO classified=misService.getClassifiedsByProperty(prtyid);
       model.addAttribute("classified", classified);
       }
       catch(Exception e) {
			logger.error("error in HomeClassifides"+e);
		}
       return "homeClassified";
}

//@RequestMapping(value = { "/classifides/{city}/{location}" }, method = RequestMethod.GET)
@RequestMapping(value = { "/classifides-location" }, method = RequestMethod.GET)
public String classifidesBySearch(HttpServletRequest request, HttpServletResponse response,Model model
		,@RequestParam("city") String city
		,@RequestParam("location") String location,@RequestParam("proptype") String proptype) {
      
       try {
    	  
       ClassifedDTO classified=misService.getClassifiedsByCity(city,location,proptype);
       model.addAttribute("classified", classified);
       model.addAttribute("city", city);
       model.addAttribute("location", location);
       model.addAttribute("proptype", proptype);
       }
       catch(Exception e) {
			logger.error("error in HomeClassifides"+e);
		}
       return "homeClassified";
}


@RequestMapping(value = { "{Title}" }, method = RequestMethod.GET)

public String VewHomeClassifiedTtile(HttpServletRequest request, HttpServletResponse response, Model model,@PathVariable("Title") String title 
		) {
	
	try {
		
		if(StringUtils.isNotEmpty(title) ) {
			String titleArr[]=title.split(",");
			String newTitle=titleArr[0];
			logger.info("newTitle----"+newTitle);
			newTitle = newTitle.replace('-', ' ');
			logger.info("newTitle----"+newTitle);
			
			String classifiedid=titleArr[1];
			logger.info("classifiedid-titleArr[1]-------"+classifiedid);
		int id=0;
		if(!classifiedid.isEmpty()) {
			id=Integer.parseInt(classifiedid);
		}
		
			ClassifiedInformationView viewObject=misService.getClassifiedInformatioByid(classifiedid,"");
			String img=misService.getClassifiedThumbnail(id);
			List<String> images=misService.getClassifiedImages(id);
			

			
			model.addAttribute("images", new Gson().toJson(images));
			model.addAttribute("viewObject", viewObject);
			
			// model.addAttribute("prtyid", prtyid); 
			 model.addAttribute("img", img);
			 
			
			return "classifiedHome-single";
	
		}
		
		
	}catch(Exception e) {
		logger.error(e.getMessage(),e);
	}
	return null;
	
}

@RequestMapping(value = { "/VewHomeClassified" }, method = RequestMethod.GET)

/*public String VewHomeClassified(HttpServletRequest request, HttpServletResponse response, Model model,@RequestParam("Title") String title 
		,@RequestParam("id") String classifiedid,@RequestParam("prtyid") String prtyid ,@RequestParam("img") String img ) {*/
	public String VewHomeClassified(HttpServletRequest request, HttpServletResponse response, Model model,@RequestParam("Title") String title 
			,@RequestParam("id") String classifiedid ) {
	try {
		
		
		int id=0;
		if(!classifiedid.isEmpty()) {
			id=Integer.parseInt(classifiedid);
		}
		
			ClassifiedInformationView viewObject=misService.getClassifiedInformatioByid(classifiedid,"");
			List<String> images=misService.getClassifiedImages(id);
			

			
			model.addAttribute("images", new Gson().toJson(images));
			model.addAttribute("viewObject", viewObject);
			//model.addAttribute("prtyid", prtyid);
		//model.addAttribute("img", img);
			
			return "classifiedHome-single";
	
		
		
		
	}catch(Exception e) {
		logger.error(e.getMessage());
	}
	return null;
	
}

//@RequestMapping(value = { "/classifiedinfo/{classifiedid}/{prtyid}" }, method = RequestMethod.GET)
@RequestMapping(value = { "/classifiedinfo" }, method = RequestMethod.GET)
public String VewHomeClassifiedShare(HttpServletRequest request, HttpServletResponse response, Model model,
		@RequestParam("classified") String classified,@RequestParam("prtyid") String  prtyid) {
	
	try {
		
		int id=0;
		if(!classified.isEmpty()) {
			id=Integer.parseInt(classified);
		}
		
			ClassifiedInformationView viewObject=misService.getClassifiedInformatioByid(classified,prtyid);
			List<String> images=misService.getClassifiedImages(id);
			model.addAttribute("images", new Gson().toJson(images));
			model.addAttribute("viewObject", viewObject);
			model.addAttribute("prtyid", prtyid);
			
			return "classifiedHome-single";
	
		
		
		
	}catch(Exception e) {
		logger.error(e);
	}
	return null;
	
}


@RequestMapping(value = { "/blogs" }, method = RequestMethod.GET)
public String findBlogs(HttpServletRequest request, HttpServletResponse response,Model model) {
       HttpSession session = request.getSession(true);
      
       Integer userid=(Integer) session.getAttribute("userid");
       Integer roleid=(Integer) session.getAttribute("roleid");
      
       if (userid != null) {
			try {
			List<BlogEntity>  blogList=misService.getblogs();
          
         model.addAttribute("blogList", blogList);
        
         model.addAttribute("roleid", roleid);
			}
			catch (Exception e) {
				logger.error("Error occured in findBlogs ---", e);
			}
		  return "blogs";
		  }
		else {
				return "redirect:/login";
	}
}


@RequestMapping(value = { "/saveBlog" }, method = RequestMethod.POST)
public String saveBlog(HttpServletRequest request, HttpServletResponse response,Model model,@RequestParam("files") MultipartFile files) {
       HttpSession session = request.getSession(true);
       
       Integer userid=(Integer) session.getAttribute("userid");
       Integer roleid=(Integer) session.getAttribute("roleid");
		/*
		 * List<PropertyDto> propertyList = null; List<AssetDetailsDto> assetList=null;
		 */
 if (userid != null) {
        try {
        	
        	String title = request.getParameter("blogtitle");
        	
    		String postedby = request.getParameter("postedby");
    		String postedon = request.getParameter("postedon");
    		String description = request.getParameter("description");
    		System.out.println("description----"+description);
    		String tags = request.getParameter("tags");
    		
    		
    		try {
    			misService.saveBlog(title,postedby, postedon, description,tags,files);

    		} catch (Exception e) {
    			logger.error("Error occured in saveBlog ---", e);

    		}

                 }
                 catch (Exception e) {
                       logger.error("Error occured in saveBlog ---", e);
                 }
                return "redirect:/blogs";
            }
          else {
                 return "redirect:/login";
   }
}      
@RequestMapping(value = { "/updateblog" }, method = RequestMethod.POST)
public String updateblog(HttpServletRequest request, HttpServletResponse response,Model model,@RequestParam("files") MultipartFile files) {
       HttpSession session = request.getSession(true);
       System.out.println("update");
       Integer userid=(Integer) session.getAttribute("userid");
       Integer roleid=(Integer) session.getAttribute("roleid");
		/*
		 * List<PropertyDto> propertyList = null; List<AssetDetailsDto> assetList=null;
		 */
 if (userid != null) {
        try {
        	String blogid = request.getParameter("blogid");
        	String title = request.getParameter("blogtitle");
        	System.out.println("blogid----"+blogid);
    		String postedby = request.getParameter("postedby");
    		String postedon = request.getParameter("postedon");
    		String description = request.getParameter("description");
    		String tags = request.getParameter("tags");
    		
    		try {
    			misService.updateBlog(blogid,title,postedby, postedon, description,tags, files);

    		} catch (Exception e) {
    			logger.error("Error occured in saveBlog ---", e);

    		}

                 }
                 catch (Exception e) {
                       logger.error("Error occured in saveBlog ---", e);
                 }
                return "redirect:/blogs";
            }
          else {
                 return "redirect:/login";
   }
}      

@RequestMapping(value = { "/deleteBlog" }, method = RequestMethod.GET)
@ResponseBody
public String deleteBlog(HttpServletRequest request, Model model, HttpServletResponse response) {
	HttpSession session = request.getSession(true);
	String id = request.getParameter("id");
	String message = null;
	try {
		message = misService.deleteBlog(id);
	} catch (Exception e) {
		logger.error("Error occured in deleteBlog ---", e);

	}
	return message;
}
}
