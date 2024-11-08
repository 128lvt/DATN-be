package com.app.dtos;


import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductImageDTO {
    @JsonProperty ("product_id")
    @Min(value = 1, message = "Product's ID muse be > 0 ")
    private long productId;

    @Size(min = 2, max = 200, message = "Image's name")
    @JsonProperty ("imageUrl")
    private String imageUrl;
}
