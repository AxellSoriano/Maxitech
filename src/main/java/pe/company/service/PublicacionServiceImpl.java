package pe.company.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.company.entity.Publicacion;
import pe.company.repository.PublicacionRepository;

@Service
public class PublicacionServiceImpl implements PublicacionService 
{
	@Autowired
	private PublicacionRepository repository;

	@Override
	@Transactional
	public void insert(Publicacion publicacion) {
		repository.save(publicacion);
	}

	@Override
	@Transactional
	public void update(Publicacion publicacion) 
	{
		Publicacion publicacionDb=findById(publicacion.getPublicacionId());	
		
		publicacionDb.setTitulo(publicacion.getTitulo());
		publicacionDb.setTipo(publicacion.getTipo());
		publicacionDb.setContenido(publicacion.getContenido());
		publicacionDb.setUserVo(publicacion.getUserVo());
		
		repository.save(publicacionDb);
	}

	@Override
	@Transactional
	public void delete(Integer publicacionId) {
		repository.deleteById(publicacionId);
	}

	@Override
	@Transactional(readOnly=true)
	public Publicacion findById(Integer publicacionId) {
		return repository.findById(publicacionId).orElse(null);
	}

	@Override
	@Transactional(readOnly=true)
	public Collection<Publicacion> findAll() {
		return repository.findAll();
	}		
}
