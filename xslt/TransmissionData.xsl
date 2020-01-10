<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="Formatting.xsl" />
  <xsl:template name="TransmissionData.CreatedDate">
    <xsl:call-template name="Formatting.standard_date_xml">
      <xsl:with-param name="date" select="//TransmissionData/CreatedDateTime/text()"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="TransmissionData.SourceInstitutionName">
    <xsl:value-of select="//TransmissionData/Source/Organization/OrganizationName/text()" />
  </xsl:template>

  <xsl:template name="ContactInformation.Name">
    <xsl:value-of select="//*[local-name()='Source']/*[local-name()='Organization']/*[local-name()='Contacts']/*[local-name()='NoteMessage']"/>
    <xsl:value-of select="//*[local-name()='Source']/*[local-name()='Organization']/*[local-name()='Contacts']/*[local-name()='Phone']/*[local-name()='NoteMessage']"/>
  </xsl:template>
  <xsl:template name="ContactInformation.Telephone">
    <xsl:value-of select="//*[local-name()='Source']/*[local-name()='Organization']/*[local-name()='Contacts']/*[local-name()='Phone']/*[local-name()='AreaCityCode']"/>
    <xsl:value-of select="//*[local-name()='Source']/*[local-name()='Organization']/*[local-name()='Contacts']/*[local-name()='Phone']/*[local-name()='PhoneNumber']"/>
  </xsl:template>
</xsl:stylesheet>