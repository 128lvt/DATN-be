package com.app.services;

import com.app.dtos.ProductVariantDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.Product;
import com.app.models.ProductVariant;
import com.app.repositories.ProductVariantRepository;

import java.time.DateTimeException;
import java.util.List;

public class VariantService implements IVariantService {
    private final ProductVariantRepository productVariantRepository;
    private final ProductService productService;
    @Override
    public ProductVariant create(ProductVariantDTO productVariantDTO) throws DataNotFoundException {
        Product product = productService.getProduct(productVariantDTO.getProductId());
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.typeMap(ProductVariantDTO.class, ProductVariant.class).addMappings(mapper -> mapper.skip(ProductVariant::setId));
        ProductVariant productVariant = new ProductVariant();
        modelMapper.map(productVariantDTO, productVariant);
        return productVariantRepository.save(productVariant);
    }
    public void delete(Long variantId) throws DataNotFoundException {
        ProductVariant variant = productVariantRepository.findById(variantId).orElseThrow(() -> new DataNotFoundException("Variant not found"));
        variant.setStock(0);
        productVariantRepository.save(variant);
    }

    public ProductVariant update(Long variantId, ProductVariantDTO productVariantDTO) throws DataNotFoundException {
        ProductVariant variant = productVariantRepository.findById(variantId).orElseThrow(() -> new DataNotFoundException("Variant not found"));
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.typeMap(ProductVariantDTO.class, ProductVariant.class)
                .addMappings(mapper -> mapper.skip(ProductVariant::setId));
        modelMapper.map(productVariantDTO, variant);
        return productVariantRepository.save(variant);
    }

    public List<ProductVariant> getVariantByProductId(Long productId) {
        return productVariantRepository.findByProductId(productId);
    }

    public Boolean existsVariant(Long productId, String color, String size) {
        List<ProductVariant> productVariants = productVariantRepository.findByProductIdAndColor(productId, color);

        if (!productVariants.isEmpty()) {
            ProductVariant productVariant = productVariants.get(0);
            return productVariant.getSize().equalsIgnoreCase(size); // Kiểm tra xem size có trùng không
        }

        return false; // Trả về false nếu không tìm thấy variant nào
    }

    public ProductVariant getVariant(Long variantId) {
        return productVariantRepository.findById(variantId).orElseThrow(() -> new DateTimeException("Variant not found"));
    }

}
