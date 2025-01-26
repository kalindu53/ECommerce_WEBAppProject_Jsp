package org.example.customertest;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CategoryDTO {
    private int code;
    private String name;
    private int qty;
    private String imagePath;

    public CategoryDTO(int code, String name, int qty, String imagePath) {
        this.code = code;
        this.name = name;
        this.qty = qty;
        this.imagePath = imagePath;
    }

}
