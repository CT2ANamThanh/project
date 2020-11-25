
package repository;

import entity.OrderEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer>{
    //List<OrderEntity> getProductByCreditCartId(int creditCardId);
    OrderEntity findById(int id);
}
