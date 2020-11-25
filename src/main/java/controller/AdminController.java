/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CustomerEntity;
import entity.OrderEntity;
import entity.ProductEntity;
import entity.ProviderEntity;
import entity.UserEntity;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import repository.CustomerRepository;
import repository.OrderRepository;
import repository.ProductRepository;
import repository.ProviderRepository;
import repository.UserRepository;

@Controller
public class AdminController {
    
    @Autowired
    CustomerRepository customerRepo;

    @Autowired
    ProductRepository productRepo;

    @Autowired
    ProviderRepository providerRepo;

    @Autowired
    OrderRepository orderRepo;

    @Autowired
    UserRepository userRepo;

    String fileNameMaster;
    @RequestMapping(value = "/admin", method = GET)
    public String showAdminForm(Model model) {
        //List<ProductEntity> productList = (List<ProductEntity>) productRepo.findAll();
        //model.addAttribute("productList", productList);
        return "admin4";
    }

    @RequestMapping(value = "/search1", method = RequestMethod.GET)
    public String searchProductProcess1(@RequestParam(name = "searchText") String searchText, Model model) {

        String searchText1 = "%" + searchText + "%";
        List<ProductEntity> productList = productRepo.getProductByNameLike(searchText1);
        model.addAttribute("productList", productList);
        model.addAttribute("searchText", searchText);
        return "product";
    }

    @RequestMapping(value = "/addNewProduct", method = RequestMethod.GET)
    public String showAddNewProduct(Model model) {
        List<ProviderEntity> providerList = (List<ProviderEntity>) providerRepo.findAll();
        model.addAttribute("product", new ProductEntity());

        model.addAttribute("providerList", providerList);

        setProviderDropDownList(model);

        return "addNewProduct";
    }

    @RequestMapping(value = "/addNewProduct", method = RequestMethod.POST)
    public String saveNewProduct(ProductEntity product, @RequestParam("file") MultipartFile file, Model model) {
        // ProviderEntity provider = providerRepo.findById(product.getProvider().getId());
        // product.setProvider(provider);
        try {
            byte[] bytes = file.getBytes();
            // Creating the directory to store file
            // Assume uploaded file location on web server is D:\file-upload
            String pathName = "D:\\CNTT\\JavaProject\\Project\\Project1\\Project1\\src\\main\\webapp\\images\\phone";
            File dir = new File(pathName);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // Create the file on server
            String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
            File serverFile = new File(fileSource);
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

            product.setImage(file.getOriginalFilename());
            model.addAttribute("product", product);
            productRepo.save(product);
            return "redirect:/product";
        } catch (Exception e) {
            System.out.println(e);
            String errorMessage = "Error when uploading file" + e;
            model.addAttribute("product", product);
            return "addNewProduct";
        }

    }

