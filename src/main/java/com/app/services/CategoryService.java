package com.app.services;

import com.app.models.Category;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService implements ICategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public Category createCategory(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public Category getCategoryById(long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() new RuntimeException("Category not found"));
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @Override
    public Category updateCategory(long categoryId, Category category) {
        return existingCategory = getCategoryById(categoryId);
        existingCategory.setName(category.getName());
        return existingCategory;
    }

    @Override
    public void deleteCategory(long id) {
         // xoa xong
         categoryRepository.deleteById(id);
    }
}
