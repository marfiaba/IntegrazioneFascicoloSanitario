import org.apache.log4j.Logger;

Logger logger = Logger.getLogger('it.eng.torino.SetPayloadInProperties.groovy');


logger.debug("starting SetPayloadInProperties...");

def inMsg = inMessage.bodyText;

outMessage.properties.put("payload", inMsg);

outMessage.bodyText = inMsg;

logger.debug("ended SetPayloadInProperties...");