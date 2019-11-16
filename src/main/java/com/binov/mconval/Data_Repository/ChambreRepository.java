package com.binov.mconval.Data_Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.binov.mconval.business.models.Chambre;
import com.binov.mconval.business.models.M_conval;

public interface ChambreRepository extends JpaRepository<Chambre, int []>{
public List<Chambre> findByMconval(M_conval mc);
Chambre findByIdChambre(int idchambre) ;

}
