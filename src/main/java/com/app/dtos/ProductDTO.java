package com.app.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.*;

public class ProductDTO {
    @NotBlank(message = "Title is required")
    @Size(min = 3 , max = 200, message = "Title must between 3 and 200 characters")
    private String name;

    private Float price;

    @Min(value = 0 , message = "Discount must be greater than or equal to 0")
    @Max(value = 100 , message = "Discount must be less than or equal to 100")
    private String thumbnail;

    private String description;

    @JsonProperty("category_id")
    private String categoryId;

}
