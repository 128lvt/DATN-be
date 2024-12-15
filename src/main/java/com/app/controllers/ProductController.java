package com.project.shopapp.controller;

import com.github.javafaker.Faker;
import com.project.shopapp.dto.ProductDTO;
import com.project.shopapp.dto.ProductImageDTO;
import com.project.shopapp.dto.ProductVariantDTO;
import com.project.shopapp.exception.DataNotFoundException;
import com.project.shopapp.model.Product;
import com.project.shopapp.model.ProductImage;
import com.project.shopapp.model.ProductVariant;
import com.project.shopapp.response.ProductResponse;
import com.project.shopapp.response.Response;
import com.project.shopapp.service.product.ProductService;
import com.project.shopapp.service.variant.VariantService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@RestController
@RequestMapping("${api.prefix}/products")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:3000")
public class ProductController {
    private final ProductService productService;

    private final VariantService variantService;

    @PostMapping
    public ResponseEntity<?> createProduct(@Valid @RequestBody ProductDTO productDTO) throws DataNotFoundException {
        try {
            return ResponseEntity.ok().body(Response
                    .builder()
                    .message("create product successfully")
                    .data(productService.createProduct(productDTO))
                    .build());
        } catch (DataNotFoundException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/variant/{id}")
    public ResponseEntity<?> getVariant(@PathVariable Long id) {
        List<ProductVariant> productVariants = variantService.getVariantByProductId(id);
        return ResponseEntity.ok().body(Response.success(productVariants));
    }

    @PostMapping("/variant")
    public ResponseEntity<?> createProductVariant(@Valid @RequestBody ProductVariantDTO productVariantDTO) throws Exception {
        try {
            //Kiem tra size, color da ton tai chua
            if (variantService.existsVariant(productVariantDTO.getProductId(), productVariantDTO.getColor(), productVariantDTO.getSize())) {
                return ResponseEntity.badRequest().body(Response.error("Color, size đã tồn tại"));
            } else {
                return ResponseEntity.ok().body(Response
                        .builder()
                        .message("Create product variant successfully")
                        .data(variantService.create(productVariantDTO))
                        .build());
            }

        } catch (DataNotFoundException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Internal server error: " + e.getMessage());
        }
    }


    @PutMapping("/variant/{id}")
    public ResponseEntity<?> updateProductVariant(@PathVariable Long id, @Valid @RequestBody ProductVariantDTO productVariantDTO) throws DataNotFoundException {
        return ResponseEntity.ok().body(Response.success(variantService.update(id, productVariantDTO)));
    }

    @DeleteMapping("/variant/{id}")
    public ResponseEntity<?> deleteVariant(@PathVariable Long id) throws DataNotFoundException {
        variantService.delete(id);
        return ResponseEntity.ok().body(Response.success(null));
    }

    @GetMapping("images/{imageName}")
    public ResponseEntity<?> viewImage(@PathVariable String imageName) throws DataNotFoundException {
        try {
            Path path = Paths.get("uploads/" + imageName);
            UrlResource resource = new UrlResource(path.toUri());

            if (resource.exists()) {
                return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping(value = "uploads/{productImageId}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> updateProductImage(
            @PathVariable("productImageId") Long productImageId,
            @RequestParam("files") MultipartFile file) {
        try {
            ProductImage productImage = productService.getProductImage(productImageId);
            if (productImage == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product image not found");
            }

            // Kiểm tra kích thước và định dạng của file
            if (file.getSize() == 0) {
                return ResponseEntity.badRequest().body("File is empty");
            }
            if (file.getSize() > 10 * 1024 * 1024) {
                return ResponseEntity.status(HttpStatus.PAYLOAD_TOO_LARGE).body("File is too large! Maximum size is 10MB");
            }
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image/")) {
                return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("File must be an image");
            }

            // Lưu file mới và cập nhật URL trong ProductImage
            String fileName = storeFile(file);
            productImage.setImageUrl(fileName);
            productService.updateProductImage(productImageId, productImage);

            return ResponseEntity.ok().body(Response.success(null));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping(value = "uploads/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> uploadImages(@ModelAttribute("files") List<MultipartFile> files, @PathVariable("id") Long productId) {
        try {
            Product product = productService.getProduct(productId);
            //Nếu không có files thì tạo mảng rỗng
            files = files == null ? new ArrayList<MultipartFile>() : files;
            if (files.size() > ProductImage.MAXIMUM_IMAGE_PER_PRODUCT) {
                return ResponseEntity.badRequest().body("Cannot upload more than " + ProductImage.MAXIMUM_IMAGE_PER_PRODUCT + " images");
            }
            List<ProductImage> productImages = new ArrayList<>();
            for (MultipartFile file : files) {
                if (file != null) {
                    if (file.getSize() == 0) {
                        continue;
                    }
                    //Kiểm tra kích thước file và định dạng
                    if (file.getSize() > 10 * 1024 * 1024) {
                        return ResponseEntity.status(HttpStatus.PAYLOAD_TOO_LARGE).body("File is too large! Maximum size is 10MB");
                    }
                    String contentType = file.getContentType();
                    if (contentType == null || !contentType.startsWith("image/")) {
                        return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("File must be an image");
                    }
                    //Lưu file và cập nhật thumbnail trong DTO
                    String fileName = storeFile(file);
                    ProductImage productImage = productService.createProductImage(
                            product.getId(),
                            ProductImageDTO.builder()
                                    .imageUrl(fileName)
                                    .build()
                    );
                    productImages.add(productImage);
                }
            }
            return ResponseEntity.ok().body(productImages);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    public String storeFile(MultipartFile file) throws IOException {
        if (isImageFile(file) || file.getOriginalFilename() == null) {
            throw new IOException("Invalid image file");
        }
        String fileName = StringUtils.cleanPath((Objects.requireNonNull(file.getOriginalFilename())));
        //Thêm UUID vào trước tên file để đảm bảo tên file là duy nhất
        String uniqueFileName = UUID.randomUUID() + "_" + fileName;
        //Đường dẫn đến thư mục luu file
        Path uploadDir = Paths.get("uploads");

        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }
        //Đường dẫn đầy đủ đến file
        Path destination = Paths.get(uploadDir.toString(), uniqueFileName);

        //Sao chép file vào thư mục đích
        Files.copy(file.getInputStream(), destination, StandardCopyOption.REPLACE_EXISTING);

        return uniqueFileName;
    }

    private boolean isImageFile(MultipartFile file) {
        String contentType = file.getContentType();
        return contentType == null || !contentType.startsWith("image/");
    }

    @GetMapping
    public ResponseEntity<?> getProducts() {
        return ResponseEntity.ok().body(Response.success(productService.getAllProducts()));

    }

    @GetMapping("/search")
    public ResponseEntity<?> searchProducts(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "minPrice", required = false) Double minPrice,
            @RequestParam(value = "maxPrice", required = false) Double maxPrice,
            @RequestParam(value = "description", required = false) String description,
            @RequestParam(value = "categoryIds", required = false) List<Long> categoryIds,
            @RequestParam(value = "sortOrder", defaultValue = "-1") String sortOrder,
            @RequestParam("page") int page,
            @RequestParam("limit") int limit) {

        if (name != null && name.isEmpty()) {
            name = null;
        }

        if (categoryIds.isEmpty()) {
            categoryIds = null;
        }

        //Phan trang
        Page<Product> productPage = productService.searchProducts(name, minPrice, maxPrice, description, categoryIds, sortOrder, page, limit);
        int totalPages = productPage.getTotalPages();
        List<Product> products = productPage.getContent();
        
        return ResponseEntity.ok().body(Response.success(ProductResponse.builder().products(products).totalPages(totalPages).build()));
    }


    @GetMapping("/{id}")
    public ResponseEntity<?> getProductById(@PathVariable("id") Long productId) {
        try {
            return ResponseEntity.ok(productService.getProduct(productId));
        } catch (DataNotFoundException e) {
            return ResponseEntity.badRequest().body(Response.builder()
                    .message("Product not found")
                    .data(e.getMessage())
                    .build());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateProduct(@PathVariable("id") Long productId, @RequestBody ProductDTO productDTO) throws DataNotFoundException {
        //Goi function updateProduct ben ProductService
        Product product = productService.updateProduct(productId, productDTO);
        return ResponseEntity.ok().body(Response.success(product));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProduct(@PathVariable("id") Long productId) {
        productService.deleteProduct(productId);
        return ResponseEntity.ok("delete id=" + productId);
    }

    @PostMapping("/generateFakeProducts")
    public ResponseEntity<String> generateFakeProducts() {
        Faker faker = new Faker();
        for (int i = 0; i < 30; i++) {
            String productName = faker.commerce().productName();
            if (productService.existsByName(productName)) {
                continue;
            }
            ProductDTO productDTO = ProductDTO
                    .builder()
                    .name(productName)
                    .price((double) faker.number().numberBetween(100000, 9000000))
                    .description(faker.lorem().sentence())
                    .categoryId((long) faker.number().numberBetween(10000, 10005))
                    .build();
            try {
                productService.createProduct(productDTO);
            } catch (Exception e) {
                return ResponseEntity.badRequest().body(e.getMessage());
            }
        }
        return ResponseEntity.ok("generateFakeProducts");
    }

}
