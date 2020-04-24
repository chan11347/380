package ouhk.comps380f.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import ouhk.comps380f.dao.PollRepository;

@Controller
public class PollController {
    
    @Resource
    PollRepository pollRepo;
    
    
    
    
}
