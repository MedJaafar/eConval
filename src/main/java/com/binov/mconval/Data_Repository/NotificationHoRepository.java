package com.binov.mconval.Data_Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.binov.mconval.business.models.NotificationHo;

public interface NotificationHoRepository extends JpaRepository<NotificationHo, int[]> {

}
