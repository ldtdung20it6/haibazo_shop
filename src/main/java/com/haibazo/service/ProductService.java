package com.haibazo.service;

import java.util.List;

import com.haibazo.model.Product;

public interface ProductService {
    List<Product> findAllProduct();
    Product findProductById(int productId);
    Product createProduct(Product reqBody);
    Product updateProduct(int productId,Product reqBody);
    String deleteProduct(int productId);
}
