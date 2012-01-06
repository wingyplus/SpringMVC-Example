package xyz.sample.baremvc;

import java.util.Date;
import java.util.Comparator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class HomeController {
    @Autowired
    Comparator<String> comparator;

    @RequestMapping(value = "/")
    public String home() {
    	System.out.println("HomeController: Passing through..." + new Date());
		// render view name home
    	return "home";
    }

    @RequestMapping(value = "/compare", method = RequestMethod.GET)
    public String compare(@RequestParam("input1") String input1, 
            @RequestParam("input2") String input2, Model model) {

        int result = comparator.compare(input1, input2);
        String inEnglish = (result < 0) ? "less than" : (result > 0 ? "greather than" : "equal to");
        String output = "Accoding to our Comparator, '" + input1 + "' is " + inEnglish + "'" + input2 + "'";

        model.addAttribute("output", output);
        
        // bind view 'compareResult'
        return "compareResult";
    }

	@RequestMapping(value = "/mapping/path")
	public @ResponseBody String byPath() {
		return "Mapping by Path";
	}
	
	@RequestMapping(value = "/mapping/method", method = RequestMethod.GET)
	public @ResponseBody String byParameterAll() {
		return "Mapping by Method All";
	}
	
	// mapping parameter name foo
	@RequestMapping(value = "/mapping/parameter", method = RequestMethod.GET, params = "foo")
	public @ResponseBody String byParameter() {
		return "Mapping by Parameter foo";
	}
	
	@RequestMapping(value = "/mapping/parameter", method = RequestMethod.GET, params = "!foo")
	public @ResponseBody String byParameterNegation() {
		return "Mapping by Parameter (all parameter not foo)";
	}
	
	
	@RequestMapping(value = "/mapping/consumes", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody String byConsumes(@RequestBody JavaBean javaBean) {
		return "Mapping By path + method + consumable media type (JavaBean'" + javaBean + "')";
	}
	
	@RequestMapping(value = "/mapping/produces", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody JavaBean byProduces() {
		return new JavaBean();
	}
	
}
