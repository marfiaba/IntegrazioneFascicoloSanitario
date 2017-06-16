CREATE OR REPLACE FUNCTION ORBADEF.F_MATRICOLA(psd VARCHAR2, nosol VARCHAR2, rpDivappId VARCHAR2, rpDivappProg VARCHAR2, rcRegime VARCHAR2, onereRic VARCHAR2, motivoRic VARCHAR2, repRicId VARCHAR2) RETURN VARCHAR2 IS
-- NON CANCELLARE: funzione per elaborare la matricola unità produttiva
-- usata per l'integrazione con il fascicolo sanitario
-- Mauro Limonta
   rep_ricovero VARCHAR2(11):=NULL; -- UO (Unità Opertiva)
   rep_multispe VARCHAR2(11):=NULL; -- Reparto Multispecialistico
   rep_stabilimento VARCHAR2(11):=NULL; -- stabilimento
   reparto VARCHAR2(11):=NULL; -- UO per calcolare la matricola
   lp BOOLEAN:=FALSE; -- TRUE=SiMultispecialità; FALSE=NoMultispecialità
   matricola VARCHAR2(11):=NULL; -- Matricola Unità Produttiva usata nelle query
   matricola_upd VARCHAR2(11):=NULL; -- Matricola Unità Produttiva che ritorno
