package com.app.controllers;

import ch.qos.logback.core.util.StringUtil;
import com.app.dtos.ProductDTO;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.app.responses.Response;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@RestController
@RequestMapping("${api.prefix}/products")
public class ProductController {
    @PostMapping(value = "",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    //Post http
    public ResponseEntity<?> createProduct(
            @Valid @RequestBody ProductDTO productDTO,
            @RequestPart("file") MultipartFile file
    ){
        try {
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image")) {
                return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
                        .body("File must be  a image");
            }
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
        return null;
    }
    private String storeFile(MultipartFile file) throws IOException {
        String fileName = StringUtil.cleanPath(file.getOriginalFilename());
        //them uuid vao truoc ten file de dam bao file la duy nhat
        String uniqueFilename = UUID.randomUUID().toString() + "_" + fileName;
        //duong dan den noi luu file
        java.nio.file.Path uploadDir = Paths.get("uploads");
        //kiem tra va tao thu muc neu no ko ton tai
        if (!File.exists(uploadDir)){
            File.createDirectories(uploadDir);
        }
        //duong dan day du den file
        java.nio.file.Path destination = uploadDir.resolve(uniqueFilename);
        //sao chep file vao thu muc dich
        File.copy(file.getInputStream(), destination, StandardCopyOption.REPLACE_EXISTING);
        return uniqueFilename;
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
