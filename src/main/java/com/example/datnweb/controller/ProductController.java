package com.example.datnweb.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.*;

@RestController
@RequestMapping("api/v1/product")
public class ProductController {
    @PostMapping("")
    public ResponseEntity<String> createProduct(@Valid @RequestBody ProductDTO ProductDTO){
    try {
        productService.createProduct(ProductDTO);
        return ResponseEntity.ok("Product created");
    }catch (Exception e){
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
    }
    }
    @GetMapping("")
    public ResponseEntity<String> getProduct(
            @RequestParam("page") int page,
            @RequestParam(" limit") int limit
    )
    {
        return ResponseEntity.ok("getProduct");
    }
    @GetMapping("/{id}")
    public ResponseEntity<String> getProductById(@PathVariable("id") String productId) {
    return ResponseEntity.ok("Product with ID: " + productId);
    }
}
