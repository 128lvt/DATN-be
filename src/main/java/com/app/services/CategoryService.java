package com.project.shopapp.service.category;

import com.project.shopapp.dto.CategoryDTO;
import com.project.shopapp.model.Category;
import com.project.shopapp.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public Category createCategory(CategoryDTO categoryDTO) {
        Category category = Category.builder()
                .name(categoryDTO.getName())
                .build();
        //Luu vao database
        return categoryRepository.save(category);
    }


    public Category getCategoryById(Long id) {
        return categoryRepository.findById(id).orElseThrow(() -> new RuntimeException("Category not found"));
    }


    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }


    public void updateCategory(Long id, CategoryDTO categoryDTO) {
        //Tim category
        Category existingCategory = getCategoryById(id);
        existingCategory.setName(categoryDTO.getName());
        //Luu vao database
        categoryRepository.save(existingCategory);
    }


    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }
}
