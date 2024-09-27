package com.haibazo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.haibazo.model.Rating;

public interface RatingRepository extends JpaRepository<Rating, Integer>{
    
}
