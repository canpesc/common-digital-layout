<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:include href="TransmissionData.xsl" />
  <xsl:include href="Student.xsl" />
  <xsl:include href="Course.xsl" />
  <xsl:include href="AcademicSummary.xsl" />
  <xsl:include href="CredentialSummary.xsl" />
  <xsl:include href="Formatting.xsl" />
  <xsl:include href="Enums.xsl" />
  <xsl:template match="/">
    <html>
      <head>
        <style>
            table {
              border-collapse: collapse;
            }
            table, th, td {
              border: 1px solid black;
            }
            th, td {
              padding: 2px;
              text-align: left;
            }
            div div {
              padding: 2px; 
              border: 1px solid black;
              border-collapse: collapse;
            }
            table.transcript-container {
                page-break-after:always;
            }
            thead.transcript-header {
                display:table-header-group;
            }
            tfoot.transcript-footer {
                display:table-footer-group;
            } 
        </style>
      </head>
      <body>
        <table class="transcript-container">
          <thead class="transcript-header">
            <tr>
              <th class="transcript-header-cell">
                <div class="header-info">
                  <h1>College Transcript</h1>
                </div>
              </th>
            </tr>
          </thead>
          <tfoot class="transcript-footer">
            <tr>
              <td class="transcript-footer-cell">
                <div class="footer-info">This is not an official transcript</div>
              </td>
            </tr>
          </tfoot>
          <tbody class="transcript-content">
            <tr>
              <td class="transcript-content-cell">
                <div class="main">
                  <div id="transcript-information" >
                    <h2>Transcript Information</h2>
                    <table>
                      <tr>
                        <th></th>
                        <th></th>
                      </tr>
                      <tr>
                        <td>Source Institution</td>
                        <td>
                          <xsl:call-template name="TransmissionData.SourceInstitutionName" />
                        </td>
                      </tr>
                      <tr>
                        <td>Date Received</td>
                        <td>
                          <xsl:call-template name="TransmissionData.CreatedDate" />
                        </td>
                      </tr>
                      <tr>
                        <td>Application Number</td>
                        <td>
                          <xsl:call-template name="StudentInformation.AgencyID" />
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div id="contact-information" >
                    <h2>Contact Information</h2>
                    <table>
                      <tr>
                        <th></th>
                        <th></th>
                      </tr>
                      <tr>
                        <td>Contact Name</td>
                        <td>
                          <xsl:call-template name="ContactInformation.Name" />
                        </td>
                      </tr>
                      <tr>
                        <td>Contact Phone</td>
                        <td>
                          <xsl:call-template name="ContactInformation.Telephone" />
                        </td>
                      </tr>
                      <tr>
                        <td>Application Number</td>
                        <td>
                          <xsl:call-template name="StudentInformation.AgencyID" />
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div id="special-instructions" >
                    <h2>Special Instructions</h2>
                    <p>
                      <xsl:value-of select="/*[local-name()='CollegeTranscript']/*[local-name()='NoteMessage']/text()" />
                    </p>
                  </div>
                  <div id="student-information" >
                    <h2>Student Information</h2>

                    <ul >
                      <li>
                        <label>Surname:</label>
                        <label>
                          <xsl:call-template name="StudentInformation.getIndividualName">
                            <xsl:with-param name="individualNameElement" select="'LastName'" />
                          </xsl:call-template>
                        </label>
                      </li>
                    </ul>
                    <ul >
                      <li>
                        <label>First Name:</label>
                        <label>
                          <xsl:call-template name="StudentInformation.getIndividualName">
                            <xsl:with-param name="individualNameElement" select="'FirstName'" />
                          </xsl:call-template>
                        </label>
                      </li>
                    </ul>
                    <ul >
                      <li>
                        <label>Middle Name:</label>
                        <label>
                          <xsl:call-template name="StudentInformation.getIndividualName">
                            <xsl:with-param name="individualNameElement" select="'MiddleName'" />
                          </xsl:call-template>
                        </label>
                      </li>
                    </ul>
                    <ul >
                      <li>
                        <label>Former Surname:</label>
                        <label>
                          <xsl:call-template name="StudentInformation.getIndividualName">
                            <xsl:with-param name="individualNameElement" select="'FormerLastName'" />
                          </xsl:call-template>
                        </label>
                      </li>
                    </ul>
                    <ul >
                      <li>
                        <label>Date of Birth:</label>
                        <label>
                          <xsl:call-template name="StudentInformation.DateOfBirth" />
                        </label>
                      </li>
                    </ul>
                    <ul >
                      <li>
                        <label>Gender:</label>
                        <label>
                          <xsl:call-template name="StudentInformation.StudentGender">
                            <xsl:with-param name="GenderMale" select="'Male'" />
                            <xsl:with-param name="GenderFemale" select="'Female'" />
                            <xsl:with-param name="GenderUnreported" select="'Unreported'" />
                          </xsl:call-template>
                        </label>
                      </li>
                    </ul>
                    <ul >
                      <li>
                        <label>Student Number:</label>
                        <label>
                          <xsl:call-template name="StudentInformation.StudentID" />
                        </label>
                      </li>
                    </ul>
                    <ul >
                      <li>
                        <label>Ontario Education Number (OEN):</label>
                        <label>
                          <xsl:call-template name="StudentInformation.OEN" />
                        </label>
                      </li>
                    </ul>
                  </div>
                  <div>
                    <h2>Academic Awards</h2>
                    <xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicAward']">
                      <xsl:if test="AcademicAwardDate/text() != ''">
                        <div>
                          <xsl:if test="AcademicAwardTitle/text() != ''">
                            <xsl:if test="position()=1">
                              <h2>Credential Summary</h2>
                            </xsl:if>
                            <ul >
                              <li>
                                <label >Academic Award Title</label>
                                <label >
                                  <xsl:apply-templates select="AcademicAwardTitle"/>
                                </label>
                              </li>
                            </ul>
                          </xsl:if>
                          <ul >
                            <li>
                              <label >Award Date:</label>
                              <label >
                                <xsl:apply-templates select="AcademicAwardDate"/>
                              </label>
                            </li>
                          </ul>
                          <xsl:if test="AcademicAwardProgram/AcademicProgramName/text() != ''">
                            <ul >
                              <li>
                                <label >Program Name:</label>
                                <label >
                                  <xsl:apply-templates select="AcademicAwardProgram/AcademicProgramName"/>
                                </label>
                              </li>
                            </ul>
                          </xsl:if>
                        </div>
                      </xsl:if>
                    </xsl:for-each>
                    <!--AcademicAward within an Academic Record.-->
                    <xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicAward']">
                      <xsl:if test="AcademicAwardDate/text() != ''">
                        <div>
                          <xsl:if test="AcademicAwardTitle/text() != ''">
                            <xsl:if test="position()=1">
                              <h2>Academic Awards</h2>
                            </xsl:if>
                            <ul >
                              <li>
                                <label >Award Title:</label>
                                <label >
                                  <xsl:apply-templates select="AcademicAwardTitle"/>
                                </label>
                              </li>
                            </ul>
                          </xsl:if>
                          <ul >
                            <li>
                              <label >Award Date:</label>
                              <label >
                                <xsl:apply-templates select="AcademicAwardDate"/>
                              </label>
                            </li>
                          </ul>
                          <xsl:if test="AcademicAwardProgram/AcademicProgramName/text() != ''">
                            <ul >
                              <li>
                                <label >Program Name:</label>
                                <label >
                                  <xsl:apply-templates select="AcademicAwardProgram/AcademicProgramName"/>
                                </label>
                              </li>
                            </ul>
                          </xsl:if>
                        </div>
                      </xsl:if>
                    </xsl:for-each>
                  </div>
                  <div id="session-summary" >
                    <h2>Session Summary</h2>
                    <xsl:for-each select="//Student/AcademicRecord/AcademicSession">
                      <h3>Semester:<xsl:text>&#160;</xsl:text>
							              <xsl:value-of select="AcademicSessionDetail/SessionName/text()"/>
							              <xsl:text>&#160;&#160;&#160;</xsl:text>Start Date:<xsl:text>&#160;</xsl:text>
							              <xsl:call-template name="Formatting.string_date_xml">
								              <xsl:with-param name="date" select="AcademicSessionDetail/SessionBeginDate/text()"/>
							              </xsl:call-template>
						              </h3>
                      <div>
                        <xsl:attribute name="id">
                          <xsl:value-of select="position()"/>
                        </xsl:attribute>
                        <table>
                          <tr>
                            <th scope="cols">Course Number</th>
                            <th scope="cols">Course Title</th>
                            <th scope="cols">Basis for Credit</th>
                            <th scope="cols">Credit Value</th>
                            <th scope="cols">Credit Earned</th>
                            <th scope="cols">Grade/Mark</th>
                            <th scope="cols">Grade Qualifier</th>
                            <th scope="cols">Grade Point</th>
                            <th scope="cols">Grade Point Qualifier</th>
                          </tr>
                          <xsl:for-each select="Course">
                            <tr>
                              <td>
                                <xsl:call-template name="Course.SubjectAbbreviation"/>
                                <xsl:text>&#160;</xsl:text>
                                <xsl:call-template name="Course.CourseNumber" />
                              </td>
                              <td >
                                <xsl:call-template name="Course.CourseTitle" />
                              </td>
                              <td>
                                <xsl:call-template name="Course.BasisAcademicDescription">
                                  <xsl:with-param name="BasisAcademicRegular" select="'Regular'" />
                                  <xsl:with-param name="BasisAcademicCreditByExam" select="'Credit By Exam'" />
                                  <xsl:with-param name="BasisAcademicHighSchoolTransferCredit" select="'High School Transfer Credit'" />
                                </xsl:call-template>
                              </td>
                              <td >
                                <xsl:call-template name="Course.CreditValue" />
                              </td>
                              <td >
                                <xsl:call-template name="Course.CreditsEarned" />
                              </td>
                              <td  >
                                <xsl:call-template name="MKS.AcademicGrade" />
                              </td>
                              <td  >
                                <xsl:call-template name="MKS.MarkCodeType" />
                              </td>
                              <td  >
                                <xsl:call-template name="Course.AcademicGrade" />
                              </td>
                              <td  >
                                <xsl:call-template name="Course.AcademicCreditQualifier" />
                              </td>
                            </tr>
                          </xsl:for-each>
                        </table>
                        <xsl:for-each select="AcademicSummary">
                          <ul >
                            <li>
                              <label>Credits in GPA</label>
                              <label>
                                <xsl:call-template name="AcademicSummary.AcademicCreditGPA" />
                              </label>
                            </li>
                          </ul>
                          <ul >
                            <li>
                              <label>GPA</label>
                              <label>
                                <xsl:call-template name="AcademicSummary.AcademicGPA" />
                              </label>
                            </li>
                          </ul>
                          <ul >
                            <li>
                              <label>Range Minimum</label>
                              <label>
                                <xsl:call-template name="AcademicSummary.RangeMinimum" />
                              </label>
                            </li>
                          </ul>
                          <ul >
                            <li>
                              <label>Range Maximum</label>
                              <label>
                                <xsl:call-template name="AcademicSummary.RangeMaximum" />
                              </label>
                            </li>
                          </ul>
                        </xsl:for-each>

                        <xsl:if test="string-length(AcademicAward/AcademicAwardTitle/text()) != 0 or string-length(AcademicProgram/AcademicAwardProgram/AcademicProgramName/text()) != 0 or string-length(AcademicProgram/AcademicSummary/GPA/GradePointAverage/text()) != 0" >
                          <div id="credential-summary" >
                            <h2>Credential Summary</h2>
                          </div>
                        </xsl:if>
                        <xsl:for-each select="AcademicProgram">
                          <xsl:if test="string-length(AcademicAwardProgram/AcademicProgramName/text()) != 0" >
                            <ul >
                              <li>
                                <label>Field of Study</label>
                                <label>
                                  <xsl:call-template name="AcademicAwardProgram.Description1" />
                                </label>
                              </li>
                            </ul>
                            <ul >
                              <li>
                                <label>Study Level</label>
                                <label>
                                  <xsl:call-template name="AcademicAwardProgram.StudyLevel" />
                                </label>
                              </li>
                            </ul>
                            <ul >
                              <li>
                                <label>Honours/Distinction</label>
                                <label>
                                  <xsl:call-template name="AcademicAwardProgram.Description2" />
                                </label>
                              </li>
                            </ul>
                          </xsl:if>
                          <xsl:if test="string-length(AcademicSummary/GPA/GradePointAverage/text()) != 0" >
                            <ul >
                              <li>
                                <label>Credits in GPA</label>
                                <label>
                                  <xsl:value-of select="format-number(AcademicSummary/GPA/CreditHoursForGPA/text(), '0.00', 'SummaryFormat')" />
                                </label>
                              </li>
                            </ul>
                            <ul >
                              <li>
                                <label>GPA</label>
                                <label>
                                  <xsl:value-of select="format-number(AcademicSummary/GPA/GradePointAverage/text(), '0.00', 'SummaryFormat')" />
                                </label>
                              </li>
                            </ul>
                            <ul >
                              <li>
                                <label>Range Minimum</label>
                                <label>
                                  <xsl:value-of select="format-number(AcademicSummary/GPA/GPARangeMinimum/text(), '0.00', 'SummaryFormat')" />
                                </label>
                              </li>
                            </ul>
                            <ul >
                              <li>
                                <label>Range Maximum</label>
                                <label>
                                  <xsl:value-of select="format-number(AcademicSummary/GPA/GPARangeMaximum/text(), '0.00', 'SummaryFormat')" />
                                </label>
                              </li>
                            </ul>
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="AcademicAward">
                          <xsl:if test="string-length(AcademicAwardTitle/text()) != 0" >
                            <ul >
                              <li>
                                <label>Credential</label>
                                <label>
                                  <xsl:call-template name="AcademicAward.AcademicDegreeDescription" />
                                </label>
                              </li>
                            </ul>
                            <ul >
                              <li>
                                <label>Level of Credential</label>
                                <label>
                                  <xsl:call-template name="AcademicAward.AcademicDegreeCode" />
                                </label>
                              </li>
                            </ul>
                            <ul >
                              <li>
                                <label>Honours Level</label>
                                <label>
                                  <xsl:call-template name="AcademicAward.HonoursLevel" />
                                </label>
                              </li>
                            </ul>
                            <ul >
                              <li>
                                <label>Date Awarded</label>
                                <label>
                                  <xsl:call-template name="AcademicAward.DateDegreeAwarded" />
                                </label>
                              </li>
                            </ul>
                          </xsl:if>
                        </xsl:for-each>

                      </div>
                    </xsl:for-each>
                  </div>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>