package pe.company.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="publicaciones")
public class Publicacion implements Serializable
{
	private static final long serialVersionUID=1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer publicacionId;
	
	@Column
	private String titulo;
	
	@Column
	private String tipo;
	
	@Column
	private String contenido;
	
	@ManyToOne
	@JoinColumn(name="user_id",nullable=false,
		foreignKey=@ForeignKey(foreignKeyDefinition="foreign key(user_id) references users(user_id)"))
	private UserVo userVo;
	
	@Column
	private String bandera;
	
	@Column(columnDefinition="longblob")
	private byte[] file;
	
	public Publicacion() {		
	}

	public Publicacion(Integer publicacionId, String titulo, String tipo, String contenido, byte[] file) {
		this.publicacionId = publicacionId;
		this.titulo = titulo;
		this.tipo = tipo;
		this.contenido = contenido;
		this.file = file;
	}

	public Integer getPublicacionId() {
		return publicacionId;
	}

	public void setPublicacionId(Integer publicacionId) {
		this.publicacionId = publicacionId;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}

	public UserVo getUserVo() {
		return userVo;
	}

	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}

	public String getBandera() {
		return bandera;
	}

	public void setBandera(String bandera) {
		this.bandera = bandera;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}
}
