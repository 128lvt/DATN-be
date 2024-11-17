package com.app.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class ProductVariantDTO {
    @JsonProperty("product_id")
    private Long productId;

    private String color;

    private String size;

    private int stock;

    private Long v_id;
}