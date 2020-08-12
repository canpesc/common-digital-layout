<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Academic Program -->
  <xsl:template name="Enums.AcademicProgramType" >
    <xsl:param name="v_enum"/>
    <xsl:if test="$v_enum='Concentration'">Concentration</xsl:if>
    <xsl:if test="$v_enum='Focus'">Endorsement</xsl:if>
    <xsl:if test="$v_enum='Major'">Major</xsl:if>
    <xsl:if test="$v_enum='Minor'">Minor</xsl:if>
    <xsl:if test="$v_enum='Specialization'">Specialization</xsl:if>
    <xsl:if test="$v_enum='C'">Concentration</xsl:if>
    <xsl:if test="$v_enum='E'">Endorsement</xsl:if>
    <xsl:if test="$v_enum='G'">Graduate Non-Degree</xsl:if>
    <xsl:if test="$v_enum='L'">Licensing</xsl:if>
    <xsl:if test="$v_enum='M'">Major</xsl:if>
    <xsl:if test="$v_enum='N'">Minor</xsl:if>
    <xsl:if test="$v_enum='S'">Specialization</xsl:if>
    <xsl:if test="$v_enum='T'">Teaching</xsl:if>
    <xsl:if test="$v_enum='V'">Visiting Scholar</xsl:if>
  </xsl:template>

  <!-- Academic Awards -->
  <xsl:template name="Enums.AcademicAwardLevel" >
    <xsl:param name="v_enum"/>
    <xsl:if test="$v_enum='0.0'">Other</xsl:if>
    <xsl:if test="$v_enum='2.0'">Undergraduate Non-Degree</xsl:if>
    <xsl:if test="$v_enum='2.1'">Postsecondary Certificate or Diploma (less than one year)</xsl:if>
    <xsl:if test="$v_enum='2.2'">Postsecondary Certificate or Diploma (one year or more but less than four years)</xsl:if>
    <xsl:if test="$v_enum='2.3'">Associate Degree</xsl:if>
    <xsl:if test="$v_enum='2.4'">Baccalaureate Degree</xsl:if>
    <xsl:if test="$v_enum='2.5'">Baccalaureate (Honours) Degree</xsl:if>
    <xsl:if test="$v_enum='2.6'">Postsecondary Certificate or Diploma (one year or more but less than two years)</xsl:if>
    <xsl:if test="$v_enum='2.7'">Postsecondary Certificate or Diploma (two year or more but less than four years)</xsl:if>
    <xsl:if test="$v_enum='3.0'">Graduate Professional</xsl:if>
    <xsl:if test="$v_enum='3.1'">First Professional Degree</xsl:if>
    <xsl:if test="$v_enum='3.2'">Post-Professional Degree</xsl:if>
    <xsl:if test="$v_enum='4.0'">Graduate Non-Degree</xsl:if>
    <xsl:if test="$v_enum='4.1'">Graduate Certificate</xsl:if>
    <xsl:if test="$v_enum='4.2'">Master's Degree</xsl:if>
    <xsl:if test="$v_enum='4.3'">Intermediate Graduate Degree</xsl:if>
    <xsl:if test="$v_enum='4.4'">Doctoral Degree</xsl:if>
    <xsl:if test="$v_enum='4.5'">Post-Doctoral Degree</xsl:if>
    <xsl:if test="$v_enum='B35'">Highest Honors</xsl:if>
    <xsl:if test="$v_enum='B36'">Second Highest Honors</xsl:if>
    <xsl:if test="$v_enum='B37'">Third Highest Honors</xsl:if>
  </xsl:template>
  <xsl:template name="Enums.HonorsLevel">
    <xsl:param name="v_enum"/>
    <xsl:if test="$v_enum='FirstHighest'">Highest Honors</xsl:if>
    <xsl:if test="$v_enum='SecondHighest'">Second Highest Honors</xsl:if>
    <xsl:if test="$v_enum='ThirdHighest'">Third Highest Honors</xsl:if>
  </xsl:template>
  
  <!-- Courses -->
  <xsl:template name="Enums.CourseAcademicGradeStatusCode">
    <xsl:param name="v_enum"/>
    <xsl:if test="$v_enum='AuditedCourse'">Audited</xsl:if>
    <xsl:if test="$v_enum='HonorsGrade'">Honours</xsl:if>
    <xsl:if test="$v_enum='Incomplete'">Incomplete</xsl:if>
    <xsl:if test="$v_enum='IncompleteNotResolvedFail'">Incomplete Fail</xsl:if>
    <xsl:if test="$v_enum='InProgress'">In Progress</xsl:if>
    <xsl:if test="$v_enum='NotYetReported'">Not Yet Reported</xsl:if>
    <xsl:if test="$v_enum='OtherFail'">Fail (Other)</xsl:if>
    <xsl:if test="$v_enum='OtherPass'">Pass (Other)</xsl:if>
    <xsl:if test="$v_enum='PassFailFail'">Fail</xsl:if>
    <xsl:if test="$v_enum='PassFailPass'">Pass</xsl:if>
    <xsl:if test="$v_enum='Withdrew'">Withdrawn</xsl:if>
    <xsl:if test="$v_enum='WithdrewFailing'">Withdrawn (Failing)</xsl:if>
    <xsl:if test="$v_enum='WithdrewNoPenalty'">Withdrawn (No Penalty)</xsl:if>
    <xsl:if test="$v_enum='WithdrewPassing'">Withdrawn (Passing)</xsl:if>
  </xsl:template>

</xsl:stylesheet>