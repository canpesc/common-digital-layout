<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Individual Person Description -->
	<xsl:template name="StudentInformation.getIndividualName">
		<xsl:param name="individualNameElement" select="'z'"/>
		<xsl:if test="$individualNameElement='Prefix'">
			<xsl:value-of select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Name']/*[local-name()='NamePrefix']"/>
		</xsl:if>
		<xsl:if test="$individualNameElement='FirstName'">
			<xsl:value-of select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Name']/*[local-name()='FirstName']"/>
		</xsl:if>
		<xsl:if test="$individualNameElement='MiddleName'">
			<xsl:value-of select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Name']/*[local-name()='MiddleName']"/>
		</xsl:if>
		<xsl:if test="$individualNameElement='LastName'">
			<xsl:value-of select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Name']/*[local-name()='LastName']"/>
		</xsl:if>
		<xsl:if test="$individualNameElement='FormerLastName'">
			<xsl:value-of select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='AlternateName']/*[local-name()='LastName']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="StudentInformation.StudentGender">
		<xsl:param name="GenderMale" />
		<xsl:param name="GenderFemale" />
		<xsl:param name="GenderUnreported" />
		<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Gender']/*[local-name()='GenderCode']/text()='Male'">
			<xsl:value-of select="$GenderMale"/>
		</xsl:if>
		<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Gender']/*[local-name()='GenderCode']/text()='Female'">
			<xsl:value-of select="$GenderFemale"/>
		</xsl:if>
		<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Gender']/*[local-name()='GenderCode']/text()='Unreported'">
			<xsl:value-of select="$GenderUnreported"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="StudentInformation.DateOfBirth">
		<xsl:call-template name="Formatting.standard_date_xml">
			<xsl:with-param name="date" select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Birth']/*[local-name()='BirthDate']/text()"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="StudentInformation.AgencyID">
		<xsl:value-of select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='AgencyAssignedID']"/>
		<xsl:for-each select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='AgencyIdentifier']">
			<xsl:if test="AgencyName/text()='OCAS Application Number'">
				<xsl:value-of select="AgencyAssignedID/text()"/>
			</xsl:if>
			<xsl:if test="AgencyName/text()='OUAC Application Number'">
				<xsl:value-of select="AgencyAssignedID/text()"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="StudentInformation.OEN">
		<xsl:for-each select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='AgencyIdentifier']">
			<xsl:if test="AgencyCode/text()='State'">
				<xsl:value-of select="AgencyAssignedID/text()"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="StudentInformation.StudentID">
		<xsl:value-of select="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='SchoolAssignedPersonID']"/>
	</xsl:template>
</xsl:stylesheet>