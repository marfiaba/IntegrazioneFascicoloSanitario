import org.apache.log4j.Logger;

Logger logger = Logger.getLogger("it.eng.ADTWeb.XMPToUpdMsg.groovy");
def TIPOINSTALLAZIONETORINO = 1;
def TIPOINSTALLAZIONEFIRENZE = 2;


def xmlMSG = inMessage.bodyText;
logger.debug("XML HL7 = " + xmlMSG);

//Lettura dati da file di property
String PropertyFile = "resources/FSA/FSA.properties"; 
Properties props = new Properties(); 
props.load(new FileInputStream(PropertyFile)); 
tipoInstallazione = props.getProperty("TIPOINSTALLAZIONE");


//INSERIRE QUI EVENTUALI ALTRI CAMBIAMENTE PRIMA DELLA TRASFRMAZIONE in Formato Hl7 pipe
if (tipoInstallazione == TIPOINSTALLAZIONETORINO){
		
}
else
{
}
outMessage.bodyText = xmlMSG;
