package vn.iotstar.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "[Customer]")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String name;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date dob;
	
	@Column(columnDefinition = "varchar(20)")
	private String phone;
	
	@Column(columnDefinition = "nvarchar(255)")
	private String address;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String email;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String jobTitle;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "YYYY-MM-DD hh:mi:ss")
	private Date createAt;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "YYYY-MM-DD hh:mi:ss")
	private Date updateAt;
	
	//mapping to 
}
