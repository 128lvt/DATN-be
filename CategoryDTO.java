package com.example.datnweb.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import javax.validation.constraints.NotEmpty;

@Data
@AllArgsConstructor
public class CategoryDTO {

    @NotEmpty(message = "Category's name cannot be empty")  // Sửa lỗi chính tả của @NotEmpty
    private String name;
}
