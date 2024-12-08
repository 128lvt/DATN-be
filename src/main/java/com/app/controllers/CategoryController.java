package com.project.shopapp.controller;

import com.project.shopapp.dto.CategoryDTO;
import com.project.shopapp.model.Category;
import com.project.shopapp.response.Response;
import com.project.shopapp.service.category.CategoryService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/categories")
/*@Validated*/
@RequiredArgsConstructor
public class CategoryController {
    private final CategoryService categoryService;

    @PostMapping
    public ResponseEntity<?> createCategory(@Valid @RequestBody CategoryDTO categoryDTO) {
        try {
            Category category = categoryService.createCategory(categoryDTO);
            return ResponseEntity.ok().body(Response.builder()
                    .message("Create category successfully")
                    .data(category)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping
    public ResponseEntity<?> getAllCategories() {
        List<Category> categories = categoryService.getAllCategories();
        return ResponseEntity.ok().body(Response.success(categories));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateCategory(@PathVariable Long id, @Valid @RequestBody CategoryDTO categoryDTO) {
        categoryService.updateCategory(id, categoryDTO);
        return ResponseEntity.ok("Update category successfully " + categoryDTO);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCategory(@PathVariable Long id) {
        categoryService.deleteCategory(id);
        return ResponseEntity.ok("Delete category successfully " + id);
    }
}
