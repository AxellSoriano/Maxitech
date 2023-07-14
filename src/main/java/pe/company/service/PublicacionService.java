package pe.company.service;

import java.util.Collection;

import pe.company.entity.Publicacion;

public interface PublicacionService 
{
	public abstract void insert(Publicacion publicacion);
	public abstract void update(Publicacion publicacion);
	public abstract void delete(Integer publicacionId);
	public abstract Publicacion findById(Integer publicacionId);
	public abstract Collection<Publicacion> findAll();
}
