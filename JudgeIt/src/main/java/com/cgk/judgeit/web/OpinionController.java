package com.cgk.judgeit.web;
import com.cgk.judgeit.domain.Opinion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/opinions")
@Controller
@RooWebScaffold(path = "opinions", formBackingObject = Opinion.class)
public class OpinionController {
}
