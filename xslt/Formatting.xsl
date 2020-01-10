<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Dates Descriptions -->
	<xsl:template name="Formatting.standard_date">
		<xsl:param name="date" />
		<xsl:if test="$date !=''">
			<!-- Year -->
			<xsl:value-of select="substring($date, 1, 4)" />
			<xsl:text>-</xsl:text>
			<!-- Month -->
			<xsl:value-of select="substring($date, 6, 2)" />
			<xsl:text>-</xsl:text>
			<!-- Day -->
			<xsl:value-of select="substring($date, 9, 2)" />
		</xsl:if>
	</xsl:template>
	<xsl:template name="Formatting.last_standard_date">
		<xsl:param name="date" />
		<xsl:if test="$date !=''">
			<!-- Year -->
			<xsl:value-of select="substring($date, 10, 4)" />
			<xsl:text>-</xsl:text>
			<!-- Month -->
			<xsl:value-of select="substring($date, 15, 2)" />
		</xsl:if>
	</xsl:template>
	<xsl:template name="Formatting.standard_date_xml">
		<xsl:param name="date" />
		<xsl:if test="$date !=''">
			<xsl:value-of select="substring($date, 1, 10)" />
		</xsl:if>
	</xsl:template>
	<xsl:template name="Formatting.short_date">
		<xsl:param name="date" />
		<!-- Month -->
		<xsl:value-of select="substring($date, 5, 2)" />
		<xsl:text>/</xsl:text>
		<!-- Year -->
		<xsl:value-of select="substring($date, 3, 2)" />
	</xsl:template>
	<xsl:template name="Formatting.long_date">
		<xsl:param name="date" />
		<!-- Day -->
		<xsl:value-of select="number(substring($date, 7, 2))" />
		<xsl:text> </xsl:text>
		<!-- Month -->
		<xsl:variable name="month"  select="number(substring($date, 5, 2))"/>
		<xsl:choose>
			<xsl:when test="$month=1">January</xsl:when>
			<xsl:when test="$month=2">February</xsl:when>
			<xsl:when test="$month=3">March</xsl:when>
			<xsl:when test="$month=4">April</xsl:when>
			<xsl:when test="$month=5">May</xsl:when>
			<xsl:when test="$month=6">June</xsl:when>
			<xsl:when test="$month=7">July</xsl:when>
			<xsl:when test="$month=8">August</xsl:when>
			<xsl:when test="$month=9">September</xsl:when>
			<xsl:when test="$month=10">October</xsl:when>
			<xsl:when test="$month=11">November</xsl:when>
			<xsl:when test="$month=12">December</xsl:when>
			<xsl:otherwise>INVALID MONTH</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<!-- Year -->
		<xsl:value-of select="substring($date, 1, 4)" />
	</xsl:template>
	<xsl:template name="Formatting.string_date">
		<xsl:param name="date" />
		<xsl:if test="$date !=''">
			<!-- Month -->
			<xsl:variable name="month" select="number(substring($date, 5, 2))"/>
			<xsl:choose>
				<xsl:when test="$month=1">January</xsl:when>
				<xsl:when test="$month=2">February</xsl:when>
				<xsl:when test="$month=3">March</xsl:when>
				<xsl:when test="$month=4">April</xsl:when>
				<xsl:when test="$month=5">May</xsl:when>
				<xsl:when test="$month=6">June</xsl:when>
				<xsl:when test="$month=7">July</xsl:when>
				<xsl:when test="$month=8">August</xsl:when>
				<xsl:when test="$month=9">September</xsl:when>
				<xsl:when test="$month=10">October</xsl:when>
				<xsl:when test="$month=11">November</xsl:when>
				<xsl:when test="$month=12">December</xsl:when>
				<xsl:otherwise>INVALID MONTH</xsl:otherwise>
			</xsl:choose>
			<xsl:text> </xsl:text>
			<!-- Day -->
			<xsl:if test="string(number(substring($date, 7, 2))) != 'NaN'">
				<xsl:value-of select="number(substring($date, 7, 2))" />
				<xsl:text>, </xsl:text>
			</xsl:if>
			<!-- Year -->
			<xsl:value-of select="substring($date, 1, 4)" />
		</xsl:if>
	</xsl:template>
	<xsl:template name="Formatting.string_date_xml">
		<xsl:param name="date" />
		<xsl:if test="$date !=''">
			<!-- Month -->
			<xsl:variable name="month" select="number(substring($date, 6, 2))"/>
			<xsl:choose>
				<xsl:when test="$month=1">January</xsl:when>
				<xsl:when test="$month=2">February</xsl:when>
				<xsl:when test="$month=3">March</xsl:when>
				<xsl:when test="$month=4">April</xsl:when>
				<xsl:when test="$month=5">May</xsl:when>
				<xsl:when test="$month=6">June</xsl:when>
				<xsl:when test="$month=7">July</xsl:when>
				<xsl:when test="$month=8">August</xsl:when>
				<xsl:when test="$month=9">September</xsl:when>
				<xsl:when test="$month=10">October</xsl:when>
				<xsl:when test="$month=11">November</xsl:when>
				<xsl:when test="$month=12">December</xsl:when>
				<xsl:otherwise>INVALID MONTH</xsl:otherwise>
			</xsl:choose>
			<xsl:text> </xsl:text>
			<!-- Day -->
			<xsl:if test="string(number(substring($date, 9, 2))) != 'NaN'">
				<xsl:value-of select="number(substring($date, 9, 2))" />
				<xsl:text>, </xsl:text>
			</xsl:if>
			<!-- Year -->
			<xsl:value-of select="substring($date, 1, 4)" />
		</xsl:if>
	</xsl:template>
	<xsl:decimal-format name="SummaryFormat" NaN=" " zero-digit="0"/>
	<xsl:template name="removeLeadingZeros">
		<xsl:param name="originalString"/>
		<xsl:choose>
			<xsl:when test="starts-with($originalString,'0')">
				<xsl:call-template name="removeLeadingZeros">
					<xsl:with-param name="originalString">
						<xsl:value-of select="substring-after($originalString,'0' )"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$originalString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>