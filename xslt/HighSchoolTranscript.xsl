<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:include href="TransmissionData.xsl" />
  <xsl:include href="Student.xsl" />
  <xsl:include href="Course.xsl" />
  <xsl:include href="AcademicSummary.xsl" />
  <xsl:include href="CredentialSummary.xsl" />
  <xsl:template match="/">
    <div id="divTranscriptInformationHeader" >
      <label for="TranscriptInformationLabel" >
        <h1>Transcript Information</h1>
      </label>
    </div>
    <div>
      <ul>
        <li>
          <label>Date Received:</label>
          <label>
            <xsl:text>&#160;</xsl:text>
            <xsl:call-template name="TransmissionData.CreatedDate" />
          </label>
        </li>
      </ul>
      <ul>
        <li>
          <label>Application Number:</label>
          <label>
            <xsl:text>&#160;</xsl:text>
            <xsl:call-template name="StudentInformation.AgencyID" />
          </label>
        </li>
      </ul>
    </div>
    <div id="divStudentInformationHeader" >
      <h2>Student Information</h2>
    </div>
    <ul>
      <li>
        <label>Surname:</label>
        <label>
          <xsl:call-template name="StudentInformation.getIndividualName">
            <xsl:with-param name="individualNameElement" select="'LastName'" />
          </xsl:call-template>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>First Name:</label>
        <label>
          <xsl:call-template name="StudentInformation.getIndividualName">
            <xsl:with-param name="individualNameElement" select="'FirstName'" />
          </xsl:call-template>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Middle Name:</label>
        <label>
          <xsl:call-template name="StudentInformation.getIndividualName">
            <xsl:with-param name="individualNameElement" select="'MiddleName'" />
          </xsl:call-template>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Former Surname:</label>
        <label>
          <xsl:call-template name="StudentInformation.getIndividualName">
            <xsl:with-param name="individualNameElement" select="'FormerLastName'" />
          </xsl:call-template>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Date of Birth:</label>
        <label>
          <xsl:call-template name="StudentInformation.DateOfBirth" />
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Gender:</label>
        <label>
          <xsl:call-template name="StudentInformation.StudentGender" >
            <xsl:with-param name="GenderMale" select="'Male'" />
            <xsl:with-param name="GenderFemale" select="'Female'" />
            <xsl:with-param name="GenderUnreported" select="'Unreported'" />
          </xsl:call-template>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Student Number</label>
        <label>
          <xsl:call-template name="StudentInformation.StudentID" />
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Ontario Education Number (OEN)</label>
        <label>
          <xsl:call-template name="StudentInformation.OEN" />
        </label>
      </li>
    </ul>
    <div id="divContactInformationHeader" >
      <h2>Contact Information</h2>
    </div>
    <ul>
      <li>
        <label>Board Name:</label>
        <label>
          <xsl:value-of select="//*[local-name()='Source']/*[local-name()='Organization']/*[local-name()='OrganizationName']"/>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Board ID:</label>
        <label>
          <xsl:call-template name="removeLeadingZeros">
            <xsl:with-param name="originalString" select="//*[local-name()='Source']/*[local-name()='Organization']/*[local-name()='ESIS']"/>
          </xsl:call-template>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Contact Name:</label>
        <label>
          <xsl:call-template name="ContactInformation.Name" />
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Contact Phone:</label>
        <label>
          <xsl:call-template name="ContactInformation.Telephone" />
        </label>
      </li>
    </ul>
    <div id="divNotesSpecialInstructionsHeader" >
      <h2>Special Instructions</h2>
    </div>
    <p>
      <xsl:value-of select="/*[local-name()='HighSchoolTranscript']/*[local-name()='NoteMessage']/text()" />
    </p>
    <div id="divSemesterSummaryHeader" >
      <label>
        <xsl:value-of select="'Academic Summary'"/>
      </label>
    </div>
    <ul>
      <li>
        <label>
          <xsl:value-of select="'School Name'"/>
        </label>
        <label>
          <xsl:value-of select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='School']/*[local-name()='OrganizationName']"/>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>
          <xsl:value-of select="'School ID'"/>
        </label>
        <label>
          <xsl:call-template name="removeLeadingZeros">
            <xsl:with-param name="originalString" select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='School']/*[local-name()='ESIS']"/>
          </xsl:call-template>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label >
          <xsl:value-of select="'OSSD Issue Date'"/>
        </label>
        <label>
          <xsl:value-of select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicSessionDetail']/*[local-name()='SessionEndDate']"/>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>
          <xsl:value-of select="'Graduate Diploma Program'"/>
        </label>
        <label>
          <xsl:value-of select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicAward']/*[local-name()='AcademicAwardTitle']"/>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>
          <xsl:value-of select="'Grade Status'"/>
        </label>
        <label>
          <xsl:value-of select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicAward']/*[local-name()='AcademicAwardLevel']"/>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label >
          <xsl:value-of select="'Total Credits'"/>
        </label>
        <label>
          <xsl:value-of select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicAward']/*[local-name()='AcademicAwardProgram']/*[local-name()='ProgramSummary']/*[local-name()='GPA']/*[local-name()='CreditHoursEarned']"/>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label >
          <xsl:value-of select="'Total Completed Credits'"/>
        </label>
        <label>
          <xsl:value-of select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicAward']/*[local-name()='AcademicAwardProgram']/*[local-name()='ProgramSummary']/*[local-name()='GPA']/*[local-name()='TotalQualityPoints']"/>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>
          <xsl:value-of select="'Literacy Test'"/>
        </label>
        <label>
          <xsl:value-of select="//*[local-name()='Student']/*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptExtensions']/*[local-name()='LiteracyTest']"/>
        </label>
      </li>
    </ul>
    <ul>
      <li>
        <label >
          <xsl:value-of select="'Community Involvement'"/>
        </label>
        <label>
          <xsl:value-of select="//*[local-name()='Student']/*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptExtensions']/*[local-name()='CommunityInvolvement']"/>
        </label>
      </li>
    </ul>
    <div>
      <ul>
        <xsl:for-each select="//Student/AcademicRecord">
          <li >
            <h2>
              <xsl:value-of select="'Entry Date'"/>
              <xsl:text>&#160;</xsl:text>
              <xsl:call-template name="Formatting.string_date_xml">
                <xsl:with-param name="date" select="AcademicSessionDetail/SessionBeginDate/text()"/>
              </xsl:call-template>
            </h2>
            <div>
              <xsl:attribute name="id">
                <xsl:value-of select="position()"/>
              </xsl:attribute>
              <table >
                <thead>
                  <tr>
                    <th scope="cols">
                      <xsl:value-of select="'Course Code'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'Compl Date'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'Course Title'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'Grade'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'Delivery'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'Type'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'% Grade'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'% Type'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'Lng Crs'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'Reqd'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'Notes'"/>
                    </th>
                    <th scope="cols">
                      <xsl:value-of select="'School BS ID'"/>
                    </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <xsl:for-each select="Course">
                    <tr>
                      <td>
                        <xsl:call-template name="Course.SubjectAbbreviation"/>
                        <xsl:text>&#160;</xsl:text>
                        <xsl:call-template name="Course.CourseNumber" />
                      </td>
                      <td>
                        <xsl:call-template name="Course.CourseDate" />
                      </td>
                      <td >
                        <xsl:call-template name="Course.CourseTitle" />
                      </td>
                      <td >
                        <xsl:call-template name="Course.HighSchoolGrade" />
                      </td>
                      <td >
                        <xsl:value-of select="CourseInstructionSiteName/text()" />
                      </td>
                      <td >
                        <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseType']/text()" />
                      </td>
                      <td >
                        <xsl:call-template name="Course.AcademicGrade" />
                      </td>
                      <td >
                        <xsl:value-of select="CourseAcademicGradeStatusCode/text()" />
                      </td>
                      <td >
                        <xsl:value-of select="LanguageOfInstruction/LanguageCode/text()" />
                      </td>
                      <td >
                        <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='Compulsory']/text()" />
                      </td>
                      <td >
                        <xsl:value-of select="./*[local-name()='UserDefinedExtensions']/*[local-name()='HighSchoolTranscriptCourseExtensions']/*[local-name()='CourseNote']/text()" />
                      </td>
                      <td >
                        <xsl:call-template name="removeLeadingZeros">
                          <xsl:with-param name="originalString" select="CourseOverrideSchool/ESIS/text()"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              <xsl:for-each select="AcademicSummary">
                <ul>
                  <li>
                    <label>
                      <xsl:value-of select="'Credits in GPA'"/>
                    </label>
                    <label>
                      <xsl:call-template name="AcademicSummary.AcademicCreditGPA" />
                    </label>
                  </li>
                </ul>
                <ul>
                  <li>
                    <label>
                      <xsl:value-of select="'GPA'"/>
                    </label>
                    <label>
                      <xsl:call-template name="AcademicSummary.AcademicGPA" />
                    </label>
                  </li>
                </ul>
                <ul>
                  <li>
                    <label>
                      <xsl:value-of select="'Range Minimum'"/>
                    </label>
                    <label>
                      <xsl:call-template name="AcademicSummary.RangeMinimum" />
                    </label>
                  </li>
                </ul>
                <ul>
                  <li>
                    <label>
                      <xsl:value-of select="'Range Maximum'"/>
                    </label>
                    <label>
                      <xsl:call-template name="AcademicSummary.RangeMaximum" />
                    </label>
                  </li>
                </ul>
              </xsl:for-each>
              <div>
                <xsl:if test="string-length(AcademicAward/AcademicAwardTitle/text()) != 0 or string-length(AcademicProgram/AcademicAwardProgram/AcademicProgramName/text()) != 0 or string-length(AcademicProgram/AcademicSummary/GPA/GradePointAverage/text()) != 0" >
                  <div id="divCredentialSummaryHeader" >
                    <h2>Credential Summary</h2>
                  </div>
                </xsl:if>
                <xsl:for-each select="AcademicAward">
                  <xsl:if test="string-length(AcademicAwardTitle/text()) != 0" >
                    <ul>
                      <li>
                        <label>Credential</label>
                        <label>
                          <xsl:call-template name="AcademicAward.AcademicDegreeDescription" />
                        </label>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <label>Level of Credential</label>
                        <label>
                          <xsl:call-template name="AcademicAward.AcademicDegreeCode" />
                        </label>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <label>Honours Level</label>
                        <label>
                          <xsl:call-template name="AcademicAward.HonoursLevel" />
                        </label>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <label>Date Awarded</label>
                        <label>
                          <xsl:call-template name="AcademicAward.DateDegreeAwarded" />
                        </label>
                      </li>
                    </ul>
                  </xsl:if>
                </xsl:for-each>
                <xsl:for-each select="AcademicProgram">
                  <xsl:if test="string-length(AcademicAwardProgram/AcademicProgramName/text()) != 0" >
                    <ul>
                      <li>
                        <label>Field of Study</label>
                        <label>
                          <xsl:call-template name="AcademicAwardProgram.Description1" />
                        </label>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <label>Study Level</label>
                        <label>
                          <xsl:call-template name="AcademicAwardProgram.StudyLevel" />
                        </label>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <label>Honours/Distinction</label>
                        <label>
                          <xsl:call-template name="AcademicAwardProgram.Description2" />
                        </label>
                      </li>
                    </ul>
                  </xsl:if>
                  <xsl:if test="string-length(AcademicSummary/GPA/GradePointAverage/text()) != 0" >
                    <ul>
                      <li>
                        <label>Credits in GPA</label>
                        <label>
                          <xsl:value-of select="format-number(AcademicSummary/GPA/CreditHoursForGPA/text(), '0.00', 'SummaryFormat')" />
                        </label>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <label>GPA</label>
                        <label>
                          <xsl:value-of select="format-number(AcademicSummary/GPA/GradePointAverage/text(), '0.00', 'SummaryFormat')" />
                        </label>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <label>Range Minimum</label>
                        <label>
                          <xsl:value-of select="format-number(AcademicSummary/GPA/GPARangeMinimum/text(), '0.00', 'SummaryFormat')" />
                        </label>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <label>Range Maximum</label>
                        <label>
                          <xsl:value-of select="format-number(AcademicSummary/GPA/GPARangeMaximum/text(), '0.00', 'SummaryFormat')" />
                        </label>
                      </li>
                    </ul>
                  </xsl:if>
                </xsl:for-each>
              </div>
            </div>
          </li>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>
</xsl:stylesheet>