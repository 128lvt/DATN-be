package com.app.services;

import com.app.dtos.ProductDTO;
import com.app.dtos.ProductImageDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.exceptions.InvalidParamException;
import com.app.models.Product;
import com.app.models.ProductImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

public interface IProductService {
    public Product createProduct(ProductDTO productDTO) throws DataNotFoundException;

    Product getProductById(long id) throws Exception;

    Page<Product> getAllProduct(PageRequest pageRequest);

    Product updateProduct(long id, ProductDTO productDTO) throws Exception;

    void deleteProduct(long id);

    boolean existsByName(String name);

    ProductImage createProductImage(
            Long productId,
            ProductImageDTO productImageDTO) throws Exception;
}
