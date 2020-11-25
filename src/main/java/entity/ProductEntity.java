package entity;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "product")
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private double price;
    
    private String screen;
    private String resolution;
    
    private String screenType;

    private String cpu;
    private String ram;
    private String system;
    private String frontCamera;
    private String rearCamera;
    private String internalMemory;

    private String graphicsChip;
    private String weight;
    private String battery;
    private String image;
    private String info;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate productDate;
   

    public CategoriesEntity getCategories() {
        return categories;
    }
    public void setCategories(CategoriesEntity categories) {
        this.categories = categories;
    }  
   
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    List<OrderDetailsEntity> orderDetailsList;
    @ManyToOne
    @JoinColumn(name = "providerId")
    private ProviderEntity provider;
    @ManyToOne
    @JoinColumn(name = "categoriesId")
    private CategoriesEntity categories;

    public ProductEntity() {
    }

    public String getInternalMemory() {
        return internalMemory;
    }

    public void setInternalMemory(String internalMemory) {
        this.internalMemory = internalMemory;
    }

    public LocalDate getOrderDate() {
        return productDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.productDate = productDate;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public LocalDate getProductDate() {
        return productDate;
    }

    public void setProductDate(LocalDate productDate) {
        this.productDate = productDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

  

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

 
    public String getScreenType() {
        return screenType;
    }

    public void setScreenType(String screenType) {
        this.screenType = screenType;
    }

  

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getSystem() {
        return system;
    }

    public void setSystem(String system) {
        this.system = system;
    }

    public String getFrontCamera() {
        return frontCamera;
    }

    public void setFrontCamera(String frontCamera) {
        this.frontCamera = frontCamera;
    }

    public String getRearCamera() {
        return rearCamera;
    }

    public void setRearCamera(String rearCamera) {
        this.rearCamera = rearCamera;
    }

    public String getInternalMenory() {
        return internalMemory;
    }

    public void setInternalMenory(String internalMenory) {
        this.internalMemory = internalMenory;
    }

 

    public String getGraphicsChip() {
        return graphicsChip;
    }

    public void setGraphicsChip(String graphicsChip) {
        this.graphicsChip = graphicsChip;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public List<OrderDetailsEntity> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetailsEntity> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }

    public ProviderEntity getProvider() {
        return provider;
    }

    public void setProvider(ProviderEntity provider) {
        this.provider = provider;
    }

   
       public String getPriceFormatted(){
        NumberFormat numberFormatter = NumberFormat.getNumberInstance();
        numberFormatter.setMinimumFractionDigits(0);      
        return numberFormatter.format(price);
    }

}
