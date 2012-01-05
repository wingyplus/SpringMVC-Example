package xyz.sample.baremvc;

import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping(value="/")
    public String home() {
    	System.out.println("HomeController: Passing through..." + new Date());
    	return "home";
    }
}
