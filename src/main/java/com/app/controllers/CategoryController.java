package com.app.controllers;

import com.app.dtos.CategoryDTO;
import com.app.models.Category;
import com.app.services.CategoryService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import static java.util.Arrays.stream;
import static java.util.stream.Collectors.toList;
import static org.hibernate.Hibernate.map;

@RestController
@RequestMapping
//@Validated
//Dependency Injection
@RequiredArgsConstructor
public class CategoryController {
    private final CategoryService categoryService;
    // hien tat ca cac categories
    @GetMapping("")
    public ResponseEntity<List<Category>> getAllCategories(
            @RequestParam("page") int page,
            @RequestParam("limit") int limit
    ){
        List<Category>categories = categoryService.getAllCategories();
        return ResponseEntity.ok(categories);
    }
    @PostMapping("")
    //neu tham so truyen vao 1 object thi sao ?=> data transfer object = request object
    public ResponseEntity<?> insertCategory(
            @Valid @RequestBody CategoryDTO categoryDTO,
            BindingResult result){
        if (result.hasErrors()) {
            List<String> errorsMessage = result.GetFieldErrors() List< FieldError>
            .stream() Stream.FieldError>
            .map(FieldError::getDefaultMessage)Stream<String>
            .toList();
            return ResponseEntity.badRequest().body(errorsMessage);
        }
        categoryService.createCategory(categoryDTO);
        return ResponseEntity.ok(body:"Insert category successfully")
    }
    PutMapping("/{id}")
        public ResponseEntity<String> updateCategory(
                @PathVariable Long id,
                @Valid @RequestBody CategoryDTO categoryDTO
        ){
            categoryService.updateCategory(id, categoryDTO);
            return  ResponseEntity.ok(body: "Update category successfully ");
        }
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteCategory(@PathVariable Long id){
        categoryService.deleteCategory(id);
        return  ResponseEntity.ok(body: "Delete category with id"+id+" successfully");
    }
}
