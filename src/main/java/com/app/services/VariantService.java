package com.project.shopapp.service.variant;

import com.project.shopapp.dto.ProductVariantDTO;
import com.project.shopapp.exception.DataNotFoundException;
import com.project.shopapp.model.Product;
import com.project.shopapp.model.ProductVariant;
import com.project.shopapp.repository.ProductVariantRepository;
import com.project.shopapp.service.product.ProductService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.time.DateTimeException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class VariantService {
    private final ProductVariantRepository productVariantRepository;
    private final ProductService productService;

    public ProductVariant create(ProductVariantDTO productVariantDTO) throws DataNotFoundException {
        //Lay productId
        Product product = productService.getProduct(productVariantDTO.getProductId());

        ModelMapper modelMapper = new ModelMapper();
        modelMapper.typeMap(ProductVariantDTO.class, ProductVariant.class).addMappings(mapper -> mapper.skip(ProductVariant::setId));
        ProductVariant productVariant = new ProductVariant();
        modelMapper.map(productVariantDTO, productVariant);

        //Luu database
        return productVariantRepository.save(productVariant);
    }

    public void delete(Long variantId) throws DataNotFoundException {
        ProductVariant variant = productVariantRepository.findById(variantId).orElseThrow(() -> new DataNotFoundException("Variant not found"));
        variant.setStock(0);
        productVariantRepository.save(variant);
    }

    public ProductVariant update(Long variantId, ProductVariantDTO productVariantDTO) throws DataNotFoundException {
        //Tim productVariant
        ProductVariant variant = productVariantRepository.findById(variantId).orElseThrow(() -> new DataNotFoundException("Variant not found"));

        ModelMapper modelMapper = new ModelMapper();
        modelMapper.typeMap(ProductVariantDTO.class, ProductVariant.class)
                .addMappings(mapper -> mapper.skip(ProductVariant::setId));
        modelMapper.map(productVariantDTO, variant);

        //Luu vao database
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
