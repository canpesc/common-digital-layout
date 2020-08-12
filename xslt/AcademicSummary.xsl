<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="AcademicSummary.AcademicCredit">
		<xsl:call-template name="SUM">
			<xsl:with-param name="code" select="1141"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicSummary.AcademicGrade">
		<xsl:call-template name="SUM">
			<xsl:with-param name="code" select="1142"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicSummary.IndicatorCumulativeSummary">
		<xsl:call-template name="SUM">
			<xsl:with-param name="code" select="1073"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicSummary.AcademicCreditGPA">
		<xsl:call-template name="SUMNumFormat">
			<xsl:with-param name="code" select="GPA/CreditHoursForGPA/text()"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicSummary.AcademicCreditsTaken">
		<xsl:call-template name="SUM">
			<xsl:with-param name="code" select="380"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicSummary.RangeMinimum">
		<xsl:call-template name="SUMNumFormat">
			<xsl:with-param name="code" select="GPA/GPARangeMinimum/text()"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicSummary.RangeMaximum">
		<xsl:call-template name="SUMNumFormat">
			<xsl:with-param name="code" select="GPA/GPARangeMaximum/text()"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicSummary.AcademicGPA">
		<xsl:call-template name="SUMNumFormat">
			<xsl:with-param name="code" select="GPA/GradePointAverage/text()"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="AcademicSummary.ClassRank">
		<xsl:call-template name="SUM">
			<xsl:with-param name="code" select="1145"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="SUM">
		<xsl:param name="code"/>
		<xsl:value-of select="segment[@code='SUM']/element[@code=$code]/text()"/>
	</xsl:template>
	
	<xsl:template name="SUMNumFormat">
		<xsl:param name="code"/>
		<xsl:value-of select="format-number($code, '#0.00', 'SummaryFormat')" />
	</xsl:template>
</xsl:stylesheet>