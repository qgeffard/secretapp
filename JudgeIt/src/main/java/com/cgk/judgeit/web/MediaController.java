package com.cgk.judgeit.web;
import com.cgk.judgeit.domain.Media;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/medias")
@Controller
@RooWebScaffold(path = "medias", formBackingObject = Media.class)
public class MediaController {
}
