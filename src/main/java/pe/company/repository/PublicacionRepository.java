package pe.company.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pe.company.entity.Publicacion;

public interface PublicacionRepository extends JpaRepository<Publicacion,Integer> {

}
