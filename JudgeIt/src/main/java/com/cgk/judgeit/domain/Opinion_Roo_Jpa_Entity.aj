// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cgk.judgeit.domain;

import com.cgk.judgeit.domain.Opinion;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Opinion_Roo_Jpa_Entity {
    
    declare @type: Opinion: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Opinion.id;
    
    @Version
    @Column(name = "version")
    private Integer Opinion.version;
    
    public Long Opinion.getId() {
        return this.id;
    }
    
    public void Opinion.setId(Long id) {
        this.id = id;
    }
    
    public Integer Opinion.getVersion() {
        return this.version;
    }
    
    public void Opinion.setVersion(Integer version) {
        this.version = version;
    }
    
}
