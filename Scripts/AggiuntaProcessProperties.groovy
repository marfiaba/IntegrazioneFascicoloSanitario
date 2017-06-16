import it.eng.spagic.util.*;
import org.apache.log4j.Logger;

Logger logger = Logger.getLogger('it.eng.adt.torino.AggiuntaProcessProperties.groovy');

try {
	logger.debug("starting AggiuntaProcessProperties...");

	ProcessProperties pp = ProcessUtils.getProcessProperties(componentContext.getNamingContext(), "FromADT2FSA");

	if (pp == null) throw new Exception("ProcessProperties not available!");
	
	outMessage.properties.put(ProcessProperties.KEY, pp);
} finally {
	outMessage.bodyText = inMessage.bodyText;
	
	logger.debug("ended AggiuntaProcessProperties.");
}