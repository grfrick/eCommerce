package com.ecommerce.controller;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/productList")
    public String getProducts(Model model) {
        List<Product> products = productService.getProductList();
        model.addAttribute("products", products);

        Product product =  new Product();
        model.addAttribute("productSearch", product);

        return "productList";
    }

    @RequestMapping("/viewProduct/{productId}")
    public String viewProduct(@PathVariable int productId, Model model) throws IOException {
        Product product = productService.getProductById(productId);
        model.addAttribute("product", product);

        return "viewProduct";
    }

    @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
    public String searchProduct(@ModelAttribute("productSearch") Product product, Model model) throws IOException {
        product.setProductName(product.getProductName() + "%");

        List<Product> productList = productService.getProductByName(product.getProductName());
        model.addAttribute("products", productList);

        product.setProductName("");
        model.addAttribute("productSearch", product);

        return "productList";
    }

    @RequestMapping(value = "/getProducts", method = RequestMethod.GET)
    public @ResponseBody
    List<Product> getProducts(@RequestParam String productName) {
        return productService.getProductByName(productName);
    }
}
