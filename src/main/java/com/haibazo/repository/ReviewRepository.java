package com.haibazo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.haibazo.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
    
}
