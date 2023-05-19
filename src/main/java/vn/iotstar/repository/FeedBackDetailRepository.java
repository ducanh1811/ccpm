package vn.iotstar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.FeedBackDetail;

@Repository
public interface FeedBackDetailRepository extends JpaRepository<FeedBackDetail, Integer>{

}
