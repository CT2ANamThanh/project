
package repository;

import entity.OrderDetailsEntity;
import entity.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailsRepository extends CrudRepository<OrderDetailsEntity, Integer>{
   /* List<ProductEntity> findById(int id);
    
    @Query(value="Select * From orderdetails ORDER BY quantity  DESC ",nativeQuery = true)
    List<OrderDetailsEntity> findSellingProduct();*/
}
