package com.cgk.judgeit.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Topic {

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date lastUpdate;

    /**
     */
    @ManyToOne
    private Judge author;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "referent")
    private List<Opinion> opinions = new ArrayList<Opinion>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ownerTopic")
    private List<Media> medias = new ArrayList<Media>();
}
