// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cgk.judgeit.domain;

import com.cgk.judgeit.domain.Opinion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Opinion_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Opinion.entityManager;
    
    public static final List<String> Opinion.fieldNames4OrderClauseFilter = java.util.Arrays.asList("author", "referent", "owner", "status");
    
    public static final EntityManager Opinion.entityManager() {
        EntityManager em = new Opinion().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Opinion.countOpinions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Opinion o", Long.class).getSingleResult();
    }
    
    public static List<Opinion> Opinion.findAllOpinions() {
        return entityManager().createQuery("SELECT o FROM Opinion o", Opinion.class).getResultList();
    }
    
    public static List<Opinion> Opinion.findAllOpinions(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Opinion o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Opinion.class).getResultList();
    }
    
    public static Opinion Opinion.findOpinion(Long id) {
        if (id == null) return null;
        return entityManager().find(Opinion.class, id);
    }
    
    public static List<Opinion> Opinion.findOpinionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Opinion o", Opinion.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Opinion> Opinion.findOpinionEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Opinion o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Opinion.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Opinion.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Opinion.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Opinion attached = Opinion.findOpinion(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Opinion.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Opinion.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Opinion Opinion.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Opinion merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
