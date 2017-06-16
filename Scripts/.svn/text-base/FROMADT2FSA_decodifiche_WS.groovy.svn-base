import org.dom4j.Element;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import java.text.SimpleDateFormat;
import java.util.Date;
import gestioneWS.*;
import gestioneWS.utility.*;
import gestioneWS.bean.*;
import groovy.sql.Sql;
import groovy.sql.*;
import javax.sql.*;
import java.sql.*;
import it.eng.spagic.util.*;
import javax.sql.DataSource;
import groovy.sql.GroovyResultSet;
import it.eng.spagic.util.templates.*;
		
Logger logger = Logger.getLogger("it.eng.ADTWeb.FROMADT2FSA_Decodifica_ws.groovy");

//Lettura dati da file di property del flusso
ProcessProperties pp = inMessage.properties.get(ProcessProperties.KEY);
utente = pp.get("USERADT");
pwd = pp.get("PWDADT");
entita = pp.get("ENTITAADT");
url = pp.get("URLWS");



bloccoPerErroreWS = pp.get("bloccoPerErroreWS");
String packageMapping = pp.get("packageMapping");

Applicativo applicativo = new Applicativo();
applicativo.setWebServiceURLCompleto(url);
applicativo.setLogin(utente);
applicativo.setPassword(pwd);
applicativo.setEntita(entita);


