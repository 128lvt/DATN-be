package com.app.services;

import com.app.dtos.ProductDTO;
import com.app.dtos.ProductImageDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.exceptions.InvalidParamException;
import com.app.models.Product;
import com.app.models.ProductImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.List;

public interface IProductService {
    Product createProduct(ProductDTO productDTO) throws DataNotFoundException;

    Product getProduct(Long id) throws DataNotFoundException;

    List<Product> getAllProducts();

    Product updateProduct(Long id, ProductDTO productDTO) throws DataNotFoundException;

    void deleteProduct(Long id);

    ProductImage createProductImage(Long productId, ProductImageDTO productImageDTO) throws DataNotFoundException, InvalidParamException;

    boolean existsByName(String name);
}
