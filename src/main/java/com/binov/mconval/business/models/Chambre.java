package com.binov.mconval.business.models;
import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;
@Entity
public class Chambre implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
private int idChambre;
private int nblits;
private int nboccupants;


public int getIdChambre() {
	return idChambre;
}





public void setIdChambre(int idChambre) {
	this.idChambre = idChambre;
}
public int getNblits() {
	return nblits;
}
public void setNblits(int nblits) {
	this.nblits = nblits;
}

public int getNboccupants() {
	return nboccupants;
}

public void setNboccupants(int nboccupants) {
	this.nboccupants = nboccupants;
}



public M_conval getMconval() {
	return mconval;
}





public void setMconval(M_conval mconval) {
	this.mconval = mconval;
}





public Collection<Reservation> getReservation() {
	return reservation;
}





public void setReservation(Collection<Reservation> reservation) {
	this.reservation = reservation;
}





public Chambre() {
	super();
}
@ManyToOne
@JoinColumn(name="IdMc")
private M_conval mconval;

@OneToMany(cascade = CascadeType.ALL , fetch=FetchType.LAZY)
@JoinColumn(name="idChambre")
private Collection<Reservation> reservation;

}