GestioneChiamateWebServiceXMPI gws = new GestioneChiamateWebServiceXMPI(applicativo);
GestoreStringheXml gs = new GestoreStringheXml();
try {          
	//open session Login
	gws.loginXMPIWebService();	
	def reqMessage = inMessage.bodyText;
	logger.debug("inMessage= " + reqMessage);
	
    //DATI DA XML
    def xmlInput = new XmlParser().parseText(reqMessage);
    def pazienteId = xmlInput.MainQuery.AH_PZ_ID[0].text();
    def pazienteId_OLD = xmlInput.MainQuery.AH_OLD_PZ_ID[0].text();
    def evento = xmlInput.MainQuery.AH_TIPO_MSG[0].text();
      
    //GET Paziente
	def retGetPaziente = gws.getPaziente(pazienteId);

	//GESTIONE DECODIFICHE: 
	// -- Comuni, La getPAziente ha la possibilita di prendere direttamente il codice Istat invece del codice XMPI(ID) attraverso l'apposito campo ***ISTAT**** 
	// -- Cittadinanza, CAMPO ID  = CODICE ISTAT, non ci sono aggiornamenti futuri che possono disaccoppiare(sperando che nuove guerre provichino nuove nazioni)(Tutte le guerre sono civili perché tutti gli uomini sono fratelli)
	// -- AUSL(Appartenenza e Assistenza) Non servono 
	
	String otherDati ="";	
	
	def datiAura = gws.getPazienteCodiciLocali(pazienteId,"RELATIONAL_BED.EDAURA.AURA" );
	Template templateAURA = Template.newInstanceAs(datiAura);
	idAURA = templateAURA.get("//RELATIONAL_BED.EDAURA.AURA");
		
	otherDati="<IDAURA>" + idAURA + "</IDAURA>";	

    //Aggiungo i dati anagrafici al xml
	Document docDatiDB = gs.ottieniDocumentDom4j(reqMessage);
	Document docGetPaziente = gs.ottieniDocumentDom4j(retGetPaziente);
	    

	//ALTRE DECODIFICHE
	//Modalita dimissioni
	//STruttura
	//MAtricola UP
	//UO	
	//NON CI SONO WEBSERVICE PER FARE QUESTO.
	//USO CONNESSIONE DB
	Connection connADT = null;
	
    try { 
	    String AH_ID = xmlInput.MainQuery.AH_ID[0].text();
	    String presID = xmlInput.MainQuery.AH_PSD_ID[0].text();
	    String nosol = xmlInput.MainQuery.AH_CODNOSO[0].text();
	    String regime = xmlInput.MainQuery.AH_REGIME[0].text();
	    String onereID = xmlInput.MainQuery.AH_ONERE_ID[0].text();
	    String motivoID = xmlInput.MainQuery.AH_MOTI_RIC_ID[0].text();
	    String reparto = xmlInput.MainQuery.AH_REP_RIC_ID[0].text();
	   
	   
		connADT = ProcessUtils.getConnection(componentContext.getNamingContext(), pp, "DB_ADT");
		groovy.sql.Sql sql = new groovy.sql.Sql(connADT);
		//Update di pressa in carico(1)
		sql.execute("update aa_adt2hl7 set AH_READ_STATUS_FSA = '1' where ah_id =?",[AH_ID]);
		
        // COntrollo se e da spedire, non sono da spedire gente senza CF e/o minorenni e/o flag livello di riservatezza FSE=V(very Restricted)
        String veryRestriced = "" + xmlInput.MainQuery.AH_RICH_OSCURAMENTO[0].text();
        
        String dataNascita = docGetPaziente.selectSingleNode("//dataNascita").getText();
        String codFisc = docGetPaziente.selectSingleNode("//codiceFiscale").getText();
        Calendar cal1 =  Calendar.getInstance();
		Calendar cal2 =  Calendar.getInstance();
		
		cal1.set(Integer.parseInt(dataNascita.substring(0, 4)), Integer.parseInt(dataNascita.substring(4, 6))-1, Integer.parseInt(dataNascita.substring(6, 8)));        
		
		long mildataNasc = cal1.getTimeInMillis();      
		long milSysDate = cal2.getTimeInMillis();      
		long diff = milSysDate - mildataNasc; 
		long diffDays = diff / (24 * 60 * 60 * 1000); 
		
		long mesi = diffDays / 30;
		long anni = mesi / 12; // restituisce il valore in anni
		
		if(anni>=18 &&  codFisc!=null && codFisc.length()>0 && veryRestriced.equals("V")==false)
		{
		
        
			if (evento=="A45")
		    {
		    	if(!packageMapping.equals("it.eng.spagic.marshall.adt.fsa.to2"))
		        {
		        	//Devo recuperare i dati del vecchio paziente(Cognome,nome,datanascita,comunenascita,CF,sesso e IDAURA)
		        
		        	row=sql.firstRow("select '' || pz_cogn cognome_old,  '' || PZ_NOME nome_old,  '' || to_char(pz_dt_nas,'YYYYMMDD') datanas_old,  '' || pz_sesso sesso_old,  '' || pz_cfis cf_old,  ' ' || pz_stp stp_old,   '' || cm_cistat com_nas_old from sa_paziente, sa_comune where cm_id=pz_com_nas and pz_id=?", [pazienteId_OLD]);
					if (row != null) {
						
						try{
						   otherDati += "<cognomeOLD>" + row.cognome_old + "</cognomeOLD><nomeOLD>" + row.nome_old + "</nomeOLD><datanasOLD>"+row.datanas_old+"</datanasOLD><sessoOLD>"+row.sesso_old+"</sessoOLD><cfOLD>"+row.cf_old+"</cfOLD><stpOLD>"+row.stp_old+"</stpOLD><com_nasOLD>"+row.com_nas_old+"</com_nasOLD>";
						  
						   datiAura = gws.getPazienteCodiciLocali(pazienteId_OLD,"RELATIONAL_BED.EDAURA.AURA" );
						   templateAURA = Template.newInstanceAs(datiAura);
			               idAURA = templateAURA.get("//RELATIONAL_BED.EDAURA.AURA");
			               otherDati+="<IDAURAOLD>" + idAURA + "</IDAURAOLD>";	
						}
							catch (Exception e) {
							throw e;
						}           
					}
		        }
		        else
		        {
		        	//Il cambio anagrafico è gestito generalmente dal messaggio A45, ADTWEB produce quindi un evento A45 per il cambio anagrafico
		        	//Siccome il FSA di Torino(to2) invece vuole un  A08 anche per il cambio anagrafico trasformo evento da A45 a A08
		        	evento="A08";
		      	}  
		    }
			
			
			if(onereID.equals("null"))
			{
				onereID=null;
			}
			if(motivoID.equals("null"))
			{
				motivoID=null;
			}
	
			
			//ORIGINALE: 
			//row=sql.firstRow("select (a.rp_divapp_id || a.rp_divapp_prog) as CODICEUO , (Select st_Codi from sa_Stabilimento where st_id =a.rp_sta_id) as STRUTTURA ,  (Select F_MATRICOLA(?,?,a.rp_divapp_id,a.rp_divapp_prog,?,?,?,?) from dual) as MATRICOLAUP from sa_reparto a where a.rp_id=?", [presID,nosol,regime,onereID,motivoID,reparto,reparto]);
			
			  row=sql.firstRow("select (a.rp_divapp_id || a.rp_divapp_prog) as CODICEUO , (Select st_Codi from sa_Stabilimento where st_id =a.rp_sta_id) as STRUTTURA ,  (Select F_MATRICOLA('"+ presID.trim()+"','" + nosol.trim() + "',a.rp_divapp_id,a.rp_divapp_prog,'"+regime.trim()+"',?,?,'" + reparto.trim() + "') from dual) as MATRICOLAUP from sa_reparto a where a.rp_id='" + reparto.trim() + "'",[onereID,motivoID]);
			
			
			if (row != null) {
					def matricola="";
					try{
					  matricola = row.MATRICOLAUP;
					}
					catch (Exception e) {
					logger.error("errore matricola" + e.getMessage() + "-" + e.printStackTrace());
					  matricola="MUP_NONCALCOLATA";
					}
			       otherDati += "<MatricolaUP>" + matricola + "</MatricolaUP><StruttSan>" + row.STRUTTURA + "</StruttSan><UO>"+row.CODICEUO+"</UO>";       
			}
			//Evento di trasf al momento gestito per fascicolo solo to2(vecchia versione) non per la nuova versione(to1,biella,orbassano)
			if (evento=="A02" || evento=="A12"){
				//Trasferimento
			    def repartoPre = xmlInput.MainQuery.AH_REP_TRASF_ID[0].text();
			    row=null;
			    row=sql.firstRow("select (a.rp_divapp_id || a.rp_divapp_prog) as CODICEUO , (Select st_Codi from sa_Stabilimento where st_id =a.rp_sta_id) as STRUTTURA ,  (Select F_MATRICOLA(?,?,a.rp_divapp_id,a.rp_divapp_prog,?,?,?,?) from dual) as MATRICOLAUP from sa_reparto a where a.rp_id=?", [presID,nosol,regime,onereID,motivoID,repartoPre,repartoPre]);
			    if (row != null) {
			        def matricola;
					try{
					  matricola = row.MATRICOLAUP ;
					}
					catch (Exception e) {
					  matricola="";
					}
			    	otherDati += " <MatricolaUPPrec>"+ matricola +"</MatricolaUPPrec><StruttSanPrec>"+row.STRUTTURA+"</StruttSanPrec><UOPrec>"+row.CODICEUO+"</UOPrec>";
			     }
			 }   
			 if (evento=="A03" || evento=="A13" || evento=="A08" || evento=="MDMT02" || evento=="MDMT10"){
				 //Dimissioni
				 def idDim = xmlInput.MainQuery.AH_MODA_DIM_ID[0].text();
				 if (idDim!=null && idDim!="" && idDim!="null")
				 {
				   row=null;
				   row=sql.firstRow("select MD_CODI from AA_MODALITADIM where MD_ID=?", [idDim]);
				   def codModDim = row.MD_CODI ;
				   docDatiDB.selectSingleNode("//AH_MODA_DIM_ID").setText(codModDim);
				 }	
			 }
			 
		 	if (evento=="LETDIM"){
		    	evento="MDMT02";
		  	}
		    else if (evento=="LETDIMV"){
		    	evento="MDMT10";
		  	}
		 	if (evento=="MDMT02" || evento=="MDMT10"){
		 		//Recupero le informazioni del Medico
		 		def idMedicoDim = xmlInput.MainQuery.AH_OPE_DIM_ID[0].text();
				if (idMedicoDim!=null && idMedicoDim!="" && idMedicoDim!="null")
				{
		      		def retGetMedico= gws.getPersona(idMedicoDim);
		      		Template templateGetMedico = Template.newInstanceAs(retGetMedico);
		      		otherDati += "<CognomeMedDim>" + templateGetMedico.get("//cognome")+"</CognomeMedDim><NomeMedDim>"+templateGetMedico.get("//nome")+"</NomeMedDim>";
		    	}
		    	else
		    	{
		    		otherDati += "<CognomeMedDim>SCONOSCIUTO</CognomeMedDim><NomeMedDim>SCONOSCIUTO</NomeMedDim>";
		    	}
			}
		}
		else //Else di non invio perche minorenne o senza CF
		{
			evento="NOSEND";
		}

		logger.debug("otherDati=" + otherDati);
		 
	 }catch(Exception e){
	     throw e;
	 } finally {
	    if (connADT!=null)
	    {
		   connADT.close();
		} 
	 }
	 
	 
	//CLOSE SESSION
	gws.logoutXMPIWebService();
    gws.appendDocument(docGetPaziente, docDatiDB, "MainQuery", "sianc.paziente.PazienteBean");
	
	//Dati calcolati
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	Date now = new Date();
	
	String dataMessaggio="<DataMessaggio>" + df.format(now) + "</DataMessaggio>";
	String tipoMessaggio="<TipoMessaggio>" + evento  + "</TipoMessaggio>";
	
	String addDatiCalcolati = "<DatiCalcolati>" + dataMessaggio + tipoMessaggio + otherDati +"</DatiCalcolati>"; 
	Document docDatiCalcolati = gs.ottieniDocumentDom4j(addDatiCalcolati);
	gws.appendDocument(docDatiCalcolati, docDatiDB, "message", "DatiCalcolati");
	
    //Cancello eventuali nodi con valore "null"
    gws.deleteNodesWithInputValue(docDatiDB,docDatiDB.getRootElement(),"null");

    logger.debug("-->XML FINALE = " + gs.ottieniStringa(docDatiDB));
	
	//Salvo i dati nei properties, servono piu avanti per inserimento tabella storico
	def msgparsed = new XmlParser().parseText(gs.ottieniStringa(docDatiDB));
	def datetimemsg =  msgparsed.DatiCalcolati[0].DataMessaggio.text();
	def typemsg  =    msgparsed.DatiCalcolati[0].TipoMessaggio.text();
	def paz_cogn =    msgparsed.MainQuery[0]."sianc.paziente.PazienteBean"[0].cognomePaziente.text();
	def paz_nome =    msgparsed.MainQuery[0]."sianc.paziente.PazienteBean"[0].nomePaziente.text();
	def idpaziente =  msgparsed.MainQuery[0]."sianc.paziente.PazienteBean"[0].idPaziente.text();
	def sdo =         msgparsed.MainQuery[0].AH_CODNOSO.text();
	
	outMessage.properties.put("PazCogn",paz_cogn);
	outMessage.properties.put("PazNome",paz_nome);
	outMessage.properties.put("pazienteIdXMPI",idpaziente+"");
	outMessage.properties.put("TipoMsg",typemsg);
	outMessage.properties.put("TimeMsg",datetimemsg);
	outMessage.properties.put("Sdo",sdo);
	outMessage.properties.put("evento",evento);
	outMessage.properties.put("EsitoJbf","OK");
	outMessage.properties.put("ErroreJbf","OK");
	
	outMessage.bodyText  = gs.ottieniStringa(docDatiDB);
}
catch (Exception e) {
	logger.error("Entra in Exception " + e.getMessage());
	if(bloccoPerErroreWS=="S")
	{
	     //L'errore e quasi sicuramente un errore di connessione ai WS
	     //Mando in errore Flusso
	     throw new Exception(e.getMessage());
	}
	else
	{
	    def outConnection = "<Output><Exception><Description>" + e.getMessage() + "</Description></Exception></Output>";
	    outMessage.properties.put("ErroreJbf",e.getMessage());
	    outMessage.properties.put("EsitoJbf","KO");
	    outMessage.bodyText  = outConnection;
	 }
}
