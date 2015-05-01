package com.cgk.judgeit.web;
import com.cgk.judgeit.domain.Song;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/songs")
@Controller
@RooWebScaffold(path = "songs", formBackingObject = Song.class)
public class SongController {
}
