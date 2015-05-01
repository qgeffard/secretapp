package com.cgk.judgeit.web;
import com.cgk.judgeit.domain.Video;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/videos")
@Controller
@RooWebScaffold(path = "videos", formBackingObject = Video.class)
public class VideoController {
}
