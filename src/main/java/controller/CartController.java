package controller;

import component.Cart;
import entity.CategoriesEntity;
import entity.OrderDetailsEntity;
import entity.OrderEntity;
import entity.ProductEntity;
import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repository.CategoriesRepository;
import repository.OrderDetailsRepository;
import repository.OrderRepository;
import repository.ProductRepository;

@Controller
@Scope(value = "session")
public class CartController {

    @Autowired
    ProductRepository productRepo;

    @Autowired
    CategoriesRepository categoriesRepo;

    @Autowired
    OrderRepository orderRepo;

    @Autowired
    OrderDetailsRepository orderDetailsRepo;

    @Autowired
    Cart cart;
    
   

    @RequestMapping(value = "/cart/{id}", method = RequestMethod.GET)
    public String AddToCart(@PathVariable(value = "id") int id, Model model) {
        List<CategoriesEntity> categoriesList = (List<CategoriesEntity>) categoriesRepo.findAll();
        model.addAttribute("categoriesList", categoriesList);
        ProductEntity product = productRepo.findById(id);
        cart.addItem(product);

        model.addAttribute("orderDetailsList", cart.getOrderDetailsList());

        return "cart";
    }

    @RequestMapping(value = "/addToCart/{id}", method = RequestMethod.GET)
    public String addNewItem(@PathVariable(value = "id") int id, Model model) {
        ProductEntity product = (ProductEntity) productRepo.findById(id);
        cart.addItem(product);

        model.addAttribute("orderDetailsList", cart.getOrderDetailsList());

        return "cart";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String removeCarts(@PathVariable(value = "id") int id, Model model) {
        ProductEntity product = (ProductEntity) productRepo.findById(id);
        cart.removeItem(product);
        model.addAttribute("orderDetailsList", cart.getOrderDetailsList());
        return "cart";
    }

    //Update quantity
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateQuantity(Model model, @RequestParam(name = "id") int id,
            @RequestParam(name = "quantity") int quantity) {
        ProductEntity product = productRepo.findById(id);

        List<OrderDetailsEntity> orderDetailsList = cart.getOrderDetailsList();
        for (int i = 0; i < orderDetailsList.size(); i++) {
            if (orderDetailsList.get(i).getProduct().getId() == product.getId()) {
                OrderDetailsEntity orderDetail = orderDetailsList.get(i);
                orderDetail.setQuantity(quantity);
                orderDetailsList.set(i, orderDetail);
                cart.setOrderDetailsList(orderDetailsList);
            }
        }
        model.addAttribute("orderDetailsList", cart.getOrderDetailsList());
        return "cart";
    }

 

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(Model model) {

        model.addAttribute("cart", cart);

        model.addAttribute("orders", new OrderEntity()); 
        model.addAttribute("orderdetails", new OrderDetailsEntity());
        return "checkout"; 
    }

    @RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
    public String saveNewOrder(OrderEntity orders, Model model) {

        orders.setOrderDate(LocalDate.now());
        OrderEntity newOrder = orderRepo.save(orders);
        List<OrderDetailsEntity> orderDetailList = cart.getOrderDetailsList();
        for (OrderDetailsEntity orderDetails : orderDetailList) {
            orderDetails.setOrders(newOrder);
            orderDetailsRepo.save(orderDetails);
        }
           
        return "camon";
    }

}
