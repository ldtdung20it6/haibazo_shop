package com.haibazo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.haibazo.model.Product;

public interface ProductRepository extends JpaRepository<Product,Integer>{
    
}
