package com.cgk.judgeit.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Opinion {

	/**
     */
	@ManyToOne
	protected Judge author;

	/**
     */
	@ManyToOne
	protected Topic referent;

	/**
     */
	@ManyToOne
	protected Comment owner;

	/**
     */
	@Enumerated
	protected Status status;
}
