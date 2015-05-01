// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cgk.judgeit.web;

import com.cgk.judgeit.domain.Judge;
import com.cgk.judgeit.domain.Opinion;
import com.cgk.judgeit.domain.Rank;
import com.cgk.judgeit.domain.Topic;
import com.cgk.judgeit.web.JudgeController;
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

privileged aspect JudgeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String JudgeController.create(@Valid Judge judge, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, judge);
            return "judges/create";
        }
        uiModel.asMap().clear();
        judge.persist();
        return "redirect:/judges/" + encodeUrlPathSegment(judge.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String JudgeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Judge());
        return "judges/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String JudgeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("judge", Judge.findJudge(id));
        uiModel.addAttribute("itemId", id);
        return "judges/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String JudgeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("judges", Judge.findJudgeEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Judge.countJudges() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("judges", Judge.findAllJudges(sortFieldName, sortOrder));
        }
        return "judges/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String JudgeController.update(@Valid Judge judge, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, judge);
            return "judges/update";
        }
        uiModel.asMap().clear();
        judge.merge();
        return "redirect:/judges/" + encodeUrlPathSegment(judge.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String JudgeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Judge.findJudge(id));
        return "judges/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String JudgeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Judge judge = Judge.findJudge(id);
        judge.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/judges";
    }
    
    void JudgeController.populateEditForm(Model uiModel, Judge judge) {
        uiModel.addAttribute("judge", judge);
        uiModel.addAttribute("opinions", Opinion.findAllOpinions());
        uiModel.addAttribute("ranks", Rank.findAllRanks());
        uiModel.addAttribute("topics", Topic.findAllTopics());
    }
    
    String JudgeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
