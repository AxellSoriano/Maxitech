package pe.company.service;

import pe.company.entity.UserVo;

public interface UserService 
{
	public abstract void insert(UserVo user);
	
	public abstract UserVo findById(Integer userId);
	public abstract UserVo findByUsername(String username);
}
