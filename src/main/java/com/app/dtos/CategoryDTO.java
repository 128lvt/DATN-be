package com.project.shopapp.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
public class CategoryDTO {
    @NotEmpty(message = "Category's name cannot be empty")
    private String name;
}
