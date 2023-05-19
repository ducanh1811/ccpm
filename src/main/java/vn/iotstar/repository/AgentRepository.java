package vn.iotstar.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Agent;

@Repository
public interface AgentRepository extends JpaRepository<Agent, Integer> {
	Optional<Agent> findByEmail(String email);
}
