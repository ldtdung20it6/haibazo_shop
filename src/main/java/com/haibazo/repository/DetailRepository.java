package com.haibazo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.haibazo.model.Detail;

public interface DetailRepository extends JpaRepository<Detail,Integer> {
    
}
