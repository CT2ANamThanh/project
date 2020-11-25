/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends  CrudRepository<ProductEntity, Integer>{
    ProductEntity findById(int id);
    @Query(value="select p from ProductEntity p where p.provider.id=?1")
     List<ProductEntity> findByProviderId(int id);
    @Query(value="select p from ProductEntity p where p.categories.id=?1")
    List<ProductEntity> getProductByCategoriesId(int categoriesId);
    List<ProductEntity> findByNameLike(String name);
    @Query(value="Select * From product ORDER BY productDate  DESC limit 4",nativeQuery = true)
    List<ProductEntity> findNewProduct();
    //@Query(value="Select * From oderdetails ORDER BY quantity  DESC limit 4",nativeQuery = true)
    //List<ProductEntity> findSellingProduct();   
   @Query(value="select * from product where id in (select productId " +
                    "from orderdetails " +
                    "group by productId " +
                    "order by sum(quantity) Desc) limit 4 ",nativeQuery = true) 
   List<ProductEntity> findSellingProduct(); 
   //List<ProductEntity> findCategory(int id);
   @Query(value = "select * from product where name like ?1", nativeQuery= true)
    List<ProductEntity> getProductByNameLike(String name);
}
