package com.app.services;


import com.app.dtos.ProductDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.Category;
import com.app.models.Product;
import com.app.repositories.CategoryRepository;
import com.app.repositories.ProductImageRepository;
import com.app.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final ProductImageRepository productImageRepository;

    public Product createProduct(ProductDTO productDTO) throws DataNotFoundException {
        //Tim category co ton tai hay khong
        Category category = categoryRepository.findById(productDTO.getCategoryId()).orElseThrow(() -> new DataNotFoundException("Cannot find category with id: " + productDTO.getCategoryId()));

        Product product = Product.builder()
                .name(productDTO.getName())
                .category(category)
                .price(productDTO.getPrice())
                .description(productDTO.getDescription())
                .build();
        //Luu vao database
        productRepository.save(product);
        return product;
    }


    public Product getProduct(Long id) throws DataNotFoundException {
        //Find by id tra ve kieu optional
        return productRepository.findById(id).orElseThrow(() -> new DataNotFoundException("Cannot find product with id: " + id));
    }

    public Page<Product> searchProducts(String name, List<Long> categoryIds,
                                        String sortOrder, int page, int limit) {

        Sort sort = Sort.by(sortOrder);

        if (sortOrder != null && sortOrder.equals("-1")) {
            sort = Sort.by(Sort.Order.asc("updatedAt"));
        } else {
            assert sortOrder != null;
            sort = sortOrder.equalsIgnoreCase("desc") ? Sort.by("price").descending() : Sort.by("price").ascending();
        }

        PageRequest pageRequest = PageRequest.of(page, limit, sort);
        return productRepository.findProductsByFilters(name, categoryIds, pageRequest);
    }


    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }


    public Product updateProduct(Long id, ProductDTO productDTO) throws DataNotFoundException {
        //Kiem tra product da ton tai trong db hay chua
        Product product = getProduct(id); //getProduct đã có exception
        if (product != null) {
            //ModelMapper
            //Tim category
            Category category = categoryRepository.findById(productDTO.getCategoryId()).orElseThrow(() -> new DataNotFoundException("Cannot find category with id: " + productDTO.getCategoryId()));
            product.setName(productDTO.getName());
            product.setCategory(category);
            product.setPrice(productDTO.getPrice());
            product.setDescription(productDTO.getDescription());
            //Luu database
            return productRepository.save(product);
        }
        return null;
    }


    public void deleteProduct(Long id) throws DataNotFoundException {
        //Tim san pham theo ID
        Product product = getProduct(id);
        product.setActive(false);
        productRepository.save(product);
    }


    public ProductImage createProductImage(Long productId, ProductImageDTO productImageDTO) throws DataNotFoundException, InvalidParamException {
        //Tim productId
        Product product = productRepository.findById(productId).orElseThrow(() -> new DataNotFoundException("Cannot find product with id: " + productId));
        ProductImage productImage = ProductImage.builder()
                .product(product)
                .imageUrl(productImageDTO.getImageUrl())
                .build();
        //Không cho insert quá 5 ảnh cho 1 sản pẩm
        int size = productImageRepository.findByProductId(productId).size();
        if (size >= ProductImage.MAXIMUM_IMAGE_PER_PRODUCT) {
            throw new InvalidParamException("Number of product's image must be <= " + ProductImage.MAXIMUM_IMAGE_PER_PRODUCT);
        }
        //Luu product image's name vao database
        return productImageRepository.save(productImage);
    }


    public boolean existsByName(String name) {
        return productRepository.existsByName(name);
    }

    public ProductImage getProductImage(Long productImageId) throws DataNotFoundException {
        return productImageRepository.findById(productImageId).orElseThrow(() -> new DataNotFoundException("Không tìm thấy Image"));
    }

    public void updateProductImage(Long productImageId, ProductImage productImage) throws DataNotFoundException, InvalidParamException {
        productImage.setImageUrl(productImage.getImageUrl());
        productImageRepository.save(productImage);
    }


}