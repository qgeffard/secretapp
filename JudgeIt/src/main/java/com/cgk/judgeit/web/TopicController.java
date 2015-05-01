package com.cgk.judgeit.web;
import com.cgk.judgeit.domain.Topic;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/topics")
@Controller
@RooWebScaffold(path = "topics", formBackingObject = Topic.class)
public class TopicController {
}
