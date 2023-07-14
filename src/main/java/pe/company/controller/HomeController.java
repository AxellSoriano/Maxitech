package pe.company.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import pe.company.entity.Publicacion;
import pe.company.entity.UserVo;
import pe.company.service.PublicacionService;
import pe.company.service.RoleService;
import pe.company.service.UserService;

@Controller
public class HomeController 
{
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PublicacionService publicacionService;
	
	@RequestMapping(value={"/","/index"},method=RequestMethod.GET)
	public String index(Map map) 
	{
		//map.put("var_username",username());
		//map.put("var_authorities",authorities());
		
		map.put("bPublicacion",publicacionService.findAll());
		
		return "index";
	}
	
	//REDACTOR_GET
	@RequestMapping(value="/user",method=RequestMethod.GET)
	public String user_GET(Model model) 
	{
		model.addAttribute("publicacion",new Publicacion());
		model.addAttribute("userVo",userService.findByUsername(username()));
		
		return "user";
	}
	
	//REDACTOR_POST
	@RequestMapping(value="/user",method=RequestMethod.POST)
	public String user_POST(Publicacion publicacion,@PathParam("userId") Integer userId,
			                @RequestPart("myfile") MultipartFile myfile) throws IOException 
	{
		UserVo userDb=userService.findById(userId);
		
		publicacion.setUserVo(userDb);
		publicacion.setFile(myfile.getBytes());		
		
		//guardar en la BD
		publicacionService.insert(publicacion);
		
		return "redirect:/index";
	}
	
	//COORDINADOR_GET
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String admin(Map map) 
	{
		map.put("bPublicacion",publicacionService.findAll());
		return "admin";
	}
	
	//COORDINADOR_HABILITAR_GET
	@RequestMapping(value="/admin/habilitar/{publicacionId}",method=RequestMethod.GET)
	public String adminHabilitar_GET(@PathVariable Integer publicacionId)
	{
		Publicacion publicacionDb=publicacionService.findById(publicacionId);
		publicacionDb.setBandera("habilitado");
		
		publicacionService.update(publicacionDb);
		
		return "redirect:/index";
	}
	
	//COORDINADOR_BORRAR_GET
	@RequestMapping(value="/admin/borrar/{publicacionId}",method=RequestMethod.GET)
	public String adminBorrar_GET(@PathVariable Integer publicacionId)
	{
		publicacionService.delete(publicacionId);
		return "redirect:/index";
	}
	
	@RequestMapping(value="/dba",method=RequestMethod.GET)
	public String dba() {
		return "dba";
	}
	
	@RequestMapping(value="/access_denied",method=RequestMethod.GET)
	public String access_denied() {
		return "access_denied";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
   	public String logout(HttpServletRequest request,HttpServletResponse response) 
    {
		//llamar al usuario autenticado
        Authentication auth=SecurityContextHolder.getContext().getAuthentication();
  
        //si existe el usuario autenticado
        if(auth!=null)    
            new SecurityContextLogoutHandler().logout(request,response,auth); //cerrar sesión
  
        //redireccionar a login
        return "redirect:login?logout";
    }
	
	//método que devuelve el nombre del usuario autenticado
	public String username()
	{
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object principal=auth.getPrincipal();
		
		if(principal instanceof UserDetails) {
			return ((UserDetails)principal).getUsername();
		}
		
		return principal.toString();
	}
	
	//método que devuelve los roles del usuario autenticado
	public Collection<? extends GrantedAuthority> authorities()
	{
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		return auth.getAuthorities();
	}
	
	@RequestMapping(value="/registration",method=RequestMethod.GET)
	public String registration_GET(Model model,Map map)
	{
		UserVo userModel=new UserVo();
		model.addAttribute("userVo",userModel); //userVo vacío
		
		map.put("bRoles",roleService.findAll());
		
		return "registration";
	}
	
	@RequestMapping(value="/registration",method=RequestMethod.POST)
	public String registration_POST(@Valid UserVo userVo,Errors errors,Map map) //userVo cargado
	{
		//si hay algun de validación
		if(errors.hasErrors()) 
		{
			map.put("bRoles",roleService.findAll());
			return "registration";
		}
		
		//guardar nuevo usuario
		userService.insert(userVo);
		
		return "registration_success";
	}
}














