package pe.company.service;

import java.util.Collection;

import pe.company.entity.RoleVo;

public interface RoleService 
{
	public abstract RoleVo findById(Integer roleId);
	//public abstract RoleVo findByType(String type);	
	
	public abstract Collection<RoleVo> findAll();
}
