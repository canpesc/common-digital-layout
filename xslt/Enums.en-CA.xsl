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
    <xsl:if test="$v_enum='TransferNoGrade'">Transfer credit</xsl:if>
    <xsl:if test="$v_enum='Withdrew'">Withdrawn</xsl:if>
    <xsl:if test="$v_enum='WithdrewFailing'">Withdrawn (Failing)</xsl:if>
    <xsl:if test="$v_enum='WithdrewNoPenalty'">Withdrawn (No Penalty)</xsl:if>
    <xsl:if test="$v_enum='WithdrewPassing'">Withdrawn (Passing)</xsl:if>
  </xsl:template>

  <xsl:template name="Enums.CourseCreditBasis">
    <xsl:param name="v_enum"/>
    <xsl:if test="$v_enum='Regular'">Regular</xsl:if>
    <xsl:if test="$v_enum='AcademicRenewal'">Academic Renewal</xsl:if>
    <xsl:if test="$v_enum='AdvancedPlacement'">Advanced Placement</xsl:if>
    <xsl:if test="$v_enum='AdvancedStanding'">Advanced Standing</xsl:if>
    <xsl:if test="$v_enum='ContinuingEducation'">Continuing Education</xsl:if>
    <xsl:if test="$v_enum='Correspondence'">Correspondence</xsl:if>
    <xsl:if test="$v_enum='Exemption'">Exemption</xsl:if>
    <xsl:if test="$v_enum='Equivalence'">Equivalence</xsl:if>
    <xsl:if test="$v_enum='InternationalBaccalaureate'">International Baccalaureate</xsl:if>
    <xsl:if test="$v_enum='Military'">Military</xsl:if>
    <xsl:if test="$v_enum='Remedial'">Remedial</xsl:if>
    <xsl:if test="$v_enum='CreditByExam'">Credit By Exam</xsl:if>
    <xsl:if test="$v_enum='HighSchoolTransferCredit'">High School Transfer Credit</xsl:if>
    <xsl:if test="$v_enum='HighSchoolCreditOnly'">High School Credit Only</xsl:if>
    <xsl:if test="$v_enum='HighSchoolDualCredit'">High School Dual Credit</xsl:if>
    <xsl:if test="$v_enum='JuniorHighSchoolCredit'">Junior High School Credit</xsl:if>
    <xsl:if test="$v_enum='Major'">Major</xsl:if>
    <xsl:if test="$v_enum='AdultBasic'">Adult Basic</xsl:if>
  </xsl:template>

  <xsl:template name="Enums.Delinquencies">
    <xsl:param name="v_enum"/>
    <xsl:if test="$v_enum='ExclusionAcademic'">Exclusion (Academic)</xsl:if>
    <xsl:if test="$v_enum='ExclusionDiscipline'">Exclusion (Discipline)</xsl:if>
    <xsl:if test="$v_enum='GoodStanding'">Student was in good standing</xsl:if>
    <xsl:if test="$v_enum='ProbationGPA'">Student was on academic probation (because of low GPA)</xsl:if>
    <xsl:if test="$v_enum='ProbationHours'">Student was on academic probation (deficiency in credit hours)</xsl:if>
    <xsl:if test="$v_enum='SuspensionGPA'">Student was on academic suspension (because of low GPA)</xsl:if>
    <xsl:if test="$v_enum='SuspensionHours'">Student was on academic suspension (deficiency in credit hours)</xsl:if>
    <xsl:if test="$v_enum='ProbationDiscipline'">Student was on disciplinary probation</xsl:if>
    <xsl:if test="$v_enum='SuspensionDiscipline'">Student was on disciplinary suspension</xsl:if>
    <xsl:if test="$v_enum='Unknown'">Unknown</xsl:if>
    <xsl:if test="$v_enum='Other'">Other</xsl:if>
  </xsl:template>

  <xsl:template name="Enums.StudentLevelCode">
    <xsl:param name="v_enum"/>
    <xsl:if test="$v_enum='Postsecondary'">Postsecondary</xsl:if>
    <xsl:if test="$v_enum='PostsecondaryBachelorPreliminaryYear'">Postsecondary Bachelor/Preliminary Year</xsl:if>
    <xsl:if test="$v_enum='NonDegree'">Non-Degree or Transient Student</xsl:if>
    <xsl:if test="$v_enum='CollegeFirstYear'">First-year, never attended college before</xsl:if>
    <xsl:if test="$v_enum='CollegeFirstYearAttendedBefore'">First-year, attended college before</xsl:if>
    <xsl:if test="$v_enum='CollegeSophomore'">College Sophomore</xsl:if>
    <xsl:if test="$v_enum='CollegeJunior'">College Junior</xsl:if>
    <xsl:if test="$v_enum='CollegeSenior'">College Senior</xsl:if>
    <xsl:if test="$v_enum='CollegeFifthYear'">College Fifth Year</xsl:if>
    <xsl:if test="$v_enum='PostBaccalaureate'">Post-Baccalaureate</xsl:if>
    <xsl:if test="$v_enum='GraduateNonDegree'">Graduate (Non-Degree)</xsl:if>
    <xsl:if test="$v_enum='GraduateFirstYear'">Graduate First Year</xsl:if>
    <xsl:if test="$v_enum='GraduateSecondYear'">Graduate Second Year</xsl:if>
    <xsl:if test="$v_enum='GraduateThirdYear'">Graduate Third Year</xsl:if>
    <xsl:if test="$v_enum='GraduateBeyondThirdYear'">Graduate Beyond Third Year</xsl:if>
    <xsl:if test="$v_enum='Professional'">Professional</xsl:if>
    <xsl:if test="$v_enum='ProfessionalFirstYear'">Professional First Year</xsl:if>
    <xsl:if test="$v_enum='ProfessionalSecondYear'">Professional Second Year</xsl:if>
    <xsl:if test="$v_enum='ProfessionalThirdYear'">Professional Third Year</xsl:if>
    <xsl:if test="$v_enum='ProfessionalBeyondThirdYear'">Professional Beyond Third Year</xsl:if>
    <xsl:if test="$v_enum='MastersQualifying'">Masters (Qualifying)</xsl:if>
    <xsl:if test="$v_enum='Masters'">Masters</xsl:if>
    <xsl:if test="$v_enum='Doctoral'">Doctoral</xsl:if>
    <xsl:if test="$v_enum='Postdoctoral'">Post-Doctoral</xsl:if>
  </xsl:template>

</xsl:stylesheet>