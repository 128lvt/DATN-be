package com.app.services;

import com.app.models.Category;

import java.util.List;

public interface ICategoryService {
    Category getCategory(Category category);

    Category getCategory(long id);

    List<Category> getAllCategories();

    Category updateCategory(long categoryId, Category category);

    void deleteCategory(long id);
}
