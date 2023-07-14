package pe.company.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.company.entity.RoleVo;
import pe.company.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService
{
	@Autowired
	private RoleRepository repository;

	@Override
	@Transactional(readOnly=true)
	public RoleVo findById(Integer roleId) {
		return repository.findById(roleId).orElse(null);
	}
	
	/*
	@Override
	@Transactional(readOnly=true)
	public RoleVo findByType(String type) {
		return repository.findByType(type);
	}
	*/
	
	@Override
	@Transactional(readOnly=true)
	public Collection<RoleVo> findAll() {
		return repository.findAll();
	}
}
