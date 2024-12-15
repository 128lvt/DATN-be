package com.app.services;

import com.project.shopapp.model.OutOfStock;
import com.project.shopapp.model.ProductVariant;
import com.project.shopapp.model.TopSellingCategory;
import com.project.shopapp.model.TopSellingProductsMonthly;
import com.project.shopapp.repository.ProductRepository;
import com.project.shopapp.repository.ProductVariantRepository;
import com.project.shopapp.repository.TopSellingCategoryRepository;
import com.project.shopapp.repository.TopSellingProductsMonthlyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DashboardService {
    private final TopSellingProductsMonthlyRepository monthlyRepository;
    private final TopSellingCategoryRepository sellingCategoryRepository;
    private final ProductRepository productRepository;
    private final ProductVariantRepository productVariantRepository;

    public List<TopSellingProductsMonthly> getTopSellingProducts() {
        return monthlyRepository.getTopSellingProductsMonthly();
    }

    public List<TopSellingCategory> getTopSellingCategories() {
        return sellingCategoryRepository.findAll();
    }

    public List<OutOfStock> getOutOfStockProducts(Integer stock) {
        //Dung function co san cua jpa
        List<ProductVariant> productVariants = productVariantRepository.findByStockLessThan(stock);
        return productVariants.stream()
                .map(productVariant -> OutOfStock.getOutOfStock(productVariant.getProduct(), productVariant))
                .collect(Collectors.toList());
    }
}
