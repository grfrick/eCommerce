package com.ecommerce.controller;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;


@Controller
public class AdminController {

	public static final String WEB_INF_RESOURCES_IMAGES = "//WEB-INF//resources//images//";
	public static final String IMG_EXTENSION = ".png";
	public static final String FULL_PTAH = "/Desenv/Workspace/jobs/eCommerce/src/main/webapp";

	private Path path;
	
	@Autowired
	private ProductDao productDao;

	@RequestMapping("/admin")
	public String adminPage() {
		return "admin";
	}

	@RequestMapping("/admin/productInventory")
	public String productInventory(Model model){
		List<Product> products = productDao.getAllProducts();
		model.addAttribute("products", products);
		return "productInventory";
	}

	@RequestMapping("/admin/productInventory/addProduct")
	public String addProduct(Model model){
		Product product = new Product();
		product.setProductCategory("tablet");
		product.setProductCondition("novo");
		product.setProductStatus("ativo");
		model.addAttribute("product", product);
		return "addProduct";
	}

	@RequestMapping(value = "/admin/productInventory/addProduct", method = RequestMethod.POST)
	public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result, HttpServletRequest request) throws URISyntaxException {
		if(result.hasErrors()){
			return "addProduct";
		}

		productDao.addProduct(product);
		MultipartFile productImage = product.getProductImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + WEB_INF_RESOURCES_IMAGES + product.getProductID() + 	IMG_EXTENSION);
		
		if(null != productImage && !productImage.isEmpty()){
			try{
				productImage.transferTo(new File(path.toString()));
			} catch(Exception e){
				e.printStackTrace();
				throw new RuntimeException("Salvar imagem do produto falhou.", e);
			}
		}
		return "redirect:/admin/productInventory";
	}

	@RequestMapping("/admin/productInventory/deleteProduct/{productID}")
	public String deleteProduct(@PathVariable String productID, Model model, HttpServletRequest request){
		String rootDirectory = FULL_PTAH;
		path = Paths.get(rootDirectory + WEB_INF_RESOURCES_IMAGES + productID + IMG_EXTENSION);

		if(Files.exists(path)){
			try{
				Files.delete(path);
			} catch(IOException e){
				e.printStackTrace();
			}
		}
		productDao.deleteProduct(productID);
		return "redirect:/admin/productInventory";
	}
	
	@RequestMapping("/admin/productInventory/editProduct/{id}")
	public String editProduct(@PathVariable("id") String id, Model model) {
		Product product = productDao.getProductByID(id);
		model.addAttribute(product);
		return "editProduct";
	}
	
	@RequestMapping(value = "/admin/productInventory/editProduct", method = RequestMethod.POST)
	public String editProduct(@Valid @ModelAttribute("product") Product product, Model model, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()){
			return "editProduct";
		}

		MultipartFile productImage = product.getProductImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + WEB_INF_RESOURCES_IMAGES + product.getProductID() + IMG_EXTENSION);

		if(null != productImage && !productImage.isEmpty()){
			try{
				productImage.transferTo(new File(path.toString()));
			} catch(Exception e){
				throw new RuntimeException("Salvar imagem do produto falhou", e);
			}
		}
		
		productDao.editProduct(product);
		return "redirect:/admin/productInventory";
	}
}