BEGIN
   matricola_upd:='';
   matricola:=NULL;
   reparto:=rpDivappId||rpDivappProg; -- UO =reparto di ricovero
   rep_ricovero:=NULL;
   rep_multispe:=NULL;
   -- prendo lo stabilimento
   SELECT rp_sta_id
      INTO rep_stabilimento
      FROM SA_REPARTO
      WHERE RP_ID = repRicId;
   -- prendo il valore del reparto multispecialistico
   BEGIN
   SELECT DA_REP_MULTISP_ID INTO rep_multispe
     FROM AA_LDATIAGGIUNTIVI
     WHERE DA_PSD_ID = psd AND
           DA_CODNOSO = nosol;
     EXCEPTION
         WHEN NO_DATA_FOUND THEN
         BEGIN
             SELECT DA_REP_MULTISP_ID INTO rep_multispe
         FROM AA_CDATIAGGIUNTIVI
         WHERE DA_PSD_ID = psd AND
               DA_CODNOSO = nosol;
             EXCEPTION
               WHEN NO_DATA_FOUND THEN
                 rep_multispe:='';
             END; 
     END;
          
     
     
     
     
     
     
     
     
           
   -- se la divisione è di multispecialità ...
   IF (rpDivappId = '02' OR rpDivappId = '67' OR rpDivappId = '97' OR rpDivappId = '98') THEN
     BEGIN
     -- se il valore del reparto multispecialistico è vuoto ...
     IF ( rep_multispe IS NULL) THEN
        rep_ricovero:= reparto; -- ... allore lascio UO = reparto di ricovero
        lp:= FALSE; -- NoMultispecialità
     -- invece se il valore del reparto multispecialistico è pieno ...
     ELSE
     -- ... dall'ID del reparto mi prendo la UO ovvero Divisione+Progressivo ...
       SELECT TRIM(RP_DIVAPP_ID||RP_DIVAPP_PROG) INTO rep_multispe
         FROM AA_REPARTO WHERE RP_ID = rep_multispe and rp_multispecialistico='1';
         rep_ricovero:= rep_multispe; -- ... UO = reparto multispecialistico
         lp:= TRUE; -- SiMultispecialità
     END IF;
     END;
   -- invece se la divisione NON è di multispecialità ...
   ELSE
     rep_ricovero:= reparto; -- ... allore lascio UO = reparto di ricovero
     lp:= FALSE; -- NoMultispecialità
   END IF;
   -- mi prendo la Matricola
   IF rcRegime = '1' THEN -- Regime='1' Ordinario
     IF (lp = FALSE) THEN -- NoMultispecialità
       BEGIN
       SELECT TRIM(MU_MATRICOLA) INTO matricola
         FROM AA_MATRICOLAUP
         WHERE MU_UO_CODI = rep_ricovero AND
               MU_STABILIMENTO = rep_stabilimento and
               MU_PSD_ID = psd AND
               MU_REGIME = '1' AND
               MU_ONERE_ID = onereRic AND
               (MU_LIBPROF IS NULL OR MU_LIBPROF = '');
       matricola_upd:=RPAD(matricola,6);
       EXCEPTION
         WHEN NO_DATA_FOUND THEN
         BEGIN
         SELECT TRIM(MU_MATRICOLA) INTO matricola
           FROM AA_MATRICOLAUP
           WHERE MU_UO_CODI = rep_ricovero AND
                 MU_STABILIMENTO = rep_stabilimento and
                 MU_PSD_ID = psd AND
                 MU_REGIME = '1' AND
                 MU_ONERE_ID IS NULL AND
                 (MU_LIBPROF IS NULL OR MU_LIBPROF = '');
         matricola_upd:=RPAD(matricola,6);
         EXCEPTION
           WHEN NO_DATA_FOUND THEN
             matricola_upd:='';
         END;
       END;
     ELSE -- SiMultispecialità
       BEGIN
       SELECT TRIM(MU_MATRICOLA) INTO matricola
         FROM AA_MATRICOLAUP
         WHERE MU_UO_CODI = rep_ricovero AND
               MU_STABILIMENTO = rep_stabilimento and
               MU_PSD_ID = psd AND
               MU_REGIME = '1' AND
               MU_ONERE_ID = onereRic AND
               MU_LIBPROF = '1';
       matricola_upd:=RPAD(matricola,6);
       EXCEPTION
         WHEN NO_DATA_FOUND THEN
         BEGIN
         SELECT TRIM(MU_MATRICOLA) INTO matricola
           FROM AA_MATRICOLAUP
           WHERE MU_UO_CODI = rep_ricovero AND
                 MU_STABILIMENTO = rep_stabilimento and
                 MU_PSD_ID = psd AND
                 MU_REGIME = '1' AND
                 MU_ONERE_ID IS NULL AND
                 MU_LIBPROF = '1';
         matricola_upd:=RPAD(matricola,6);
         EXCEPTION
           WHEN NO_DATA_FOUND THEN
             matricola_upd:='';
         END;
       END;
     END IF;
   ELSE -- Regime='2' Day Hospital
     IF (lp = FALSE) THEN -- NoMultispecialità
       BEGIN
       SELECT TRIM(MU_MATRICOLA) INTO matricola
         FROM AA_MATRICOLAUP
         WHERE MU_UO_CODI = rep_ricovero AND
               MU_STABILIMENTO = rep_stabilimento and
               MU_PSD_ID = psd AND
               MU_REGIME = '2' AND
               MU_ONERE_ID = onereRic AND
               MU_MOTIVO_ID = motivoRic AND
               (MU_LIBPROF IS NULL OR MU_LIBPROF = '');
       matricola_upd:=RPAD(matricola,6);
       EXCEPTION
         WHEN NO_DATA_FOUND THEN
         BEGIN
         SELECT TRIM(MU_MATRICOLA) INTO matricola
           FROM AA_MATRICOLAUP
           WHERE MU_UO_CODI = rep_ricovero AND
                 MU_STABILIMENTO = rep_stabilimento and
                 MU_PSD_ID = psd AND
                 MU_REGIME = '2' AND
                 MU_ONERE_ID IS NULL AND
                 MU_MOTIVO_ID = motivoRic AND
                 (MU_LIBPROF IS NULL OR MU_LIBPROF = '');
         matricola_upd:=RPAD(matricola,6);
         EXCEPTION
           WHEN NO_DATA_FOUND THEN
           BEGIN
           SELECT TRIM(MU_MATRICOLA) INTO matricola
             FROM AA_MATRICOLAUP
             WHERE MU_UO_CODI = rep_ricovero AND
                   MU_STABILIMENTO = rep_stabilimento and
                   MU_PSD_ID = psd AND
                   MU_REGIME = '2' AND
                   MU_ONERE_ID = onereRic AND
                   MU_MOTIVO_ID IS NULL AND
                   (MU_LIBPROF IS NULL OR MU_LIBPROF = '');
           matricola_upd:=RPAD(matricola,6);
           EXCEPTION
             WHEN NO_DATA_FOUND THEN
             BEGIN
             SELECT TRIM(MU_MATRICOLA) INTO matricola
               FROM AA_MATRICOLAUP
               WHERE MU_UO_CODI = rep_ricovero AND
                     MU_STABILIMENTO = rep_stabilimento and
                     MU_PSD_ID = psd AND
                     MU_REGIME = '2' AND
                     MU_ONERE_ID IS NULL AND
                     MU_MOTIVO_ID IS NULL AND
                     (MU_LIBPROF IS NULL OR MU_LIBPROF = '');
             matricola_upd:=RPAD(matricola,6);
             EXCEPTION
               WHEN NO_DATA_FOUND THEN
                 matricola_upd:='';
             END;
           END;
         END;
       END;
     ELSE -- SiMultispecialità
       BEGIN
       SELECT TRIM(MU_MATRICOLA) INTO matricola
         FROM AA_MATRICOLAUP
         WHERE MU_UO_CODI = rep_ricovero AND
               MU_STABILIMENTO = rep_stabilimento and
               MU_PSD_ID = psd AND
               MU_REGIME = '2' AND
               MU_ONERE_ID = onereRic AND
               MU_MOTIVO_ID = motivoRic AND
               MU_LIBPROF = '1';
       matricola_upd:=RPAD(matricola,6);
       EXCEPTION
         WHEN NO_DATA_FOUND THEN
         BEGIN
         SELECT TRIM(MU_MATRICOLA) INTO matricola
           FROM AA_MATRICOLAUP
           WHERE MU_UO_CODI = rep_ricovero AND
                 MU_STABILIMENTO = rep_stabilimento and
                 MU_PSD_ID = psd AND
                 MU_REGIME = '2' AND
                 MU_ONERE_ID IS NULL AND
                 MU_MOTIVO_ID = motivoRic AND
                 MU_LIBPROF = '1';
         matricola_upd:=RPAD(matricola,6);
         EXCEPTION
           WHEN NO_DATA_FOUND THEN
           BEGIN
           SELECT TRIM(MU_MATRICOLA) INTO matricola
             FROM AA_MATRICOLAUP
             WHERE MU_UO_CODI = rep_ricovero AND
                   MU_STABILIMENTO = rep_stabilimento and
                   MU_PSD_ID = psd AND
                   MU_REGIME = '2' AND
                   MU_ONERE_ID = onereRic AND
                   MU_MOTIVO_ID IS NULL AND
                   MU_LIBPROF = '1';
           matricola_upd:=RPAD(matricola,6);
           EXCEPTION
             WHEN NO_DATA_FOUND THEN
             BEGIN
             SELECT TRIM(MU_MATRICOLA) INTO matricola
               FROM AA_MATRICOLAUP
               WHERE MU_UO_CODI = rep_ricovero AND
                     MU_STABILIMENTO = rep_stabilimento and
                     MU_PSD_ID = psd AND
                     MU_REGIME = '2' AND
                     MU_ONERE_ID IS NULL AND
                     MU_MOTIVO_ID IS NULL AND
                     MU_LIBPROF = '1';
             matricola_upd:=RPAD(matricola,6);
             EXCEPTION
               WHEN NO_DATA_FOUND THEN
                 matricola_upd:='';
              END;
           END;
         END;
       END;
     END IF;
   END IF;
   RETURN matricola_upd; -- Ritorno valore
EXCEPTION WHEN OTHERS THEN
          RETURN '';
END F_MATRICOLA;
/
