package com.cgk.judgeit.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Judge {

    /**
     */
    private String password;

    /**
     */
    private int score;

    /**
     */
    private String email;

    /**
     */
    private String login;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "author")
    private List<Opinion> opinions = new ArrayList<Opinion>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "author")
    private List<Topic> topics = new ArrayList<Topic>();

    /**
     */
    @ManyToOne
    private Rank rank;
}
