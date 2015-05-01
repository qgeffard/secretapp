package com.cgk.judgeit.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Comment extends Opinion {

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date lastUpdate;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ownerComment")
    private List<Media> medias = new ArrayList<Media>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "owner")
    private List<Opinion> childOpinions = new ArrayList<Opinion>();
}
