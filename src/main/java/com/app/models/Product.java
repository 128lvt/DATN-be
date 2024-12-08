package com.app.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.project.shopapp.serializer.DecimalJsonSerializer;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "products")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 350)
    private String name;

    @JsonSerialize(using = DecimalJsonSerializer.class)
    private Double price;

    @Transient //khong luu du lieu vao database
    private Long stock;

    public Long getStock() {
        return variants.stream().mapToLong(ProductVariant::getStock).sum();
    }

    private String description;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(mappedBy = "product")
    @JsonManagedReference
    private final List<ProductVariant> variants = new ArrayList<>();

    @OneToMany(mappedBy = "product")
    @JsonManagedReference
    private final List<ProductImage> images = new ArrayList<>();
}
