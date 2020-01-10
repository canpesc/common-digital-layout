<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="Formatting.xsl" />
  <xsl:include href="Enums.xsl" />


	<xsl:template name="AcademicAward.AcademicDegreeCode">
		<xsl:call-template name="Enums.AcademicAwardLevel">
			<xsl:with-param name="v_enum" select="AcademicAwardLevel/text()" />
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="AcademicAward.AcademicDegreeDescription">
		<xsl:value-of select="AcademicAwardTitle/text()" />
	</xsl:template>
	<xsl:template name="AcademicAward.HonoursLevel">
		<xsl:call-template name="Enums.HonorsLevel">
			<xsl:with-param name="v_enum" select="AcademicHonors/HonorsLevel/text()" />
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="AcademicAward.DateDegreeAwarded">
		<xsl:call-template name="Formatting.string_date_xml">
			<xsl:with-param name="date" select="AcademicAwardDate/text()"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicAwardProgram.StudyLevel">
		<xsl:call-template name="Enums.AcademicProgramType">
			<xsl:with-param name="v_enum" select="AcademicAwardProgram/AcademicProgramType/text()"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicAwardProgram.Description1">
		<xsl:value-of select="AcademicAwardProgram/AcademicProgramName/text()" />
	</xsl:template>
	<xsl:template name="AcademicAwardProgram.Description2">
		<xsl:value-of select="AcademicAwardProgram/NoteMessage/text()" />
	</xsl:template>
</xsl:stylesheet>