package vn.iotstar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.CallConversation;

@Repository
public interface CallConversationRepository extends JpaRepository<CallConversation, Integer>{

}
