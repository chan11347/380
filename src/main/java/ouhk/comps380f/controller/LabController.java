package ouhk.comps380f.controller;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ouhk.comps380f.dao.LabRepository;
import ouhk.comps380f.service.TicketService;

@Controller
@RequestMapping("/lab")
public class LabController {
    
    @Resource
    LabRepository labRepo;
    
    @Autowired
    private TicketService ticketService;

    @GetMapping({"", "lab"})
    public String list(ModelMap model) {
        model.addAttribute("ticketDatabase", ticketService.getTickets());
        return "lab";
    }
}
