package com.app.models;

import com.app.serializer.DecimalJsonSerializer;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
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

    @Column(length = 300)
    private String thumbnail;

    private String description;


    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;


    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private List<ProductVariant> variants = new ArrayList<>();

}
