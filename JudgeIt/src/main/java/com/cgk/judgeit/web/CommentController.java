package com.cgk.judgeit.web;
import com.cgk.judgeit.domain.Comment;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/comments")
@Controller
@RooWebScaffold(path = "comments", formBackingObject = Comment.class)
public class CommentController {
}