    @RequestMapping(value = "/delete1/{id}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable(name = "id") int id) {
        productRepo.deleteById(id);
        return "redirect:/product";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String showEditProduct(@PathVariable(value = "id") int id, Model model) {
        List<ProviderEntity> providerList = (List<ProviderEntity>) providerRepo.findAll();
        ProductEntity product = productRepo.findById(id);
        model.addAttribute("product", product);

        model.addAttribute("providerList", providerList);
        setProviderDropDownList(model);
        return "editProduct";
    }

    @RequestMapping(value = "/update1", method = RequestMethod.POST)
    public String updateProduct(ProductEntity product) {

        ProductEntity newProduct = productRepo.save(product);
        

        return "redirect:/product";
    }

    

    
    private void setProviderDropDownList(Model model) {
        List<ProviderEntity> providerList = (List<ProviderEntity>) providerRepo.findAll();
        if (!providerList.isEmpty()) {
            Map<Integer, String> providerMap = new LinkedHashMap<>();
            for (ProviderEntity providerEntity : providerList) {
                providerMap.put(providerEntity.getId(), providerEntity.getProviderName());
            }
            model.addAttribute("providerList", providerMap);
        }
    }

    //Customer Manager
    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String showManagerCustomer(Model model) {
        List<CustomerEntity> customerList = (List<CustomerEntity>) customerRepo.findAll();
        model.addAttribute("customerList", customerList);
        return "customer";
    }

    //Order Manager
    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public String showManagerOrder(Model model) {
        List<OrderEntity> orderList = (List<OrderEntity>) orderRepo.findAll();
        model.addAttribute("orderList", orderList);
        return "orders";
    }

    //Detail Product
    @RequestMapping(value = "/details1/{id}", method = RequestMethod.GET)
    public String showDetailProduct(@PathVariable(value = "id") int id, Model model) {
        List<ProviderEntity> providerList = (List<ProviderEntity>) providerRepo.findAll();
        ProductEntity product = productRepo.findById(id);
        model.addAttribute("product", product);

        // model.addAttribute("providerList", providerList);
        // setProviderDropDown(model);
        return "details";
    }

    //Detail Orders
    @RequestMapping(value = "/orderDetails2/{id}", method = RequestMethod.GET)
    public String showDetailOrders(@PathVariable(value = "id") int id, Model model) {
        List<ProviderEntity> providerList = (List<ProviderEntity>) providerRepo.findAll();
        OrderEntity order = orderRepo.findById(id);
        model.addAttribute("order", order);

        // model.addAttribute("providerList", providerList);
        // setProviderDropDown(model);
        return "orderDetails2";
    }

    //Provider Manager
    @RequestMapping(value = "/provider", method = RequestMethod.GET)
    public String showManagerProvider(Model model) {
        List<ProviderEntity> providerList = (List<ProviderEntity>) providerRepo.findAll();
        model.addAttribute("providerList", providerList);
        return "provider";
    }

    //Provider Add New
    @RequestMapping(value = "/addNewProvider", method = RequestMethod.GET)
    public String showAddNewProvider(Model model) {
        // ProviderEntity providerList = ProviderEntity providerRepo.findAll();
        ProviderEntity provider = new ProviderEntity();
        model.addAttribute("provider", provider);

        setProviderDropDownList(model);

        return "addNewProvider";
    }

    @RequestMapping(value = "/addNewProvider", method = RequestMethod.POST)
    public String saveNewProvider(ProviderEntity provider, Model model) {
        //ProviderEntity provider = providerRepo.findById(product.getProvider().getId());
        //product.setProvider(provider);

        providerRepo.save(provider);
        return "redirect:/provider";
    }

    //Provider Delete
    @RequestMapping(value = "/delete2/{id}", method = RequestMethod.GET)
    public String deleteProvider(@PathVariable(name = "id") int id) {
        providerRepo.deleteById(id);
        return "redirect:/provider";
    }

    //Provider Edit
    @RequestMapping(value = "/edit2/{id}", method = RequestMethod.GET)
    public String showEditProvider(@PathVariable(value = "id") int id, Model model) {

        ProviderEntity provider = providerRepo.findById(id);

        model.addAttribute("provider", provider);
        setProviderDropDownList(model);
        return "editProvider";
    }

    @RequestMapping(value = "/update2", method = RequestMethod.POST)
    public String updateProvider(ProviderEntity provider) {

        ProviderEntity newProvider = providerRepo.save(provider);

        return "redirect:/provider";
    }

    //User Manager
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String showManagerUser(Model model) {
        List<UserEntity> usersList = (List<UserEntity>) userRepo.findAll();
        model.addAttribute("usersList", usersList);
        return "user";
    }
    //Add New User
    @RequestMapping(value = "/addNewUser", method = RequestMethod.GET)
    public String showAddNewUser(Model model) {
        List<UserEntity> usersList = (List<UserEntity>) userRepo.findAll();
        model.addAttribute("users", new UserEntity());

        model.addAttribute("usersList", usersList);

        return "addNewUser";
    }
    @RequestMapping(value = "/addNewUser", method = RequestMethod.POST)
    public String saveNewProduct(UserEntity users, Model model) {
        userRepo.save(users);
        
       return "redirect:/user";
    }

    //Product Manager
    @RequestMapping(value = "/product", method = GET)
    public String showProductForm(Model model) {
        List<ProductEntity> productList = (List<ProductEntity>) productRepo.findAll();
        model.addAttribute("productList", productList);
        return "product";
    }

}
