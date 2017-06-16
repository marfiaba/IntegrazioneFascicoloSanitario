def idmessaggio = inMessage.properties.get("MsgId");
def fonte = inMessage.properties.get("fonte");
def ackCode = inMessage.properties.get("EsitoACKCod");
def flag="";

if (ackCode == "KO")
{
  //Non inviato
  flag="NV";
  String PropertyFile = "resources/FSA/FSA.properties"; 
  Properties props = new Properties(); 
  props.load(new FileInputStream(PropertyFile)); 
  bloccoPerErroreInvio = props.getProperty("bloccoPerErroreInvio");
  if(bloccoPerErroreInvio=="S")
  {
	  /*
	    **********************************************ATTENZIONE************************************************
		L'errore viene propagato, in modo da far diventare ROSSO il flusso.
		Naturalmente in questo modo tutto eventuale codice successivo è inutile 
	  */	
      throw new Exception("Messaggio non spedito per errore TCP, vedere LOG");  
  }   
}
else
{
  //ACK Negativo
  flag="AN";
}

outMessage.bodyText = "<out><idmsg>" + idmessaggio + "</idmsg><fonte>" + fonte + "</fonte><flag>" + flag + "</flag></out>";
