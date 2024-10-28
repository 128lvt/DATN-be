package com.app.services;

import com.app.dtos.ProductDTO;
import org.springframework.data.domain.Page;
import com.app.models.*;
import org.springframework.data.domain.PageRequest;

public interface IProductService {
    public Product createProduct(ProductDTO productDTO);
    Product getProductById(long id) throws Exception;
    Page<Product> getAllProduct(PageRequest pageRequest);
    Product updateProduct(long id, ProductDTO productDTO) throws Exception;
    void deleteProduct(long id);
    boolean existsByName(String name);
}
