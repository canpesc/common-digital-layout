<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:include href="./TransmissionData.xsl" />
	<xsl:include href="./Student.xsl" />
	<xsl:include href="./Course.xsl" />
	<xsl:include href="./AcademicSummary.xsl" />
	<xsl:include href="./AcademicAward.xsl" />
	<xsl:include href="./Formatting.xsl" />
	<xsl:include href="./Enums.xsl" />
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" href="../../../xslt/styles/simple.css"  type="text/css" media="all"/>
				<link rel="stylesheet" href="C:\git\canpesc\common-pdf-layout\xslt\styles\simple.css"  type="text/css" media="all"/>
			</head>
			<body>
				<div id="transcript-container">
					<div id="transmission-data" class="row">
						<div class="left-column">
							<div id="destination-institution">
								<h2>Recipient</h2>
								<p><span>ID: <xsl:call-template name="TransmissionData.DestinationInstitutionCode" /></span></p>
								<p><span>Institution: <xsl:call-template name="TransmissionData.DestinationInstitutionName" /></span></p>
								<p><span>Reference: <xsl:call-template name="TransmissionData.RequestTrackingID" /></span></p>
							</div>
						</div>
						<div class="centre-column  rounded-corners">
							<div id="source-institution">
								<img class="logo"/>
								<h1><xsl:call-template name="TransmissionData.SourceInstitutionName" /></h1>
								<h2>ID: <xsl:call-template name="TransmissionData.SourceInstitutionCode" /></h2>
								<xsl:if test="count(//TransmissionData/Source/Organization/Contacts) > 0">
									<p><span>Contact: <xsl:call-template name="ContactInformation.Name" /></span></p>
								</xsl:if>
								<xsl:if test="//TransmissionData/Destination/Organization/NoteMessage/text() != ''">
									<p><span>Legend: <xsl:call-template name="TransmissionData.Notes" /></span></p>
								</xsl:if>
							</div>
						</div>
						<div class="right-column">
							<div id="transcript-information">
								<h2>Transcript Issue Date</h2>
								<p><span><xsl:call-template name="TransmissionData.CreatedDate" /></span></p>
							</div>
						</div>
					</div>
					<div id="student-summary" class="row">
						<div id="student-information" class="left-column rounded-corners">
							<h2>Student Information</h2>
							<p><span>Surname: <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'LastName'" /></xsl:call-template></span></p>
							<p><span>First Name: <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'FirstName'" /></xsl:call-template></span></p>
							<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Name']/*[local-name()='MiddleName'] != ''">
								<p><span>Middle Name: <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'MiddleName'" /></xsl:call-template></span></p>
							</xsl:if>
							<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='AlternateName']/*[local-name()='LastName'] != ''">
								<p><span>Former Surname: <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'FormerLastName'" /></xsl:call-template></span></p>
							</xsl:if>
							<p><span>Date of Birth: <xsl:call-template name="StudentInformation.DateOfBirth" /></span></p>
							<p><span>Gender: <xsl:call-template name="StudentInformation.StudentGender"><xsl:with-param name="GenderMale" select="'Male'" /><xsl:with-param name="GenderFemale" select="'Female'" /><xsl:with-param name="GenderUnreported" select="'Unreported'" /></xsl:call-template></span></p>
							<p><span>Student Number: <xsl:call-template name="StudentInformation.StudentID" /></span></p>
							<p><span>Government Identifier: <xsl:call-template name="StudentInformation.GovernmentId" /></span></p>
						</div>
						<div id="academic-awards" class="centre-column rounded-corners">
							<h2>Academic Awards</h2>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicAward']">
								<xsl:if test="AcademicAwardDate/text() != ''">
									<div>
										<xsl:if test="AcademicAwardTitle/text() != ''">
											<h3>
												<xsl:call-template name="AcademicAward.AcademicDegreeDescription" />
											</h3>
										</xsl:if>
										<xsl:if test="AcademicAwardDate/text() != ''">
											<p><span>Award Date: <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardLevel/text() != ''">
											<p><span>Award Level: <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span></p>
										</xsl:if>
										<xsl:for-each select="AcademicAwardProgram">
											<p><xsl:if test="AcademicProgramName/text() != ''">
												<span>Program: <xsl:apply-templates select="AcademicProgramName"/></span>
											</xsl:if>
											<xsl:if test="AcademicProgramType/text() != ''">
												<span> (<xsl:apply-templates select="AcademicProgramType"/>)</span>
											</xsl:if>
											</p>
										</xsl:for-each>
										<xsl:if test="AcademicHonors/HonorsLevel/text() != ''">
											<p><span>Honours Level: <xsl:call-template name="AcademicAward.HonoursLevel" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardProgram/NoteMessage/text() != ''">
											<p><span>Note: <xsl:call-template name="AcademicAwardProgram.Note" /></span></p>
										</xsl:if>	
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicAward']">
								<xsl:if test="AcademicAwardDate/text() != ''">
									<div>
										<xsl:if test="AcademicAwardTitle/text() != ''">
											<h3>
												<xsl:call-template name="AcademicAward.AcademicDegreeDescription" />
											</h3>
										</xsl:if>
										<xsl:if test="AcademicAwardDate/text() != ''">
											<p><span>Award Date: <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardLevel/text() != ''">
											<p><span>Award Level: <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span></p>
										</xsl:if>
										<xsl:for-each select="AcademicAwardProgram">
											<p><xsl:if test="AcademicProgramName/text() != ''">
												<span>Program: <xsl:apply-templates select="AcademicProgramName"/></span>
											</xsl:if>
											<xsl:if test="AcademicProgramType/text() != ''">
												<span> (<xsl:apply-templates select="AcademicProgramType"/>)</span>
											</xsl:if>
											</p>
										</xsl:for-each>
										<xsl:if test="AcademicHonors/HonorsLevel/text() != ''">
											<p><span>Honours Level: <xsl:call-template name="AcademicAward.HonoursLevel" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardProgram/NoteMessage/text() != ''">
											<p><span>Note: <xsl:call-template name="AcademicAwardProgram.Note" /></span></p>
										</xsl:if>	
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div id="academic-summary" class="right-column rounded-corners">
							<h2>Academic Summary</h2>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSummary']">
								<div id="academic-summary-detail">
									<h4>
										<xsl:if test="AcademicSummaryLevel/text() != ''">
											<span><xsl:value-of select="AcademicSummaryLevel/text()"/></span>
										</xsl:if>
										<xsl:if test="AcademicSummaryType/text() != ''">
											<span>&#160;(<xsl:value-of select="AcademicSummaryType/text()"/>)</span>
										</xsl:if>
									</h4>
									<xsl:for-each select="NoteMessage">
										<p><span>Note: <xsl:value-of select="text()"/></span></p>
									</xsl:for-each>
									<xsl:for-each select="GPA">
										<xsl:if test="NoteMessage/text() != ''">
											<p><span>Note: <xsl:value-of select="NoteMessage/text()"/></span></p>
										</xsl:if>
										<xsl:if test="GradePointAverage/text() != ''">
											<p><span>Grade Point Average: <xsl:value-of select="GradePointAverage/text()"/></span>
												<xsl:if test="CreditUnit/text() != ''">
												<span>&#160;&#160;Credit Unit: <xsl:value-of select="CreditUnit/text()"/></span>
											</xsl:if>
											</p>
										</xsl:if>
											<xsl:if test="CreditHoursEarned/text() != ''">
											<p><span>Credit Hours Earned: <xsl:value-of select="CreditHoursEarned/text()"/></span></p>
										</xsl:if>
											
									</xsl:for-each>
								</div>
							</xsl:for-each>
						</div>
					</div>
					<xsl:if test="count(//Student/AcademicRecord/Course) > 0">
						<div class="session rounded-corners">
							<div id="transfer-credits" class="row">
								<div id="session-grades" class="all-columns">
									<div id="grades">
										<h2>Transfer Credits</h2>
										<table class="grades-table">
											<thead>
												<th scope="cols" width="10%">Course Number</th>
												<th scope="cols" width="50%">Course Title</th>
												<th scope="cols" width="10%">Credit Value</th>
												<th scope="cols" width="10%">Credit Earned</th>
												<th scope="cols" width="10%">Grade</th>
												<th scope="cols" width="10%">Course Quality Points Earned</th>
											</thead>
											<xsl:for-each select="//Student/AcademicRecord/Course">
												<tr>
													<td>
														<xsl:call-template name="Course.SubjectAbbreviation"/>
														<xsl:text>&#160;</xsl:text>
														<xsl:call-template name="Course.CourseNumber" />
													</td>
													<td>
														<xsl:call-template name="Course.CourseTitle" />
													</td>
													<td>
														<xsl:call-template name="Course.CreditValue" />
													</td>
													<td>
														<xsl:call-template name="Course.CreditsEarned" />
													</td>
													<td>
														<xsl:call-template name="Course.AcademicGrade" />
													</td>
													<td>
														<xsl:call-template name="Course.CourseQualityPointsEarned" />
													</td>
												</tr>
												<tr>
													<td></td>
													<td>
														<p><span>Notes:</span></p>
														<xsl:for-each select="NoteMessage">
															<p><span><xsl:value-of select="text()"/></span></p>
														</xsl:for-each>
													</td>
													<td colspan="2">
														<xsl:if test="CourseCreditBasis/text() != ''">
															<p><span>Credit Basis: <xsl:call-template name="Course.BasisAcademicDescription" /></span></p>
														</xsl:if>	
														<xsl:if test="CourseCreditLevel/text() != ''">
															<p><span>Credit Level: <xsl:call-template name="Course.CourseCreditLevel" /></span></p>
														</xsl:if>
														<xsl:if test="CourseCreditUnits/text() != ''">
															<p><span>Credit Units: <xsl:call-template name="Course.CourseCreditUnits" /></span></p>
														</xsl:if>
													</td>
													<td colspan="2">
														<xsl:if test="CourseAcademicGradeStatusCode/text() != ''">
															<p><span>Grade Status: <xsl:call-template name="Course.GradeStatus" /></span></p>
														</xsl:if>
														<xsl:if test="CourseAcademicGradeScaleCode/text() != ''">
															<p><span>Grade Scale Code: <xsl:call-template name="Course.AcademicCreditQualifier" /></span></p>
														</xsl:if>
														<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text() != ''">
															<p><span>Supplemental Grade: <xsl:call-template name="MKS.AcademicGrade" /></span></p>
														</xsl:if>
														<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text() != ''">
															<p><span>Supplemental Grade Code: <xsl:call-template name="MKS.MarkCodeType" /></span></p>
														</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</div>
								</div>
							</div>
						</div>
					</xsl:if>							
					<xsl:for-each select="//Student/AcademicRecord/AcademicSession">
						<div class="pagebreak" />
						<div id="session" class="session rounded-corners">
							<xsl:attribute name="id">
								<xsl:value-of select="concat('session-',position())"/>
							</xsl:attribute>
							<div id="session-summary" class="row">
								<div class="left-column">
									<h3>Session: <xsl:value-of select="AcademicSessionDetail/SessionName/text()"/></h3>
									<p><span>Start Date: <xsl:call-template name="Formatting.string_date_xml"><xsl:with-param name="date" select="AcademicSessionDetail/SessionBeginDate/text()"/></xsl:call-template></span></p>
									<p><span>End Date: <xsl:call-template name="Formatting.string_date_xml"><xsl:with-param name="date" select="AcademicSessionDetail/SessionEndDate/text()"/></xsl:call-template></span></p>
									<p><span>Designator: <xsl:value-of select="AcademicSessionDetail/SessionDesignator/text()"/> </span>
										<xsl:if test="string-length(AcademicSessionDetail/SessionDesignatorSuffix/text()) != 0">
												(<span><xsl:value-of select="AcademicSessionDetail/SessionDesignatorSuffix/text()"/>)</span>
											</xsl:if>
										</p>
								</div>
								<div class="centre-column">
									<xsl:if test="count(AcademicProgram) > 0">
										<h4>Academic Program</h4>
										<xsl:for-each select="AcademicProgram">	
											<xsl:if test="string-length(AcademicProgramName/text()) != 0">
												<p><span>Field of Study: <xsl:value-of select="AcademicProgramName/text()"/></span></p>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="StudentLevel">	
											<xsl:if test="string-length(StudentLevelCode/text()) != 0">
												<p><span>Level of Studies: 
													<xsl:call-template name="Enums.StudentLevelCode">
														<xsl:with-param name="v_enum" select="StudentLevelCode/text()" />
													</xsl:call-template>
												</span></p>
												<xsl:for-each select="NoteMessage">
													<p><span>Note: <xsl:value-of select="text()"/></span></p>
												</xsl:for-each>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count(AcademicAward) > 0">
										<h4>Academic Award</h4>
										<xsl:for-each select="AcademicAward">
											<p>
												<span>Credential: <xsl:call-template name="AcademicAward.AcademicDegreeDescription" />
												</span>
											</p>
											<p>
												<span>Level of Credential: <xsl:call-template name="AcademicAward.AcademicDegreeCode" />
												</span>
											</p>
											<p>
												<span>Honours Level: <xsl:call-template name="AcademicAward.HonoursLevel" />
												</span>
											</p>
											<p>
												<span>Date Awarded: <xsl:call-template name="AcademicAward.DateDegreeAwarded" />
												</span>
											</p>
										</xsl:for-each>
									</xsl:if>	
								</div>
								<div class="right-column">
									<xsl:for-each select="AcademicSummary">
										<div id="academic-summary-detail">
											<h4>
												<xsl:if test="AcademicSummaryLevel/text() != ''">
													<span><xsl:value-of select="AcademicSummaryLevel/text()"/></span>
												</xsl:if>
												<xsl:if test="AcademicSummaryType/text() != ''">
													<span>&#160;(<xsl:value-of select="AcademicSummaryType/text()"/>)</span>
												</xsl:if>
											</h4>
											<xsl:for-each select="NoteMessage">
												<p><span>Note: <xsl:value-of select="text()"/></span></p>
											</xsl:for-each>
											<xsl:if test="Delinquencies/text() != ''">
													<span>Standing: <xsl:call-template name="Enums.Delinquencies">
														<xsl:with-param name="v_enum" select="Delinquencies/text()" />
													</xsl:call-template>
													</span>
												</xsl:if>
											<xsl:for-each select="GPA">
												<xsl:if test="NoteMessage/text() != ''">
													<p><span>Note: <xsl:value-of select="NoteMessage/text()"/></span></p>
												</xsl:if>
												<xsl:if test="GradePointAverage/text() != ''">
													<p><span>Grade Point Average: <xsl:value-of select="GradePointAverage/text()"/></span>
														<xsl:if test="CreditUnit/text() != ''">
															<span>&#160;&#160;Credit Unit: <xsl:value-of select="CreditUnit/text()"/></span>
														</xsl:if>
													</p>
												</xsl:if>
													<xsl:if test="CreditHoursEarned/text() != ''">
													<p><span>Credit Hours Earned: <xsl:value-of select="CreditHoursEarned/text()"/></span></p>
												</xsl:if>
													
												<xsl:if test="CreditHoursForGPA/text() != ''">
													<p><span>Credits in GPA: <xsl:value-of select="CreditHoursForGPA/text()"/></span></p>
												</xsl:if>
												<xsl:if test="GPARangeMinimum/text() != ''">
													<p><span>Range Minimum: <xsl:value-of select="GPARangeMinimum/text()"/></span></p>
												</xsl:if>
													<xsl:if test="GPARangeMaximum/text() != ''">
													<p><span>Range Maximum: <xsl:value-of select="GPARangeMaximum/text()"/></span></p>
												</xsl:if>
											</xsl:for-each>
										</div>
									</xsl:for-each>
								</div>
							</div>
							<div id="session-details" class="row">
								<div id="session-grades" class="all-columns">
									<div id="grades">
										<h2>Course Information</h2>
										<table class="grades-table">
											<thead>
												<th scope="cols" width="10%">Course Number</th>
												<th scope="cols" width="50%">Course Title</th>
												<th scope="cols" width="10%">Credit Value</th>
												<th scope="cols" width="10%">Credit Earned</th>
												<th scope="cols" width="10%">Grade</th>
												<th scope="cols" width="10%">Course Quality Points Earned</th>
											</thead>
											<xsl:for-each select="Course">
												<tr>
													<td>
														<xsl:call-template name="Course.SubjectAbbreviation"/>
														<xsl:text>&#160;</xsl:text>
														<xsl:call-template name="Course.CourseNumber" />
													</td>
													<td>
														<xsl:call-template name="Course.CourseTitle" />
													</td>
													<td>
														<xsl:call-template name="Course.CreditValue" />
													</td>
													<td>
														<xsl:call-template name="Course.CreditsEarned" />
													</td>
													<td>
														<xsl:call-template name="Course.AcademicGrade" />
													</td>
													<td>
														<xsl:call-template name="Course.CourseQualityPointsEarned" />
													</td>
												</tr>
												<tr>
													<td></td>
													<td>
														<p><span>Notes:</span></p>
														<xsl:for-each select="NoteMessage">
															<p><span><xsl:value-of select="text()"/></span></p>
														</xsl:for-each>
													</td>
													<td colspan="2">
														<xsl:if test="CourseCreditBasis/text() != ''">
															<p><span>Credit Basis: <xsl:call-template name="Course.BasisAcademicDescription" /></span></p>
														</xsl:if>	
														<xsl:if test="CourseCreditLevel/text() != ''">
															<p><span>Credit Level: <xsl:call-template name="Course.CourseCreditLevel" /></span></p>
														</xsl:if>
														<xsl:if test="CourseCreditUnits/text() != ''">
															<p><span>Credit Units: <xsl:call-template name="Course.CourseCreditUnits" /></span></p>
														</xsl:if>
													</td>
													<td colspan="2">
														<xsl:if test="CourseAcademicGradeStatusCode/text() != ''">
															<p><span>Grade Status: <xsl:call-template name="Course.GradeStatus" /></span></p>
														</xsl:if>
														<xsl:if test="CourseAcademicGradeScaleCode/text() != ''">
															<p><span>Grade Scale Code: <xsl:call-template name="Course.AcademicCreditQualifier" /></span></p>
														</xsl:if>
														<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text() != ''">
															<p><span>Supplemental Grade: <xsl:call-template name="MKS.AcademicGrade" /></span></p>
														</xsl:if>
														<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text() != ''">
															<p><span>Supplemental Grade Code: <xsl:call-template name="MKS.MarkCodeType" /></span></p>
														</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</div>
								</div>
							</div>
						</div>
					</xsl:for-each>	
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>