import org.apache.log4j.Logger;

Logger logger = Logger.getLogger("it.eng.ADTWeb.FROMADT2FSA_preInsertStorico.groovy");

//Lettura dati trasportati nell'header del msg
//TODO Controllare che ci siano tutti
String pazcode = inMessage.properties.get("pazienteIdXMPI");
String pazcogn = inMessage.properties.get("PazCogn");
String paznome = inMessage.properties.get("PazNome");
String idmsghl7 = inMessage.properties.get("IdMsgHl7");
String appsnd = inMessage.properties.get("AppSnd");
String apprcv = inMessage.properties.get("AppRcv");
String facrcv = inMessage.properties.get("FacRcv");
String facsnd = inMessage.properties.get("FacSnd");
String timemsg = inMessage.properties.get("TimeMsg");
String esitoJBF = inMessage.properties.get("EsitoJbf"); 
String errore = inMessage.properties.get("ErroreJbf");
String tipomsg = inMessage.properties.get("TipoMsg");
String EsitoACKCod = inMessage.properties.get("EsitoACKCod");
String erroreSemanticoDesc = inMessage.properties.get("erroreSemDesc");
String erroreSintatticoDesc = inMessage.properties.get("erroreSintDesc");
String idack = inMessage.properties.get("idack");
String sdo = inMessage.properties.get("Sdo");


outMessage.bodyText = "<msgstorico><idmsghl7>"+idmsghl7+"</idmsghl7><pazcogn>"+pazcogn+"</pazcogn><paznome>"+paznome+"</paznome><pazcode>"+pazcode+"</pazcode><tipomsg>"+tipomsg+"</tipomsg>"+
					  "<richiestaid>"+sdo+"</richiestaid><noso>" + sdo +"</noso><repcode></repcode><timemsg>"+timemsg+"</timemsg><esito>"+EsitoACKCod+"</esito><appsnd>"+
					  appsnd+"</appsnd><facsnd>"+facsnd+"</facsnd><apprcv>"+apprcv+"</apprcv><facrcv>"+facrcv+"</facrcv><idack>" + idack +"</idack><erroreSemDesc>"+erroreSemanticoDesc+"</erroreSemDesc><erroreSintDesc>"+erroreSintatticoDesc+"</erroreSintDesc></msgstorico>";

//logger.debug("outMessage= " + outMessage.bodyText);				  
