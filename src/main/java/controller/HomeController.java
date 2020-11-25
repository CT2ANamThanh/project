package controller;

import component.Cart;
import entity.CategoriesEntity;
import entity.CustomerEntity;
import entity.OrderDetailsEntity;
import entity.OrderEntity;
import entity.ProductEntity;
import entity.ProviderEntity;
import entity.UserEntity;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import repository.CategoriesRepository;
import repository.CustomerRepository;
import repository.OrderDetailsRepository;
import repository.OrderRepository;
import repository.ProductRepository;
import repository.ProviderRepository;
import repository.UserRepository;

@Controller
public class HomeController {

    @Autowired
    ProductRepository productRepo;
    @Autowired
    CustomerRepository customerRepo;
    @Autowired
    ProviderRepository providerRepo;
    @Autowired
    OrderDetailsRepository orderDetailsRepo;
    @Autowired
    CategoriesRepository categoriesRepo;
 
   
    @Autowired
    OrderRepository orderRepo;

    @Autowired
    UserRepository userRepo;

    String fileNameMaster;

    @RequestMapping(value = "/")
    public String showHomePage(Model model) {
        List<ProviderEntity> providerList = (List<ProviderEntity>) providerRepo.findAll();
        List<ProductEntity> productList = (List<ProductEntity>) productRepo.findAll();
        List<ProductEntity> newProduct = (List<ProductEntity>) productRepo.findNewProduct();
        List<ProductEntity> sellingProduct = (List<ProductEntity>) productRepo.findSellingProduct();
        List<CategoriesEntity> categoriesList = (List<CategoriesEntity>) categoriesRepo.findAll();
        model.addAttribute("categoriesList", categoriesList);
        model.addAttribute("sellingProduct", sellingProduct);
        model.addAttribute("newProduct", newProduct);
        model.addAttribute("providerList", providerList);
        model.addAttribute("productList", productList);
        return "index";
    }

    //chi tiet san pham
    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String showProductDetails(@PathVariable(value = "id") int id, Model model) {
        ProductEntity product = productRepo.findById(id);
        model.addAttribute("product", product);

        return "detailsHomePage";
    }

    @RequestMapping(value = "/provider/{id}", method = RequestMethod.GET)
    public String showProduct(@PathVariable(value = "id") int id, Model model) {
        List<CategoriesEntity> categoriesList = (List<CategoriesEntity>) categoriesRepo.findAll();
        model.addAttribute("categoriesList", categoriesList);
        List<ProductEntity> productList = productRepo.findByProviderId(id);
        model.addAttribute("productList", productList);

        return "providerHomePage";
    }

    @RequestMapping(value = "/shopping/{categoriesId}", method = RequestMethod.GET)
    public String showCategoryProduct(@PathVariable(value = "categoriesId") int categoriesId, Model model) {
        List<CategoriesEntity> categoriesList = (List<CategoriesEntity>) categoriesRepo.findAll();
        model.addAttribute("categoriesList", categoriesList);
        List<ProductEntity> productList = productRepo.getProductByCategoriesId(categoriesId);
        model.addAttribute("productList", productList);

        return "shopping";
    }

    @RequestMapping(value = "/register", method = GET)
    public String showRegisterForm(Model model) {
        model.addAttribute("customer", new CustomerEntity());
        return "register";
    }

    @RequestMapping(value = "/addNewCustomer", method = POST)
    public String addNewCustomer(Model model, CustomerEntity customer) {
        model.addAttribute("customer", new CustomerEntity());

        customerRepo.save(customer);

        return "addNewCustomer";
    }

    //search sản phẩm
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchProductProcess(@RequestParam(name = "searchText") String searchText, Model model) {
        String searchText1 = "%" + searchText + "%";
        List<ProductEntity> productList = productRepo.findByNameLike(searchText1);
        List<ProviderEntity> providerList = (List<ProviderEntity>) providerRepo.findAll();
        model.addAttribute("providerList", providerList);
        model.addAttribute("productList", productList);
        model.addAttribute("searchText", searchText);
        return "search";
    }

    
    
}
