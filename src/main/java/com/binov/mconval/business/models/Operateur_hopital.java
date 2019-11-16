package com.binov.mconval.business.models;

import java.util.Collection;

import javax.persistence.*;

@Entity
@DiscriminatorValue("ho")
public class Operateur_hopital extends Operateur {

@ManyToOne
@JoinColumn(name="idHopital")
private Hopital hopital ;

public Hopital getHopital() {
	return hopital;
}

public void setHopital(Hopital hopital) {
	this.hopital = hopital ;
}
@OneToMany (cascade = CascadeType.ALL , fetch=FetchType.LAZY)
@JoinColumn(name="idOperateurHopital")
private Collection<Reservation> Reservations;

public Operateur_hopital() {
	super() ;
}

public Operateur_hopital(Hopital hopital) {
	super();
	this.hopital = hopital;
}


	
}
