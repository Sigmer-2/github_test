package com.zlk.zlkproject.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 文章分类关联表
 *
 * @author liuyanzhao
 */
@Data
public class ArticleCategoryRef implements Serializable {

    private static final long serialVersionUID = -6809206515467725995L;

    private Integer articleId;

    private Integer categoryId;

    //注入Category
    private Category category;

    public ArticleCategoryRef() {
    }

    public ArticleCategoryRef(Integer articleId, Integer categoryId) {
        this.articleId = articleId;
        this.categoryId = categoryId;
    }
}