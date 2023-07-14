package pe.company.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pe.company.entity.UserVo;

//uso de Spring Data
public interface UserRepository extends JpaRepository<UserVo,Integer> 
{	
	@Query(value="select * from users where username=?1",nativeQuery=true)
	public abstract UserVo findByUsername(String username);	
}
