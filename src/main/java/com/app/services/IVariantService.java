package com.app.services;

import com.app.dtos.ProductVariantDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.ProductVariant;

public interface IVariantService {
    public ProductVariant create(ProductVariantDTO productVariantDTO) throws DataNotFoundException;
}
