package component;

import entity.OrderDetailsEntity;
import entity.ProductEntity;
import java.text.NumberFormat;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@Scope(value = "session")
public class Cart {
    private List<OrderDetailsEntity> orderDetailsList;

    public Cart() {
        orderDetailsList = new ArrayList<OrderDetailsEntity>();
    }
    public void addItem(ProductEntity product){
        boolean t=false;
        for (int i=0; i<orderDetailsList.size(); i++){
            if (orderDetailsList.get(i).getProduct().getId()==product.getId()){
                OrderDetailsEntity orderDetails = orderDetailsList.get(i);
                orderDetails.setQuantity(orderDetails.getQuantity() +1);
                orderDetailsList.set(i,orderDetails);
                t=true;
            }
        }
        if(!t){
            OrderDetailsEntity orderDetails = new OrderDetailsEntity();
            orderDetails.setProduct(product);
            orderDetails.setQuantity(1);
            orderDetails.setUnitPrice(product.getPrice());
            orderDetailsList.add(orderDetails);
        }
    }
   //Remove Item
    public void removeItem(ProductEntity product) {
        for (int i = 0; i < orderDetailsList.size(); i++) {
            if (orderDetailsList.get(i).getProduct().getId() == product.getId()) {
                orderDetailsList.remove(i);
            }
        }
    }
    //Tol Amount


    public List<OrderDetailsEntity> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetailsEntity> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }
 public int getCount(){
        return orderDetailsList.size();
 }
 public double getTotal(){
        double sum = 0;
        for(OrderDetailsEntity orderDeatails:orderDetailsList){
            sum = sum+ orderDeatails.getTotal();
        }
        return sum;
    }
 
}
