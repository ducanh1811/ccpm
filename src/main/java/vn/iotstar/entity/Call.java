package vn.iotstar.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "[Call]")
public class Call {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "agentId")
	private Agent agent;
	
	@Column(columnDefinition = "varchar(20)")
	private String phone;
	
	private Boolean callOffer;
	
	private Boolean callResponse;
	
	private Boolean businessHours;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "YYYY-MM-DD hh:mi:ss")
	private Date createAt;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "YYYY-MM-DD hh:mi:ss")
	private Date updateAt;
	
	//mapping to Call Conversation
	@OneToOne(mappedBy = "call")
	private CallConversation callConversation;
	
	//mapping to CallDetail
	@OneToOne(mappedBy = "call")
	private CallDetail callDetail;
	
	//mapping to FeedBackDetail
	@OneToOne(mappedBy = "call")
	private FeedBackDetail feedBackDetail;

}
