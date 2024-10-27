package com.app.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.app.responses.Response;

@RestController
@RequestMapping("${api.prefix}/products")
public class ProductController {
    @PostMapping
    public ResponseEntity<String> createProduct(/* @Valid *//* @RequestBody ProductDTO ProductDTO */) {
        try {
            return ResponseEntity.ok("Product created");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping
    public ResponseEntity<?> getProduct(
            @RequestParam("page") int page,
            @RequestParam("limit") int limit) {
        return ResponseEntity
                .ok()
                .body(Response
                        .builder()
                        .status("success")
                        .message("Product list")
                        .data(null)
                        .build());
    }

    @GetMapping("/{id}")
    public ResponseEntity<String> getProductById(@PathVariable("id") String productId) {
        return ResponseEntity.ok("Product with ID: " + productId);
    }
}
