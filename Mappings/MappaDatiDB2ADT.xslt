<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2008r2

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="urn:hl7-org:v2xml" exclude-result-prefixes="xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:template match="/message">
	 <ADT_A01>
			<MSH>
				<MSH.1>
					<xsl:value-of select="'|'"/>
				</MSH.1>
				<MSH.2>
					<xsl:value-of select="'^~\&amp;'"/>
				</MSH.2>
				<MSH.3>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="SendingApplication">
							<xsl:variable name="Vvar1048_SendingApplication_anySimpleType" select="."/>
							<HD.1>
								<xsl:value-of select="$Vvar1048_SendingApplication_anySimpleType"/>
							</HD.1>
						</xsl:for-each>
					</xsl:for-each>
				</MSH.3>
				<MSH.4>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="SendingFacility">
							<xsl:variable name="Vvar1055_SendingFacility_anySimpleType" select="."/>
							<HD.1>
								<xsl:value-of select="$Vvar1055_SendingFacility_anySimpleType"/>
							</HD.1>
						</xsl:for-each>
					</xsl:for-each>
				</MSH.4>
				<MSH.5>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="ReceivingApplication">
							<xsl:variable name="Vvar1062_ReceivingApplication_anySimpleType" select="."/>
							<HD.1>
								<xsl:value-of select="$Vvar1062_ReceivingApplication_anySimpleType"/>
							</HD.1>
						</xsl:for-each>
					</xsl:for-each>
				</MSH.5>
				<MSH.6>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="ReceivingFacility">
							<xsl:variable name="Vvar1069_ReceivingFacility_anySimpleType" select="."/>
							<HD.1>
								<xsl:value-of select="$Vvar1069_ReceivingFacility_anySimpleType"/>
							</HD.1>
						</xsl:for-each>
					</xsl:for-each>
				</MSH.6>
				<MSH.7>
					<TS.1>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1074_DataMessaggio_anySimpleType" select="."/>
								<DTTM.1>
									<xsl:value-of select="substring(string($Vvar1074_DataMessaggio_anySimpleType), number(1), number(4))"/>
								</DTTM.1>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1084_DataMessaggio_anySimpleType" select="."/>
								<DTTM.2>
									<xsl:value-of select="substring(string($Vvar1084_DataMessaggio_anySimpleType), number(5), number(2))"/>
								</DTTM.2>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1094_DataMessaggio_anySimpleType" select="."/>
								<DTTM.3>
									<xsl:value-of select="substring(string($Vvar1094_DataMessaggio_anySimpleType), number(7), number(2))"/>
								</DTTM.3>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1104_DataMessaggio_anySimpleType" select="."/>
								<DTTM.4>
									<xsl:value-of select="substring(string($Vvar1104_DataMessaggio_anySimpleType), number(9), number(2))"/>
								</DTTM.4>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1114_DataMessaggio_anySimpleType" select="."/>
								<DTTM.5>
									<xsl:value-of select="substring(string($Vvar1114_DataMessaggio_anySimpleType), number(11), number(2))"/>
								</DTTM.5>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1124_DataMessaggio_anySimpleType" select="."/>
								<DTTM.6>
									<xsl:value-of select="substring(string($Vvar1124_DataMessaggio_anySimpleType), number(13), number(2))"/>
								</DTTM.6>
							</xsl:for-each>
						</xsl:for-each>
					</TS.1>
				</MSH.7>
				<MSH.9>
					<xsl:for-each select="DatiCalcolati">
						<xsl:for-each select="TipoMessaggio">
							<xsl:variable name="Vvar1136_TipoMessaggio_anySimpleType" select="."/>
							<MSG.1>
								<xsl:value-of select="$Vvar1136_TipoMessaggio_anySimpleType"/>
							</MSG.1>
						</xsl:for-each>
					</xsl:for-each>
				</MSH.9>
				<xsl:for-each select="DatiCalcolati">
					<xsl:for-each select="DataMessaggio">
						<xsl:variable name="Vvar1143_DataMessaggio_anySimpleType" select="."/>
						<MSH.10>
							<xsl:value-of select="$Vvar1143_DataMessaggio_anySimpleType"/>
						</MSH.10>
					</xsl:for-each>
				</xsl:for-each>
				<MSH.11>
					<PT.1>
						<xsl:value-of select="'P'"/>
					</PT.1>
				</MSH.11>
				<MSH.12>
					<VID.1>
						<xsl:value-of select="'2.5'"/>
					</VID.1>
				</MSH.12>
			</MSH>
			<EVN>
				<EVN.2>
					<TS.1>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1148_DataMessaggio_anySimpleType" select="."/>
								<DTTM.1>
									<xsl:value-of select="substring(string($Vvar1148_DataMessaggio_anySimpleType), number(1), number(4))"/>
								</DTTM.1>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1158_DataMessaggio_anySimpleType" select="."/>
								<DTTM.2>
									<xsl:value-of select="substring(string($Vvar1158_DataMessaggio_anySimpleType), number(5), number(2))"/>
								</DTTM.2>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1168_DataMessaggio_anySimpleType" select="."/>
								<DTTM.3>
									<xsl:value-of select="substring(string($Vvar1168_DataMessaggio_anySimpleType), number(7), number(2))"/>
								</DTTM.3>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1178_DataMessaggio_anySimpleType" select="."/>
								<DTTM.4>
									<xsl:value-of select="substring(string($Vvar1178_DataMessaggio_anySimpleType), number(9), number(2))"/>
								</DTTM.4>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1188_DataMessaggio_anySimpleType" select="."/>
								<DTTM.5>
									<xsl:value-of select="substring(string($Vvar1188_DataMessaggio_anySimpleType), number(11), number(2))"/>
								</DTTM.5>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="DataMessaggio">
								<xsl:variable name="Vvar1198_DataMessaggio_anySimpleType" select="."/>
								<DTTM.6>
									<xsl:value-of select="substring(string($Vvar1198_DataMessaggio_anySimpleType), number(13), number(2))"/>
								</DTTM.6>
							</xsl:for-each>
						</xsl:for-each>
					</TS.1>
				</EVN.2>
			</EVN>
			<xsl:variable name="Vvar290_const" select="'00'"/>
			<xsl:variable name="Vvar484_const" select="''"/>
			<xsl:variable name="Vvar1453_const" select="3"/>
			<PID>
				<PID.3>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="codiceFiscale">
								<xsl:variable name="Vvar1212_codiceFiscale_anySimpleType" select="."/>
								<CX.1>
									<xsl:value-of select="$Vvar1212_codiceFiscale_anySimpleType"/>
								</CX.1>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityCodFisc">
							<xsl:variable name="Vvar1219_AuthorityCodFisc_anySimpleType" select="."/>
							<CX.5>
								<xsl:value-of select="$Vvar1219_AuthorityCodFisc_anySimpleType"/>
							</CX.5>
						</xsl:for-each>
					</xsl:for-each>
				</PID.3>
				<PID.3>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="codiceSTP">
								<xsl:variable name="Vvar1228_codiceSTP_anySimpleType" select="."/>
								<CX.1>
									<xsl:value-of select="$Vvar1228_codiceSTP_anySimpleType"/>
								</CX.1>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthoritySTP">
							<xsl:variable name="Vvar1235_AuthoritySTP_anySimpleType" select="."/>
							<CX.5>
								<xsl:value-of select="$Vvar1235_AuthoritySTP_anySimpleType"/>
							</CX.5>
						</xsl:for-each>
					</xsl:for-each>
					<CX.8>
						<TS.1>
							<xsl:for-each select="MainQuery">
								<xsl:for-each select="sianc.paziente.PazienteBean">
									<xsl:for-each select="scadenzaSTP">
										<xsl:variable name="Vvar1242_scadenzaSTP_anySimpleType" select="."/>
										<DTTM.1>
											<xsl:value-of select="substring(string($Vvar1242_scadenzaSTP_anySimpleType), number(1), number(4))"/>
										</DTTM.1>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="MainQuery">
								<xsl:for-each select="sianc.paziente.PazienteBean">
									<xsl:for-each select="scadenzaSTP">
										<xsl:variable name="Vvar1254_scadenzaSTP_anySimpleType" select="."/>
										<DTTM.2>
											<xsl:value-of select="substring(string($Vvar1254_scadenzaSTP_anySimpleType), number(5), number(2))"/>
										</DTTM.2>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="MainQuery">
								<xsl:for-each select="sianc.paziente.PazienteBean">
									<xsl:for-each select="scadenzaSTP">
										<xsl:variable name="Vvar1266_scadenzaSTP_anySimpleType" select="."/>
										<DTTM.3>
											<xsl:value-of select="substring(string($Vvar1266_scadenzaSTP_anySimpleType), number(7), number(2))"/>
										</DTTM.3>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
							<DTTM.4>
								<xsl:value-of select="$Vvar290_const"/>
							</DTTM.4>
							<DTTM.5>
								<xsl:value-of select="$Vvar290_const"/>
							</DTTM.5>
						</TS.1>
					</CX.8>
				</PID.3>
				<PID.3>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="numeroTesseraSanitaria">
								<xsl:variable name="Vvar1280_numeroTesseraSanitaria_anySimpleType" select="."/>
								<CX.1>
									<xsl:value-of select="$Vvar1280_numeroTesseraSanitaria_anySimpleType"/>
								</CX.1>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityTessSan">
							<xsl:variable name="Vvar1287_AuthorityTessSan_anySimpleType" select="."/>
							<CX.5>
								<xsl:value-of select="$Vvar1287_AuthorityTessSan_anySimpleType"/>
							</CX.5>
						</xsl:for-each>
					</xsl:for-each>
				</PID.3>
				<PID.3>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="tesseraTeam">
								<xsl:variable name="Vvar1296_tesseraTeam_anySimpleType" select="."/>
								<CX.1>
									<xsl:value-of select="$Vvar1296_tesseraTeam_anySimpleType"/>
								</CX.1>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityTeam">
							<xsl:variable name="Vvar1303_AuthorityTeam_anySimpleType" select="."/>
							<CX.5>
								<xsl:value-of select="$Vvar1303_AuthorityTeam_anySimpleType"/>
							</CX.5>
						</xsl:for-each>
					</xsl:for-each>
					<CX.8>
						<TS.1>
							<xsl:for-each select="MainQuery">
								<xsl:for-each select="sianc.paziente.PazienteBean">
									<xsl:for-each select="scadenzaTesseraTeam">
										<xsl:variable name="Vvar1310_scadenzaTesseraTeam_anySimpleType" select="."/>
										<DTTM.1>
											<xsl:value-of select="substring(string($Vvar1310_scadenzaTesseraTeam_anySimpleType), number(1), number(4))"/>
										</DTTM.1>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="MainQuery">
								<xsl:for-each select="sianc.paziente.PazienteBean">
									<xsl:for-each select="scadenzaTesseraTeam">
										<xsl:variable name="Vvar1322_scadenzaTesseraTeam_anySimpleType" select="."/>
										<DTTM.2>
											<xsl:value-of select="substring(string($Vvar1322_scadenzaTesseraTeam_anySimpleType), number(5), number(2))"/>
										</DTTM.2>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="MainQuery">
								<xsl:for-each select="sianc.paziente.PazienteBean">
									<xsl:for-each select="scadenzaTesseraTeam">
										<xsl:variable name="Vvar1334_scadenzaTesseraTeam_anySimpleType" select="."/>
										<DTTM.3>
											<xsl:value-of select="substring(string($Vvar1334_scadenzaTesseraTeam_anySimpleType), number(7), number(2))"/>
										</DTTM.3>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
							<DTTM.4>
								<xsl:value-of select="$Vvar290_const"/>
							</DTTM.4>
							<DTTM.5>
								<xsl:value-of select="$Vvar290_const"/>
							</DTTM.5>
						</TS.1>
					</CX.8>
				</PID.3>
				<PID.3>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="idPaziente">
								<xsl:variable name="Vvar1348_idPaziente_anySimpleType" select="."/>
								<CX.1>
									<xsl:value-of select="$Vvar1348_idPaziente_anySimpleType"/>
								</CX.1>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityAnagCentrale">
							<xsl:variable name="Vvar1355_AuthorityAnagCentrale_anySimpleType" select="."/>
							<CX.5>
								<xsl:value-of select="$Vvar1355_AuthorityAnagCentrale_anySimpleType"/>
							</CX.5>
						</xsl:for-each>
					</xsl:for-each>
				</PID.3>
				<PID.3>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="idPaziente">
								<xsl:variable name="Vvar1364_idPaziente_anySimpleType" select="."/>
								<CX.1>
									<xsl:value-of select="$Vvar1364_idPaziente_anySimpleType"/>
								</CX.1>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityAnagLocale">
							<xsl:variable name="Vvar1371_AuthorityAnagLocale_anySimpleType" select="."/>
							<CX.5>
								<xsl:value-of select="$Vvar1371_AuthorityAnagLocale_anySimpleType"/>
							</CX.5>
						</xsl:for-each>
					</xsl:for-each>
				</PID.3>
				<PID.5>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="cognomePaziente">
								<xsl:variable name="Vvar1380_cognomePaziente_anySimpleType" select="."/>
								<XPN.1>
									<xsl:value-of select="$Vvar1380_cognomePaziente_anySimpleType"/>
								</XPN.1>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="nomePaziente">
								<xsl:variable name="Vvar1389_nomePaziente_anySimpleType" select="."/>
								<XPN.2>
									<xsl:value-of select="$Vvar1389_nomePaziente_anySimpleType"/>
								</XPN.2>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</PID.5>
				<PID.7>
					<TS.1>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="dataNascita">
									<xsl:variable name="Vvar1396_dataNascita_anySimpleType" select="."/>
									<DTTM.1>
										<xsl:value-of select="substring(string($Vvar1396_dataNascita_anySimpleType), number(1), number(4))"/>
									</DTTM.1>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="dataNascita">
									<xsl:variable name="Vvar1408_dataNascita_anySimpleType" select="."/>
									<DTTM.2>
										<xsl:value-of select="substring(string($Vvar1408_dataNascita_anySimpleType), number(5), number(2))"/>
									</DTTM.2>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="dataNascita">
									<xsl:variable name="Vvar1420_dataNascita_anySimpleType" select="."/>
									<DTTM.3>
										<xsl:value-of select="substring(string($Vvar1420_dataNascita_anySimpleType), number(7), number(2))"/>
									</DTTM.3>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<DTTM.4>
							<xsl:value-of select="$Vvar484_const"/>
						</DTTM.4>
						<DTTM.5>
							<xsl:value-of select="$Vvar484_const"/>
						</DTTM.5>
						<DTTM.6>
							<xsl:value-of select="$Vvar484_const"/>
						</DTTM.6>
					</TS.1>
				</PID.7>
				<xsl:for-each select="MainQuery">
					<xsl:for-each select="sianc.paziente.PazienteBean">
						<xsl:for-each select="sesso">
							<xsl:variable name="Vvar1434_sesso_anySimpleType" select="."/>
							<PID.8>
								<xsl:value-of select="$Vvar1434_sesso_anySimpleType"/>
							</PID.8>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<PID.11>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="codiceISTATComuneNascita">
								<xsl:variable name="Vvar1443_codiceISTATComuneNascita_anySimpleType" select="."/>
								<XAD.3>
									<xsl:value-of select="$Vvar1443_codiceISTATComuneNascita_anySimpleType"/>
								</XAD.3>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="codiceISTATComuneNascita">
								<xsl:variable name="Vvar1450_codiceISTATComuneNascita_anySimpleType" select="."/>
								<xsl:variable name="Vvar1456_result_equal" select="(substring(string($Vvar1450_codiceISTATComuneNascita_anySimpleType), number(1), number($Vvar1453_const))) = ('999')"/>
								<xsl:variable name="Vvar1457_cond">
									<xsl:choose>
										<xsl:when test="(string($Vvar1456_result_equal))='true'">
											<xsl:value-of select="substring(string($Vvar1450_codiceISTATComuneNascita_anySimpleType), number('4'), number($Vvar1453_const))"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'100'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<XAD.6>
									<xsl:value-of select="$Vvar1457_cond"/>
								</XAD.6>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityNascita">
							<xsl:variable name="Vvar1468_AuthorityNascita_anySimpleType" select="."/>
							<XAD.7>
								<xsl:value-of select="$Vvar1468_AuthorityNascita_anySimpleType"/>
							</XAD.7>
						</xsl:for-each>
					</xsl:for-each>
				</PID.11>
				<PID.11>
					<XAD.1>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="indirizzoResidenza">
									<xsl:variable name="Vvar1477_indirizzoResidenza_anySimpleType" select="."/>
									<SAD.1>
										<xsl:value-of select="$Vvar1477_indirizzoResidenza_anySimpleType"/>
									</SAD.1>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<SAD.2>
							<xsl:value-of select="$Vvar484_const"/>
						</SAD.2>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="numeroCivicoResidenza">
									<xsl:variable name="Vvar1486_numeroCivicoResidenza_anySimpleType" select="."/>
									<SAD.3>
										<xsl:value-of select="$Vvar1486_numeroCivicoResidenza_anySimpleType"/>
									</SAD.3>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</XAD.1>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="codiceISTATComuneResidenza">
								<xsl:variable name="Vvar1495_codiceISTATComuneResidenza_anySimpleType" select="."/>
								<XAD.3>
									<xsl:value-of select="$Vvar1495_codiceISTATComuneResidenza_anySimpleType"/>
								</XAD.3>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="capResidenza">
								<xsl:variable name="Vvar1504_capResidenza_anySimpleType" select="."/>
								<XAD.5>
									<xsl:value-of select="$Vvar1504_capResidenza_anySimpleType"/>
								</XAD.5>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityResidenza">
							<xsl:variable name="Vvar1511_AuthorityResidenza_anySimpleType" select="."/>
							<XAD.7>
								<xsl:value-of select="$Vvar1511_AuthorityResidenza_anySimpleType"/>
							</XAD.7>
						</xsl:for-each>
					</xsl:for-each>
				</PID.11>
				<PID.11>
					<XAD.1>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="indirizzoDomicilio">
									<xsl:variable name="Vvar1520_indirizzoDomicilio_anySimpleType" select="."/>
									<SAD.1>
										<xsl:value-of select="$Vvar1520_indirizzoDomicilio_anySimpleType"/>
									</SAD.1>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<SAD.2>
							<xsl:value-of select="$Vvar484_const"/>
						</SAD.2>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="numeroCivicoDomicilio">
									<xsl:variable name="Vvar1529_numeroCivicoDomicilio_anySimpleType" select="."/>
									<SAD.3>
										<xsl:value-of select="$Vvar1529_numeroCivicoDomicilio_anySimpleType"/>
									</SAD.3>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</XAD.1>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="codiceISTATComuneDomicilio">
								<xsl:variable name="Vvar1538_codiceISTATComuneDomicilio_anySimpleType" select="."/>
								<XAD.3>
									<xsl:value-of select="$Vvar1538_codiceISTATComuneDomicilio_anySimpleType"/>
								</XAD.3>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="capDomicilio">
								<xsl:variable name="Vvar1547_capDomicilio_anySimpleType" select="."/>
								<XAD.5>
									<xsl:value-of select="$Vvar1547_capDomicilio_anySimpleType"/>
								</XAD.5>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityDomicilio">
							<xsl:variable name="Vvar1554_AuthorityDomicilio_anySimpleType" select="."/>
							<XAD.7>
								<xsl:value-of select="$Vvar1554_AuthorityDomicilio_anySimpleType"/>
							</XAD.7>
						</xsl:for-each>
					</xsl:for-each>
				</PID.11>
				<PID.13>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="numeroTelefono1">
								<xsl:variable name="Vvar1563_numeroTelefono1_anySimpleType" select="."/>
								<XTN.12>
									<xsl:value-of select="$Vvar1563_numeroTelefono1_anySimpleType"/>
								</XTN.12>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</PID.13>
				<PID.13>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="numeroTelefono2">
								<xsl:variable name="Vvar1572_numeroTelefono2_anySimpleType" select="."/>
								<XTN.12>
									<xsl:value-of select="$Vvar1572_numeroTelefono2_anySimpleType"/>
								</XTN.12>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</PID.13>
				<PID.26>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="sianc.paziente.PazienteBean">
							<xsl:for-each select="codiceCittadinanza">
								<xsl:variable name="Vvar1581_codiceCittadinanza_anySimpleType" select="."/>
								<CE.1>
									<xsl:value-of select="$Vvar1581_codiceCittadinanza_anySimpleType"/>
								</CE.1>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</PID.26>
				<PID.29>
					<TS.1>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="dataDecesso">
									<xsl:variable name="Vvar1588_dataDecesso_anySimpleType" select="."/>
									<DTTM.1>
										<xsl:value-of select="substring(string($Vvar1588_dataDecesso_anySimpleType), number(1), number(4))"/>
									</DTTM.1>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="dataDecesso">
									<xsl:variable name="Vvar1600_dataDecesso_anySimpleType" select="."/>
									<DTTM.2>
										<xsl:value-of select="substring(string($Vvar1600_dataDecesso_anySimpleType), number(5), number(2))"/>
									</DTTM.2>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="sianc.paziente.PazienteBean">
								<xsl:for-each select="dataDecesso">
									<xsl:variable name="Vvar1612_dataDecesso_anySimpleType" select="."/>
									<DTTM.3>
										<xsl:value-of select="substring(string($Vvar1612_dataDecesso_anySimpleType), number(7), number(2))"/>
									</DTTM.3>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<DTTM.4>
							<xsl:value-of select="$Vvar290_const"/>
						</DTTM.4>
						<DTTM.5>
							<xsl:value-of select="$Vvar290_const"/>
						</DTTM.5>
					</TS.1>
				</PID.29>
			</PID>
			<xsl:variable name="ExistsResult">
				<xsl:for-each select="MainQuery">
					<xsl:for-each select="AH_MODA_DIM_ID">
						<xsl:value-of select="true()"/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="Vvar892_exists" select="string-length( $ExistsResult )&gt;0"/>
			<xsl:variable name="Vvar901_cond">
				<xsl:choose>
					<xsl:when test="(string($Vvar892_exists))='true'">
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_EVENTOC">
								<xsl:variable name="Vvar1758_AH_DT_EVENTOC_anySimpleType" select="."/>
								<xsl:value-of select="string($Vvar1758_AH_DT_EVENTOC_anySimpleType)"/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ExistsResult1">
				<xsl:for-each select="MainQuery">
					<xsl:for-each select="AH_MODA_DIM_ID">
						<xsl:value-of select="true()"/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="Vvar914_exists" select="string-length( $ExistsResult1 )&gt;0"/>
			<xsl:variable name="Vvar923_cond">
				<xsl:choose>
					<xsl:when test="(string($Vvar914_exists))='true'">
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_EVENTOC">
								<xsl:variable name="Vvar1770_AH_DT_EVENTOC_anySimpleType" select="."/>
								<xsl:value-of select="string($Vvar1770_AH_DT_EVENTOC_anySimpleType)"/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ExistsResult2">
				<xsl:for-each select="MainQuery">
					<xsl:for-each select="AH_MODA_DIM_ID">
						<xsl:value-of select="true()"/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="Vvar936_exists" select="string-length( $ExistsResult2 )&gt;0"/>
			<xsl:variable name="Vvar945_cond">
				<xsl:choose>
					<xsl:when test="(string($Vvar936_exists))='true'">
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_EVENTOC">
								<xsl:variable name="Vvar1782_AH_DT_EVENTOC_anySimpleType" select="."/>
								<xsl:value-of select="string($Vvar1782_AH_DT_EVENTOC_anySimpleType)"/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ExistsResult3">
				<xsl:for-each select="MainQuery">
					<xsl:for-each select="AH_MODA_DIM_ID">
						<xsl:value-of select="true()"/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="Vvar958_exists" select="string-length( $ExistsResult3 )&gt;0"/>
			<xsl:variable name="Vvar967_cond">
				<xsl:choose>
					<xsl:when test="(string($Vvar958_exists))='true'">
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_EVENTOC">
								<xsl:variable name="Vvar1794_AH_DT_EVENTOC_anySimpleType" select="."/>
								<xsl:value-of select="string($Vvar1794_AH_DT_EVENTOC_anySimpleType)"/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ExistsResult4">
				<xsl:for-each select="MainQuery">
					<xsl:for-each select="AH_MODA_DIM_ID">
						<xsl:value-of select="true()"/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="Vvar980_exists" select="string-length( $ExistsResult4 )&gt;0"/>
			<xsl:variable name="Vvar989_cond">
				<xsl:choose>
					<xsl:when test="(string($Vvar980_exists))='true'">
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_EVENTOC">
								<xsl:variable name="Vvar1806_AH_DT_EVENTOC_anySimpleType" select="."/>
								<xsl:value-of select="string($Vvar1806_AH_DT_EVENTOC_anySimpleType)"/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ExistsResult5">
				<xsl:for-each select="MainQuery">
					<xsl:for-each select="AH_MODA_DIM_ID">
						<xsl:value-of select="true()"/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="Vvar1002_exists" select="string-length( $ExistsResult5 )&gt;0"/>
			<xsl:variable name="Vvar1011_cond">
				<xsl:choose>
					<xsl:when test="(string($Vvar1002_exists))='true'">
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_EVENTOC">
								<xsl:variable name="Vvar1818_AH_DT_EVENTOC_anySimpleType" select="."/>
								<xsl:value-of select="string($Vvar1818_AH_DT_EVENTOC_anySimpleType)"/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:variable>
			<PV1>
				<xsl:for-each select="DatiFissi">
					<xsl:for-each select="TipoAccesso">
						<xsl:variable name="Vvar1624_TipoAccesso_anySimpleType" select="."/>
						<PV1.2>
							<xsl:value-of select="$Vvar1624_TipoAccesso_anySimpleType"/>
						</PV1.2>
					</xsl:for-each>
				</xsl:for-each>
				<PV1.3>
					<xsl:for-each select="DatiCalcolati">
						<xsl:for-each select="MatricolaUP">
							<xsl:variable name="Vvar1631_MatricolaUP_anySimpleType" select="."/>
							<PL.1>
								<xsl:value-of select="$Vvar1631_MatricolaUP_anySimpleType"/>
							</PL.1>
						</xsl:for-each>
					</xsl:for-each>
					<PL.4>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="StruttSan">
								<xsl:variable name="Vvar1638_StruttSan_anySimpleType" select="."/>
								<HD.1>
									<xsl:value-of select="$Vvar1638_StruttSan_anySimpleType"/>
								</HD.1>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="UO">
								<xsl:variable name="Vvar1645_UO_anySimpleType" select="."/>
								<HD.2>
									<xsl:value-of select="$Vvar1645_UO_anySimpleType"/>
								</HD.2>
							</xsl:for-each>
						</xsl:for-each>
					</PL.4>
				</PV1.3>
				<PV1.6>
					<xsl:for-each select="DatiCalcolati">
						<xsl:for-each select="MatricolaUPPrec">
							<xsl:variable name="Vvar1652_MatricolaUPPrec_anySimpleType" select="."/>
							<PL.1>
								<xsl:value-of select="$Vvar1652_MatricolaUPPrec_anySimpleType"/>
							</PL.1>
						</xsl:for-each>
					</xsl:for-each>
					<PL.4>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="StruttSanPrec">
								<xsl:variable name="Vvar1659_StruttSanPrec_anySimpleType" select="."/>
								<HD.1>
									<xsl:value-of select="$Vvar1659_StruttSanPrec_anySimpleType"/>
								</HD.1>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="DatiCalcolati">
							<xsl:for-each select="UOPrec">
								<xsl:variable name="Vvar1666_UOPrec_anySimpleType" select="."/>
								<HD.2>
									<xsl:value-of select="$Vvar1666_UOPrec_anySimpleType"/>
								</HD.2>
							</xsl:for-each>
						</xsl:for-each>
					</PL.4>
				</PV1.6>
				<PV1.19>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="AH_CODNOSO">
							<xsl:variable name="Vvar1673_AH_CODNOSO_anySimpleType" select="."/>
							<CX.1>
								<xsl:value-of select="$Vvar1673_AH_CODNOSO_anySimpleType"/>
							</CX.1>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityIdentificativo">
							<xsl:variable name="Vvar1680_AuthorityIdentificativo_anySimpleType" select="."/>
							<CX.5>
								<xsl:value-of select="$Vvar1680_AuthorityIdentificativo_anySimpleType"/>
							</CX.5>
						</xsl:for-each>
					</xsl:for-each>
				</PV1.19>
				<xsl:for-each select="MainQuery">
					<xsl:for-each select="AH_MODA_DIM_ID">
						<xsl:variable name="Vvar1687_AH_MODA_DIM_ID_anySimpleType" select="."/>
						<PV1.36>
							<xsl:value-of select="$Vvar1687_AH_MODA_DIM_ID_anySimpleType"/>
						</PV1.36>
					</xsl:for-each>
				</xsl:for-each>
				<PV1.44>
					<TS.1>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_CONTATTOC">
								<xsl:variable name="Vvar1692_AH_DT_CONTATTOC_anySimpleType" select="."/>
								<DTTM.1>
									<xsl:value-of select="substring(string($Vvar1692_AH_DT_CONTATTOC_anySimpleType), number(1), number(4))"/>
								</DTTM.1>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_CONTATTOC">
								<xsl:variable name="Vvar1702_AH_DT_CONTATTOC_anySimpleType" select="."/>
								<DTTM.2>
									<xsl:value-of select="substring(string($Vvar1702_AH_DT_CONTATTOC_anySimpleType), number(5), number(2))"/>
								</DTTM.2>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_CONTATTOC">
								<xsl:variable name="Vvar1712_AH_DT_CONTATTOC_anySimpleType" select="."/>
								<DTTM.3>
									<xsl:value-of select="substring(string($Vvar1712_AH_DT_CONTATTOC_anySimpleType), number(7), number(2))"/>
								</DTTM.3>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_CONTATTOC">
								<xsl:variable name="Vvar1722_AH_DT_CONTATTOC_anySimpleType" select="."/>
								<DTTM.4>
									<xsl:value-of select="substring(string($Vvar1722_AH_DT_CONTATTOC_anySimpleType), number(9), number(2))"/>
								</DTTM.4>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_CONTATTOC">
								<xsl:variable name="Vvar1732_AH_DT_CONTATTOC_anySimpleType" select="."/>
								<DTTM.5>
									<xsl:value-of select="substring(string($Vvar1732_AH_DT_CONTATTOC_anySimpleType), number(11), number(2))"/>
								</DTTM.5>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="MainQuery">
							<xsl:for-each select="AH_DT_CONTATTOC">
								<xsl:variable name="Vvar1742_AH_DT_CONTATTOC_anySimpleType" select="."/>
								<DTTM.6>
									<xsl:value-of select="substring(string($Vvar1742_AH_DT_CONTATTOC_anySimpleType), number(13), number(2))"/>
								</DTTM.6>
							</xsl:for-each>
						</xsl:for-each>
					</TS.1>
				</PV1.44>
				<PV1.45>
					<TS.1>
						<DTTM.1>
							<xsl:value-of select="substring($Vvar901_cond, number(1), number(4))"/>
						</DTTM.1>
						<DTTM.2>
							<xsl:value-of select="substring($Vvar923_cond, number(5), number(2))"/>
						</DTTM.2>
						<DTTM.3>
							<xsl:value-of select="substring($Vvar945_cond, number(7), number(2))"/>
						</DTTM.3>
						<DTTM.4>
							<xsl:value-of select="substring($Vvar967_cond, number(9), number(2))"/>
						</DTTM.4>
						<DTTM.5>
							<xsl:value-of select="substring($Vvar989_cond, number(11), number(2))"/>
						</DTTM.5>
						<DTTM.6>
							<xsl:value-of select="substring($Vvar1011_cond, number(13), number(2))"/>
						</DTTM.6>
					</TS.1>
				</PV1.45>
				<PV1.50>
					<xsl:for-each select="MainQuery">
						<xsl:for-each select="AH_CODNOSO">
							<xsl:variable name="Vvar1826_AH_CODNOSO_anySimpleType" select="."/>
							<CX.1>
								<xsl:value-of select="$Vvar1826_AH_CODNOSO_anySimpleType"/>
							</CX.1>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="DatiFissi">
						<xsl:for-each select="AuthorityIdentificativo">
							<xsl:variable name="Vvar1833_AuthorityIdentificativo_anySimpleType" select="."/>
							<CX.5>
								<xsl:value-of select="$Vvar1833_AuthorityIdentificativo_anySimpleType"/>
							</CX.5>
						</xsl:for-each>
					</xsl:for-each>
				</PV1.50>
			</PV1>
		</ADT_A01>
	</xsl:template>
</xsl:stylesheet>
		