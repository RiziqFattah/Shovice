package com.example.login.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Request {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)

    private Long id;

    private String req_name;
    private String scope;
    private String type;
	
	  private String price; 
	  private String location; 
	  private String description;

	 

    public Request() {
    	super();
    }

    public Request(long id, String req_name, String scope, String type, String price, String location, String description) {
    	
    	super();
        this.id = id;
        this.req_name = req_name;
        this.scope = scope;
        this.type = type;
		
		  this.price = price; 
		  this.location = location; 
		  this.description = description;

		 
    }
    
    

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReq_name() {
        return this.req_name;
    }

    public void setReq_name(String req_name) {
        this.req_name = req_name;
    }

    public String getScope() {
        return this.scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

	
	  public String getPrice() { return this.price; }
	  
	  public void setPrice(String price) { this.price = price; }
	  
	  public String getLocation() { return this.location; }
	  
	  public void setLocation(String location) { this.location = location; }
	  
	  public String getDescription() { return this.description; }
	  
	  public void setDescription(String description) { this.description = description; }
	  

	 
}
