package com.cgk.judgeit.web;
import com.cgk.judgeit.domain.Rank;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ranks")
@Controller
@RooWebScaffold(path = "ranks", formBackingObject = Rank.class)
public class RankController {
}
