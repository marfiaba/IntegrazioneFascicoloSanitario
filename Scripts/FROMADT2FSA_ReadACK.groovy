import org.apache.commons.lang.StringUtils;
import it.eng.spagic.util.*;
import it.eng.spagic.hl7.*;
import it.eng.spagic.util.templates.*;
import groovy.sql.*;
import java.sql.*;
import javax.sql.*;
import org.gft.eddie.*;
import org.gft.eddie.separators.HL7Separators;
import org.apache.log4j.Logger;

Logger logger = Logger.getLogger("it.eng.ADTWeb.FROMADT2FSA_ReadACK.groovy");
def input = inMessage.bodyText;

Template templateInput = Template.newInstanceAs(input);
String	errore = templateInput.get("/ERROR");
if (StringUtils.isEmpty(errore)) errore = templateInput.get("/Fault");

String esito = "OK";

String payload = inMessage.properties.get("payload");
Template payloadTemplate = Template.newInstanceAs(payload);	
String idCodaHL7 = payloadTemplate.get("//AH_ID");

if (StringUtils.contains(input, "ERROR") && StringUtils.isEmpty(errore)) {
	errore = "Unknown error";
	esito = "KO";
}
String erroreDesc="";
if (StringUtils.isNotEmpty(errore)) {
	logger.warn("found error: " + errore + " skip row update per id coda = " + idCodaHL7 );
	throw new Exception(errore);	
} else { 
	Connection conn = null;
	try {
		String ACKHL7 = HL7Utils.unwrapFromXML(input);	
		Message msg = new Message(ACKHL7, HL7Separators.INSTANCE);
		Segment msa = msg.getSegment("MSA");
		String resultType = msa.getString(1);
	
		logger.info("result type = " + resultType + " per idCoda = " + idCodaHL7 );
		ProcessProperties pp = inMessage.properties.get(ProcessProperties.KEY);
		conn = ProcessUtils.getConnection(componentContext.getNamingContext(), pp, "DB_ADT");
		if (StringUtils.equals(resultType, "AA")) {	
			logger.debug("Update AA_ADT2HL7 set AH_READ_STATUS_FSA = '2' where AH_ID = " + idCodaHL7);
			statement = "Update AA_ADT2HL7 set AH_READ_STATUS_FSA = '2' where AH_ID = ?";
			Sql query = new Sql(conn);
			query.execute statement, [idCodaHL7];
		}
		else
		{
		    esito = "KO";
		    erroreDesc=msa.getString(3);
		    logger.debug("Update AA_ADT2HL7 set AH_READ_STATUS_FSA = '3' where AH_ID = " + idCodaHL7);
			statement = "Update AA_ADT2HL7 set AH_READ_STATUS_FSA = '3' where AH_ID = ?";
			Sql query = new Sql(conn);
			query.execute statement, [idCodaHL7];
			conn.commit();
			
			exchange.setProperty('org.spagic.monitoring.enableWarning','true');
			try
			{
				query = new Sql(conn);
				
				String pazcogn = inMessage.properties.get("PazCogn");
				String paznome = inMessage.properties.get("PazNome");
				String idmsghl7 = inMessage.properties.get("MsgId");
				String timemsg = inMessage.properties.get("TimeMsg");
				String tipomsg = inMessage.properties.get("TypeMsg");
				sql.execute("insert into STORICOMSG (IDMESSAGGIOHL7,COGNOMEPAZIENTE,NOMEPAZIENTE,CODICEPAZIENTE,TIPOMSGHL7,ORATIMEMESSAGGIO,ERRCOD,APPLICATIONSENDHL7,FACILITYSENDHL7,APPLICATIONRECVHL7,FACILITYRECVHL7,ERRORESINTATTICO) VALUES (?,?,?,?,?,TO_DATE(?,'YYYYMMDDHH24MISS'),?,?,?,?,?,?,?,?)",[idmsghl7,pazcogn,paznome,pazcode,tipomsg,timemsg,resultType,"ADTWEB","ESEL","FSA","CSI",erroreDesc]);
		 		conn.commit();
		 	}
		 	catch(Exception e){
				conn.rollback();
				errore = "Errore in log db "+e.getMessage().replaceAll("\n", " ");
				logger.error("ERRORE INSERIMENTO IN DB SPAGIC");
			}
		}
		
	} catch (Exception e){
		logger.warn(e.getMessage());
		errore = e.getMessage();
		esito = "KO";
		throw e;
	} finally {
		ProcessUtils.close(conn);
	}
}

Template esitoTemplate = Template.newInstance(TemplateEnum.ProcessCompleted.toString());
esitoTemplate.setAttribute("/process", "name", "FromADT2Galileo");
esitoTemplate.set("/process/completed", esito);
esitoTemplate.set("/process/error", errore);
outMessage.bodyText = esitoTemplate.getCompactXML();

logger.debug("ended read ack e Aggiornamento");
