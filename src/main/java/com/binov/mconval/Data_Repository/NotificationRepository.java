package com.binov.mconval.Data_Repository;



import org.springframework.data.jpa.repository.JpaRepository;





import com.binov.mconval.business.models.Notification;

public interface NotificationRepository extends JpaRepository<Notification, int[]>{
	
	

}
