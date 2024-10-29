package com.app.services;

import com.app.dtos.CategoryDTO;
import com.app.models.Category;

import java.util.List;

public interface ICategoryService {
    Category createCategory(CategoryDTO category);

    Category getCategory(long id);

    List<Category> getAllCategories();

    Category updateCategory(long categoryId, CategoryDTO category);

    void deleteCategory(long id);
}
