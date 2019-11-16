package com.binov.mconval.Data_Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.binov.mconval.business.models.Pathologie;

public interface PathologieRepository extends JpaRepository<Pathologie, int[]>{

}
