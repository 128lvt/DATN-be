package com.app.repositories;


import com.app.models.Product;
import org.jetbrains.annotations.NotNull;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    boolean existsByName(String name);

    @Query("SELECT p FROM Product p WHERE p.active IS NULL OR p.active != false ")
    @NotNull
    List<Product> findAll();

    @Query("SELECT p FROM Product p WHERE "
            + "(p.active = true OR p.active IS NULL) AND "
            + "(:name IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :name, '%'))) AND "
            + "(:categoryIds IS NULL OR p.category.id IN :categoryIds)")
    Page<Product> findProductsByFilters(@Param("name") String name,
                                        @Param("categoryIds") List<Long> categoryIds,
                                        Pageable pageable);

}