<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="Course.HighSchoolGrade">
    <xsl:if test="CourseCreditLevel/text()='NinthGrade'">9</xsl:if>
    <xsl:if test="CourseCreditLevel/text()='TenthGrade'">10</xsl:if>
    <xsl:if test="CourseCreditLevel/text()='EleventhGrade'">11</xsl:if>
    <xsl:if test="CourseCreditLevel/text()='TwelfthGrade'">12</xsl:if>
  </xsl:template>

  <xsl:template name="Course.BasisAcademicDescription">
    <xsl:param name="BasisAcademicRegular" />
    <xsl:param name="BasisAcademicCreditByExam" />
    <xsl:param name="BasisAcademicHighSchoolTransferCredit" />
    <xsl:if test="CourseCreditBasis/text()='Regular'">
      <xsl:value-of select="$BasisAcademicRegular"/>
    </xsl:if>
    <xsl:if test="CourseCreditBasis/text()='CreditByExam'">
      <xsl:value-of select="$BasisAcademicCreditByExam"/>
    </xsl:if>
    <xsl:if test="CourseCreditBasis/text()='HighSchoolTransferCredit'">
      <xsl:value-of select="$BasisAcademicHighSchoolTransferCredit"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="Course.AcademicCreditQualifier">
    <xsl:value-of select="CourseAcademicGradeScaleCode/text()" />
  </xsl:template>

  <xsl:template name="Course.AcademicGrade">
    <xsl:value-of select="CourseAcademicGrade/text()" />
  </xsl:template>

  <xsl:template name="Course.SubjectAreaCode">
    <xsl:value-of select="CourseSubjectAreaCode/text()" />
    <xsl:value-of select="CourseCSISCode/text()" />
    <xsl:value-of select="CourseUSISCode/text()" />
  </xsl:template>

  <xsl:template name="Course.CreditValue">
    <xsl:value-of select="CourseCreditValue/text()" />
  </xsl:template>

  <xsl:template name="Course.CreditsEarned">
    <xsl:value-of select="CourseCreditEarned/text()" />
  </xsl:template>

  <xsl:template name="Course.CourseNumber">
    <xsl:value-of select="CourseNumber/text()" />
  </xsl:template>

  <xsl:template name="Course.CourseDate">
    <xsl:value-of select="CourseEndDate/text()" />
  </xsl:template>

  <xsl:template name="Course.SubjectAbbreviation">
    <xsl:value-of select="CourseSubjectAbbreviation/text()" />
  </xsl:template>

  <xsl:template name="Course.CourseTitle">
    <xsl:value-of select="CourseTitle/text()" />
  </xsl:template>

  <xsl:template name="Course.InstitutionCode">
    <xsl:value-of select="CourseSubjectAreaCode/text()" />
  </xsl:template>

  <xsl:template name="Course.GradeStatus">
    <xsl:call-template name="Enums.CourseAcademicGradeStatusCode">
      <xsl:with-param name="v_enum" select="CourseAcademicGradeStatusCode/text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="MKS.MarkCodeType">
    <xsl:value-of select="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text()" />
  </xsl:template>
  
  <xsl:template name="MKS.AcademicGrade">
    <xsl:value-of select="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text()" />
  </xsl:template>
</xsl:stylesheet>