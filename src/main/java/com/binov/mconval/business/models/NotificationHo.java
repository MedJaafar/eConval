package com.binov.mconval.business.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class NotificationHo {

	public int getIdNotificationHo() {
		return idNotificationHo;
	}

	public void setIdNotificationHo(int idNotificationHo) {
		this.idNotificationHo = idNotificationHo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	public Date getDatenotif() {
		return datenotif;
	}

	public void setDatenotif(Date datenotif) {
		this.datenotif = datenotif;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int idNotificationHo ;
	
	String message ; 
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "idReservation")
	private Reservation reservation ; 
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date datenotif ; 
}
