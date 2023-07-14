package pe.company.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.company.entity.RoleVo;
import pe.company.entity.UserVo;
import pe.company.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService, UserDetailsService
{
	@Autowired
	private UserRepository repository; //inyección a Spring Data
	
	@Autowired
	private PasswordEncoder passwordEncoder; //inyección al bean passwordEncoder 
	
	@Override
	@Transactional
	public void insert(UserVo user) 
	{
		//cifrando el password
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		//guardar user
		repository.save(user);
	}
	
	@Override
	@Transactional(readOnly=true)
	public UserVo findById(Integer userId) {
		return repository.findById(userId).orElse(null);
	}

	@Override
	@Transactional(readOnly=true)
	public UserVo findByUsername(String username) {
		return repository.findByUsername(username);
	}

	@Override //método para descubrir si el usuario que intenta logearse puede pasar como autenticado o no
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException 
	{
		//usuario buscado por username
		UserVo user=this.findByUsername(username);
		
		if(user!=null)
		{
			//colección vacío
			Collection<GrantedAuthority> roles=new ArrayList<>();
			
			//agregar rol del usuario a la colección roles
			for(RoleVo role:user.getItemsRole()) {
				roles.add(new SimpleGrantedAuthority("ROLE_"+role.getType()));
			}
			
			//colección cargado
			
			return new User(user.getUsername(),user.getPassword(),user.getState().equals("ACTIVE"),
					        true,true,true,roles);
		}
		
		throw new UsernameNotFoundException("Revisa tu e-mail o usuario.");
	}
}














