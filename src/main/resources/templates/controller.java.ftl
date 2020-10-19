package ${package.Controller};

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import ${package.Service}.${table.serviceName};

@RestController
@RequestMapping("/${table.entityPath}")
public class ${table.controllerName} {

	@Autowired
	private ${table.serviceName} ${table.entityPath}Service;
	
	

}
