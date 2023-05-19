package vn.iotstar.entity;

import java.sql.Time;
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
@Table(name = "[CallDetail]")
public class CallDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@OneToOne
	@JoinColumn(name = "callId")
	private Call call;
	
	private String typeCall;
	
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "hh:mi:ss.S")
	private Date timeOnQueue;
	
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "hh:mi:ss.S")
	private Date timeAbandoned;
	
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "hh:mi:ss.S")
	private Date waitTime;
	
	private float serviceLevel;
	
	@Column(columnDefinition = "nvarchar(255)")
	private String callContent;
	
	@OneToOne
	@JoinColumn(name = "feedBackId")
	private FeedBackDetail feedBackDetail;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "YYYY-MM-DD hh:mi:ss")
	private Date createAt;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "YYYY-MM-DD hh:mi:ss")
	private Date updateAt;
	
}
