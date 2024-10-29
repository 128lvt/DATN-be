package com.app.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Min;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderDetailDTO {
    @JsonProperty("order_id")
    @Min(value = 1, message = "User's ID must be > 0")
    private Long orderId;

    @Min(value = 1, message = "Product's ID must be > 0")
    @JsonProperty("product_id")
    private Long productId;

    @Min(value = 0, message = "Product's ID must be > 0")
    private Long price;

    @Min(value = 1, message = "number_of_products ID must be > 0")
    @JsonProperty("number_of_products")
    private int numberOfProducts;

    @Min(value = 0, message = "total_money ID must be > 0")
    @JsonProperty("total_money")
    private int totalMoney;

    private String color;


}
