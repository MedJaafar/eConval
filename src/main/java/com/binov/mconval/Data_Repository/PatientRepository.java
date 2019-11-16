package com.binov.mconval.Data_Repository;





import org.springframework.data.jpa.repository.JpaRepository;





import com.binov.mconval.business.models.Patient;
public interface PatientRepository extends JpaRepository <Patient,int[]> {
	Patient findByIdpatient(int idpatient);
}
