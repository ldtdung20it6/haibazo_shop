package com.haibazo.service;

import java.util.List;
import java.util.ArrayList;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haibazo.model.DetaiProductSize;
import com.haibazo.model.Detail;
import com.haibazo.model.DetailProductColor;
import com.haibazo.model.DetailProductImageDescription;
import com.haibazo.model.Product;
import com.haibazo.model.Rating;
import com.haibazo.model.Review;
import com.haibazo.repository.ProductRepository;
import com.haibazo.repository.RatingRepository;
import com.haibazo.repository.ReviewRepository;

@Service
public class ProductServiceImp implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private RatingRepository ratingRepository;

    @Autowired
    private ReviewRepository reviewRepository;


    @Override
    public List<Product> findAllProduct() {
        return productRepository.findAll();
    }

    @Override
    public Product createProduct(Product reqBody) {
        Product product = new Product();
        product.setProduct_name(reqBody.getProduct_name());
        product.setProduct_image(reqBody.getProduct_image());
        product.setOriginal_price(reqBody.getOriginal_price());
        product.setPromotional_price(reqBody.getPromotional_price());

        Rating rating = new Rating();
        rating.setRating(reqBody.getRating().getRating());

        List<Review> reviews = new ArrayList<>();
        for (Review reviewReq : reqBody.getRating().getReview()) {
            Review review = new Review();
            review.setComment(reviewReq.getComment());
            review.setComment_image(reviewReq.getComment_image());
            review.setComment_video(reviewReq.getComment_video());
            review.setRating(rating);
            reviews.add(review);
        }
        rating.setReview(reviews);
        rating.setProduct(product);
        product.setRating(rating);

        Detail detail = new Detail();
        detail.setProduct_description(reqBody.getDetail().getProduct_description());
        detail.setProduct_hurry_up(reqBody.getDetail().getProduct_hurry_up());

        List<DetailProductImageDescription> imageDescriptions = new ArrayList<>();
        for (DetailProductImageDescription img : reqBody.getDetail().getProduct_image_description()) {
            DetailProductImageDescription newImg = new DetailProductImageDescription();
            newImg.setUrlImage(img.getUrlImage());
            newImg.setDetail(detail);
            imageDescriptions.add(newImg);
        }
        detail.setProduct_image_description(imageDescriptions);

        List<DetailProductColor> colors = new ArrayList<>();
        for (DetailProductColor color : reqBody.getDetail().getProduct_color()) {
            DetailProductColor newColor = new DetailProductColor();
            newColor.setColor(color.getColor());
            newColor.setDetail(detail);
            colors.add(newColor);
        }
        detail.setProduct_color(colors);

        List<DetaiProductSize> sizes = new ArrayList<>();
        for (DetaiProductSize size : reqBody.getDetail().getProduct_size()) {
            DetaiProductSize newSize = new DetaiProductSize();
            newSize.setSize(size.getSize());
            newSize.setDetail(detail);
            sizes.add(newSize);
        }
        detail.setProduct_size(sizes);

        product.setDetail(detail);

        return productRepository.save(product);
    }

    @Override
    public String deleteProduct(int productId) {
        // Tìm sản phẩm theo ID
        Optional<Product> optionalProduct = productRepository.findById(productId);

        // Kiểm tra xem sản phẩm có tồn tại hay không
        if (!optionalProduct.isPresent()) {
            throw new RuntimeException("Product not found");
        }

        Product product = optionalProduct.get();

        // Lấy Rating liên quan đến sản phẩm
        Rating rating = product.getRating();

        // Xóa các Review liên quan
        if (rating != null && rating.getReview() != null) {
            for (Review review : rating.getReview()) {
                // Xóa Review
                reviewRepository.delete(review);
            }
        }

        // Xóa Rating nếu tồn tại
        if (rating != null) {
            rating.setProduct(null); // Thiết lập lại liên kết đến Product
            ratingRepository.delete(rating); // Xóa Rating
        }

        // Xóa sản phẩm
        productRepository.delete(product);
        return "Product has been deleted";
    }

    @Override
    public Product updateProduct(int productId, Product reqBody) {
        // Tìm sản phẩm hiện tại trong cơ sở dữ liệu
        Product existingProduct = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + productId));

        // Cập nhật các trường cơ bản
        existingProduct.setProduct_name(reqBody.getProduct_name());
        existingProduct.setProduct_image(reqBody.getProduct_image());
        existingProduct.setOriginal_price(reqBody.getOriginal_price());
        existingProduct.setPromotional_price(reqBody.getPromotional_price());

        // Cập nhật hoặc tạo mới Rating
        Rating existingRating = existingProduct.getRating();
        if (existingRating == null) {
            existingRating = new Rating();
        }
        existingRating.setRating(reqBody.getRating().getRating());

        // Cập nhật danh sách Review
        List<Review> updatedReviews = new ArrayList<>();
        for (Review reviewReq : reqBody.getRating().getReview()) {
            Review review = new Review();
            review.setComment(reviewReq.getComment());
            review.setComment_image(reviewReq.getComment_image());
            review.setComment_video(reviewReq.getComment_video());
            review.setRating(existingRating);
            updatedReviews.add(review);
        }
        existingRating.setReview(updatedReviews);
        existingRating.setProduct(existingProduct); // Gắn lại sản phẩm cho rating
        existingProduct.setRating(existingRating); // Gắn lại rating cho sản phẩm

        // Cập nhật Detail
        Detail existingDetail = existingProduct.getDetail();
        if (existingDetail == null) {
            existingDetail = new Detail();
        }
        existingDetail.setProduct_description(reqBody.getDetail().getProduct_description());
        existingDetail.setProduct_hurry_up(reqBody.getDetail().getProduct_hurry_up());

        // Cập nhật danh sách hình ảnh
        List<DetailProductImageDescription> imageDescriptions = new ArrayList<>();
        for (DetailProductImageDescription img : reqBody.getDetail().getProduct_image_description()) {
            DetailProductImageDescription newImg = new DetailProductImageDescription();
            newImg.setUrlImage(img.getUrlImage());
            newImg.setDetail(existingDetail);
            imageDescriptions.add(newImg);
        }
        existingDetail.setProduct_image_description(imageDescriptions);

        // Cập nhật danh sách màu sắc
        List<DetailProductColor> colors = new ArrayList<>();
        for (DetailProductColor color : reqBody.getDetail().getProduct_color()) {
            DetailProductColor newColor = new DetailProductColor();
            newColor.setColor(color.getColor());
            newColor.setDetail(existingDetail);
            colors.add(newColor);
        }
        existingDetail.setProduct_color(colors);

        // Cập nhật danh sách kích thước
        List<DetaiProductSize> sizes = new ArrayList<>();
        for (DetaiProductSize size : reqBody.getDetail().getProduct_size()) {
            DetaiProductSize newSize = new DetaiProductSize();
            newSize.setSize(size.getSize());
            newSize.setDetail(existingDetail);
            sizes.add(newSize);
        }
        existingDetail.setProduct_size(sizes);

        // Gắn lại detail cho sản phẩm
        existingProduct.setDetail(existingDetail);

        // Lưu sản phẩm đã cập nhật
        return productRepository.save(existingProduct);
    }

    @Override
    public Product findProductById(int productId) {
        Optional<Product> optionalProduct = productRepository.findById(productId);
        if (!optionalProduct.isPresent()) {
            throw new RuntimeException("Product not found with id: " + productId);
        }
        return optionalProduct.get();
    }

}
