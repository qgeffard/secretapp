package com.cgk.judgeit.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Media {

	/**
     */
	protected String text;

	/**
     */
	@ManyToOne
	protected Topic ownerTopic;

	/**
     */
	@ManyToOne
	protected Comment ownerComment;
}
