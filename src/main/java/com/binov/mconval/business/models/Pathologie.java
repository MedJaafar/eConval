package com.binov.mconval.business.models;
import java.io.Serializable;

import javax.persistence.* ;
@Entity
public class Pathologie implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int idPathologie;
	private String nomPathologie;
	
	public int getIdpathologie() {
		return idPathologie;
	}
	public void setIdpathologie(int idPathologie) {
		this.idPathologie = idPathologie;
	}
	public String getNompathologie() {
		return nomPathologie;
	}
	public void setNompath(String nomPathologie) {
		this.nomPathologie = nomPathologie;
	}
	public Pathologie() {
		super();
	}
	
	

}
