package com.app.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Min;
import lombok.Data;

@Data
public class OrderDetailDTO {
    @JsonProperty("order_id")
    @Min(value = 1, message = "Order's ID must be > 0")
    private Long orderId;

    @JsonProperty("product_id")
    @Min(value = 1, message = "Product's ID must be > 0")
    private Long productId;

    @JsonProperty("number_of_products")
    @Min(value = 1, message = "number_of_products ID must be >= 1")
    private int numberOfProducts;
    @JsonProperty("variant_id")
    private Long variantId;
}