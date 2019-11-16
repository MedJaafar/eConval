package com.binov.mconval.business.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
public class Proposition implements Serializable {
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)	
private int idProposition ;

@ManyToOne
@JoinColumn(name="IdMc")
private M_conval mconval ;

public Date getDate_temps_envoie() {
	return date_temps_envoie;
	}

public void setDate_temps_envoie(Date date_temps_envoie) {
	this.date_temps_envoie = date_temps_envoie;
}

@ManyToOne
@JoinColumn(name="IdReservation")
private Reservation reservation ;

@OneToOne(fetch=FetchType.EAGER, mappedBy="proposition")
private Notification notification ; 

public Notification getNotification() {
	return notification;
}

public void setNotification(Notification notification) {
	this.notification = notification;
}

@ManyToOne
@JoinColumn(name="IdChambre")
private Chambre chambre ;
	
private float prix ; 

@Temporal(TemporalType.DATE)
private Date date_debut_sejour_prop ; 

@Temporal(TemporalType.DATE)
private Date date_fin_sejour_prop ;

@Temporal(TemporalType.DATE)
private Date date_Envoie ;

@Temporal(TemporalType.TIMESTAMP)
private Date date_temps_envoie ;


public Date getDate_Envoie() {
	return date_Envoie;
}

public void setDate_Envoie(Date date_Envoie) {
	this.date_Envoie = date_Envoie;
}

public enum statut {
	accept , 
	refus , 
	enattente }

@Enumerated(EnumType.STRING)
private statut statut;

public Proposition() {
	super();
}

public int getIdProposition() {
	return idProposition;
}

public void setIdProposition(int idProposition) {
	this.idProposition = idProposition;
}

public M_conval getMconval() {
	return mconval;
}

public void setMconval(M_conval mconval) {
	this.mconval = mconval;
}

public Reservation getReservation() {
	return reservation;
}

public void setReservation(Reservation reservation) {
	this.reservation = reservation;
}

public Chambre getChambre() {
	return chambre;
}

public void setChambre(Chambre chambre) {
	this.chambre = chambre;
}

public float getPrix() {
	return prix;
}

public void setPrix(float prix) {
	this.prix = prix;
}

public Date getDate_debut_sejour_prop() {
	return date_debut_sejour_prop;
}

public void setDate_debut_sejour_prop(Date date_debut_sejour_prop) {
	this.date_debut_sejour_prop = date_debut_sejour_prop;
}

public Date getDate_fin_sejour_prop() {
	return date_fin_sejour_prop;
}
public void setDate_fin_sejour_prop(Date date_fin_sejour_prop) {
	this.date_fin_sejour_prop = date_fin_sejour_prop;
}

public statut getStatut() {
	return statut;
}

public void setStatut(statut statut) {
	this.statut = statut;
}}
