package com.binov.mconval.business.models;
import java.io.Serializable;

import javax.persistence.*;
@Entity
public class Ambulancier implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
private int idAmbulancier;
private String nomAmbulancier;
private long telAmbulancier;
private String mailAmbulancier;
private String Compagnie;
private String Vehicule;

public int getIdAmbulancier() {
	return idAmbulancier;
}
public void setIdAmbulancier(int idAmbulancier) {
	this.idAmbulancier = idAmbulancier;
}
public String getNomAmbulancier() {
	return nomAmbulancier;
}
public void setNomAmbulancier(String nomAmbulancier) {
	this.nomAmbulancier = nomAmbulancier;
}
public long getTelAmbulancier() {
	return telAmbulancier;
}
public void setTelAmbulancier(long telAmbulancier) {
	this.telAmbulancier = telAmbulancier;
}
public String getMailAmbulancier() {
	return mailAmbulancier;
}
public void setMailAmbulancier(String mailAmbulancier) {
	this.mailAmbulancier = mailAmbulancier;
}
public String getCompagnie() {
	return Compagnie;
}
public void setCompagnie(String compagnie) {
	Compagnie = compagnie;
}

public String getVehicule() {
	return Vehicule;
}
public void setVehicule(String vehicule) {
	Vehicule = vehicule;
}
public Ambulancier() {
	super();
}


}
