package vn.iotstar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer>{

}
