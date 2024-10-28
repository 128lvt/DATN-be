package com.app.controllers;

import com.app.dtos.CategoryDTO;
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
    // hien tat ca cac categories
    @GetMapping("")
    public ResponseEntity<String> getAllCategories(
            @RequestParam("page") int page,
            @RequestParam("limit") int limit
    ){
        return ResponseEntity.ok(String.format("getAllCategories: page=%d, limit=%d", page, limit));
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
        return ResponseEntity.ok(body:"This is insertCategory"+categoryDTO)
    }
}
