// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cgk.judgeit.domain;

import com.cgk.judgeit.domain.Video;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Video_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Video.fieldNames4OrderClauseFilter = java.util.Arrays.asList("link");
    
    public static long Video.countVideos() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Video o", Long.class).getSingleResult();
    }
    
    public static List<Video> Video.findAllVideos() {
        return entityManager().createQuery("SELECT o FROM Video o", Video.class).getResultList();
    }
    
    public static List<Video> Video.findAllVideos(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Video o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Video.class).getResultList();
    }
    
    public static Video Video.findVideo(Long id) {
        if (id == null) return null;
        return entityManager().find(Video.class, id);
    }
    
    public static List<Video> Video.findVideoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Video o", Video.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Video> Video.findVideoEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Video o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Video.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Video Video.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Video merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}