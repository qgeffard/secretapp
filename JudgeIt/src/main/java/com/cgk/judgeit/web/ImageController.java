package com.cgk.judgeit.web;
import com.cgk.judgeit.domain.Image;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/images")
@Controller
@RooWebScaffold(path = "images", formBackingObject = Image.class)
public class ImageController {
}
