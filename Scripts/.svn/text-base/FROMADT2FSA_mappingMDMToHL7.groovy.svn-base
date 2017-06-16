import it.eng.spagic.util.*;
import it.eng.spagic.util.templates.*;
import it.eng.spagic.hl7.*;
import org.gft.eddie.io.Visitor;
import java.lang.reflect.Constructor;
import org.apache.log4j.Logger;

Logger logger = Logger.getLogger('it.eng.ADTWeb.FROMADT2FSA_mappingADTToHL7.groovy');


logger.debug("starting FROMADT2FSA_mappingADTToHL7...");

String request = inMessage.bodyText;
Template templateRequest = Template.newInstanceAs(request);

try {
	ProcessProperties pp = inMessage.properties.get(ProcessProperties.KEY);
	String packageMapping = pp.get("packageMapping");
	String result = "";
	String HL7MessageId = HL7Utils.newMessageId(componentContext.getNamingContext(), pp, "HL7_SEQ_DS", "SEQ_PREFIX");
	outMessage.properties.put("MsgId",HL7MessageId);
	
	try {	
		Class mapping  = Class.forName(packageMapping + ".EventoStampaADTUnmarshaller");	
		Constructor co =  mapping.getConstructor(it.eng.spagic.util.templates.Template.class, String.class);
		result = new HL7Handler().unmarshall((Visitor) co.newInstance(templateRequest,HL7MessageId));
	}
	catch (ClassNotFoundException ex) {
		 logger.error("Errore caricamento dinamico, classe non trovata, mappatura in package" + packageMapping);
		 throw new Exception("Errore caricamento dinamico, classe non trovata, mappatura in package  " + packageMapping);
	}
	catch (Exception e) {
		logger.error("Errore caricamento dinamico mappatura in package " + packageMapping);
		throw new Exception("Errore caricamento dinamico mappatura in package " + packageMapping);
	}
	outMessage.bodyText = result;
} finally {
	logger.debug("ended FROMADT2FSA_mappingADTToHL7...");
}
