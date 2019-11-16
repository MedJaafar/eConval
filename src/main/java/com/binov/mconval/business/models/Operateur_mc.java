package com.binov.mconval.business.models;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.DiscriminatorOptions;

@Entity
@DiscriminatorValue("mc")
public class Operateur_mc extends Operateur {

	@ManyToOne
	@JoinColumn(name="idMc")	
private M_conval m_conval ;

	public M_conval getM_conval() {
		return m_conval;
	}

	public void setM_conval(M_conval m_conval) {
		this.m_conval = m_conval;
	}

	public Operateur_mc(M_conval m_conval) {
		super();
		this.m_conval = m_conval;
	}

	public Operateur_mc() {
		super();
	}

	@OneToMany (cascade = CascadeType.ALL , fetch=FetchType.LAZY)
	@JoinColumn(name="idOperateurMc")
	private Collection<Reservation> Reservations;
	
	
}
