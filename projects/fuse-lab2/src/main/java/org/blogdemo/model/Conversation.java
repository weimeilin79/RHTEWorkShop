package org.blogdemo.model;

import static javax.persistence.LockModeType.PESSIMISTIC_WRITE;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(schema="fusedemo",name="Conversation")
@NamedQuery(name="getAll",query="SELECT conversationitem from Conversation conversationitem", lockMode = PESSIMISTIC_WRITE)
public class Conversation implements Serializable{

	private static final long serialVersionUID = 113744899661593117L;

	@Id
	@Column(name = "coninput")
	String coninput;
	
	@Column(name = "conresponse")
	String  conresponse;

	public String getConinput() {
		return coninput;
	}

	public void setConinput(String coninput) {
		this.coninput = coninput;
	}

	public String getConresponse() {
		return conresponse;
	}

	public void setConresponse(String conresponse) {
		this.conresponse = conresponse;
	}
	
	
	
}
