// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cgk.judgeit.web;

import com.cgk.judgeit.domain.Comment;
import com.cgk.judgeit.domain.Media;
import com.cgk.judgeit.domain.Topic;
import com.cgk.judgeit.web.MediaController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MediaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MediaController.create(@Valid Media media, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, media);
            return "medias/create";
        }
        uiModel.asMap().clear();
        media.persist();
        return "redirect:/medias/" + encodeUrlPathSegment(media.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MediaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Media());
        return "medias/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MediaController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("media", Media.findMedia(id));
        uiModel.addAttribute("itemId", id);
        return "medias/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MediaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("medias", Media.findMediaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Media.countMedias() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("medias", Media.findAllMedias(sortFieldName, sortOrder));
        }
        return "medias/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MediaController.update(@Valid Media media, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, media);
            return "medias/update";
        }
        uiModel.asMap().clear();
        media.merge();
        return "redirect:/medias/" + encodeUrlPathSegment(media.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MediaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Media.findMedia(id));
        return "medias/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MediaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Media media = Media.findMedia(id);
        media.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/medias";
    }
    
    void MediaController.populateEditForm(Model uiModel, Media media) {
        uiModel.addAttribute("media", media);
        uiModel.addAttribute("comments", Comment.findAllComments());
        uiModel.addAttribute("topics", Topic.findAllTopics());
    }
    
    String MediaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
