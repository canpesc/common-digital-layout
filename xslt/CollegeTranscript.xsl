<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:include href="./TransmissionData.xsl" />
	<xsl:include href="./Student.xsl" />
	<xsl:include href="./Course.xsl" />
	<xsl:include href="./AcademicSummary.xsl" />
	<xsl:include href="./AcademicAward.xsl" />

	<!-- Change these references to appropriate locale -->
	<xsl:include href="./Formatting.en-CA.xsl" />
	<xsl:include href="./Enums.en-CA.xsl" />
	<xsl:variable name="Labels" select="document('Labels.CollegeTranscript.en-CA.xml')/Labels"/>

	<xsl:template match="/">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="en">
			<head>
				<title><xsl:call-template name="TransmissionData.SourceInstitutionName" /></title>
				<link rel="stylesheet" href="../../../xslt/styles/simple.css"  type="text/css" media="all"/>
				<link rel="stylesheet" href="file:///C:/git/canpesc/common-pdf-layout/xslt/styles/simple.css"  type="text/css" media="all"/>
			</head>
			<body>
				<div id="transcript-container">
					<div id="transmission-data" class="row">
						<div class="left-column">
							<div id="destination-institution">
								<h2><xsl:value-of select="$Labels/Label[@key='Destination.Heading']"/></h2>
								<p><span><xsl:value-of select="$Labels/Label[@key='Destination.InstitutionName']"/> <xsl:call-template name="TransmissionData.DestinationInstitutionName" /></span></p>
								<xsl:choose>
									<xsl:when test="//TransmissionData/Destination/Organization/CSIS/text() != ''">
										<p><span><xsl:value-of select="$Labels/Label[@key='Destination.CSIS']"/> <xsl:value-of select="//TransmissionData/Destination/Organization/CSIS/text()"/></span></p>
									</xsl:when>
									<xsl:when test="//TransmissionData/Destination/Organization/USIS/text() != ''">
										<p><span><xsl:value-of select="$Labels/Label[@key='Destination.USIS']"/> <xsl:value-of select="//TransmissionData/Destination/Organization/USIS/text()"/></span></p>
									</xsl:when>
									<xsl:when test="//TransmissionData/Destination/Organization/PSIS/text() != ''">
										<p><span><xsl:value-of select="$Labels/Label[@key='Destination.PSIS']"/> <xsl:value-of select="//TransmissionData/Destination/Organization/PSIS/text()"/></span></p>
									</xsl:when>
									<xsl:otherwise><p><span><xsl:value-of select="$Labels/Label[@key='Destination.MutuallyDefined']"/> <xsl:call-template name="TransmissionData.DestinationInstitutionCode" /></span></p></xsl:otherwise>
								</xsl:choose>
								<xsl:if test="string-length(//TransmissionData/RequestTrackingID/text()) != 0" >
									<p><span><xsl:value-of select="$Labels/Label[@key='RequestTrackingID']"/> <xsl:call-template name="TransmissionData.RequestTrackingID" /></span></p>
								</xsl:if>
							</div>
						</div>
						<div class="centre-column  rounded-corners">
							<div id="source-institution">
								<!-- <img class="logo" src="" alt="" /> -->
								<h1><xsl:call-template name="TransmissionData.SourceInstitutionName" /></h1>
								<h2><xsl:choose>
									<xsl:when test="//TransmissionData/Source/Organization/CSIS/text() != ''">
										<span><xsl:value-of select="$Labels/Label[@key='Source.CSIS']"/> <xsl:value-of select="//TransmissionData/Source/Organization/CSIS/text()"/></span>
									</xsl:when>
									<xsl:when test="//TransmissionData/Source/Organization/USIS/text() != ''">
										<span><xsl:value-of select="$Labels/Label[@key='Source.USIS']"/> <xsl:value-of select="//TransmissionData/Source/Organization/USIS/text()"/></span>
									</xsl:when>
									<xsl:when test="//TransmissionData/Source/Organization/PSIS/text() != ''">
										<span><xsl:value-of select="$Labels/Label[@key='Source.PSIS']"/> <xsl:value-of select="//TransmissionData/Source/Organization/PSIS/text()"/></span>
									</xsl:when>
									<xsl:otherwise><span><xsl:value-of select="$Labels/Label[@key='Source.MutuallyDefined']"/> <xsl:call-template name="TransmissionData.SourceInstitutionCode" /></span></xsl:otherwise>
								</xsl:choose></h2>
								<p>&#160;</p>
								<xsl:if test="count(//TransmissionData/Source/Organization/Contacts) > 0">
									<p><span><xsl:value-of select="$Labels/Label[@key='Source.Contact.Title']"/> <xsl:call-template name="ContactInformation.Name" /></span></p>
										<xsl:if test="string-length(//TransmissionData/Source/Organization/Contacts/Address/AddressLine/text()) != 0" >
											<p><span><xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Address/AddressLine/text()" /></span></p>
										</xsl:if>
										<xsl:if test="string-length(//TransmissionData/Source/Organization/Contacts/Address/City/text()) != 0" >
											<p><span><xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Address/City/text()" /></span>
											<span>, <xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Address/StateProvinceCode/text()" /></span>
											</p>
										</xsl:if>
										<xsl:if test="string-length(//TransmissionData/Source/Organization/Contacts/Address/PostalCode/text()) != 0" >
											<p>
											<span><xsl:value-of select="//TransmissionData/Source/Organization/Contacts/Address/PostalCode/text()" /></span>
											</p>
										</xsl:if>
								</xsl:if>
								<xsl:for-each select="//TransmissionData/NoteMessage">
									<p><span><xsl:value-of select="text()"/></span></p>
								</xsl:for-each>
							</div>
						</div>
						<div class="right-column">
							<div id="transcript-information">
								<h2><xsl:value-of select="$Labels/Label[@key='TranscriptIssueDate']"/></h2>
								<p><span><xsl:call-template name="TransmissionData.CreatedDate" /></span></p>
							</div>
						</div>
					</div>
					<div id="student-summary" class="row  rounded-corners">
						<div id="student-information" class="left-column">
							<h2><xsl:value-of select="$Labels/Label[@key='Student.Title']"/></h2>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.LastName']"/> <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'LastName'" /></xsl:call-template></span></p>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.FirstName']"/> <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'FirstName'" /></xsl:call-template></span></p>
							<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='Name']/*[local-name()='MiddleName'] != ''">
								<p><span><xsl:value-of select="$Labels/Label[@key='Student.MiddleName']"/> <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'MiddleName'" /></xsl:call-template></span></p>
							</xsl:if>
							<xsl:if test="//*[local-name()='Student']/*[local-name()='Person']/*[local-name()='AlternateName']/*[local-name()='LastName'] != ''">
								<p><span><xsl:value-of select="$Labels/Label[@key='Student.FormerLastName']"/> <xsl:call-template name="StudentInformation.getIndividualName"><xsl:with-param name="individualNameElement" select="'FormerLastName'" /></xsl:call-template></span></p>
							</xsl:if>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.DateOfBirth']"/> <xsl:call-template name="StudentInformation.DateOfBirth" /></span></p>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.Gender']"/> <xsl:call-template name="StudentInformation.StudentGender"><xsl:with-param name="GenderMale" select="'Male'" /><xsl:with-param name="GenderFemale" select="'Female'" /><xsl:with-param name="GenderUnreported" select="'Unreported'" /></xsl:call-template></span></p>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.StudentNumber']"/> <xsl:call-template name="StudentInformation.StudentID" /></span></p>
							<p><span><xsl:value-of select="$Labels/Label[@key='Student.GovernmentIdentifier']"/> <xsl:call-template name="StudentInformation.GovernmentId" /></span></p>
						</div>
						<div id="academic-awards" class="centre-column">
							<h2><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.Title']"/></h2>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicAward']">
								<xsl:if test="AcademicAwardDate/text() != ''">
									<div>
										<xsl:if test="AcademicAwardTitle/text() != ''">
											<h3><xsl:call-template name="AcademicAward.AcademicDegreeDescription" /></h3>
										</xsl:if>
										<xsl:if test="AcademicAwardDate/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.AwardDate']"/> <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span></p>
										</xsl:if>
										<xsl:for-each select="AcademicAwardProgram">
											<p><xsl:if test="AcademicProgramName/text() != ''">
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.ProgramName']"/> <xsl:apply-templates select="AcademicProgramName"/></span>
											</xsl:if>
											<xsl:if test="AcademicProgramType/text() != ''">
												<span> (<xsl:apply-templates select="AcademicProgramType"/>)</span>
											</xsl:if>
											</p>
										</xsl:for-each>
										<xsl:if test="AcademicAwardLevel/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.AwardLevel']"/> <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicHonors/HonorsLevel/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.HonorsLevel']"/> <xsl:call-template name="AcademicAward.HonoursLevel" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardProgram/NoteMessage/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicAward.Note']"/> <xsl:call-template name="AcademicAwardProgram.Note" /></span></p>
										</xsl:if>	
									</div>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSession']/*[local-name()='AcademicAward']">
								<xsl:if test="AcademicAwardDate/text() != ''">
									<div>
										<xsl:if test="AcademicAwardTitle/text() != ''">
											<h3><xsl:call-template name="AcademicAward.AcademicDegreeDescription" /></h3>
										</xsl:if>
										<xsl:if test="AcademicAwardDate/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.AwardDate']"/> <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardLevel/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.AwardLevel']"/> <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span></p>
										</xsl:if>
										<xsl:for-each select="AcademicAwardProgram">
											<p><xsl:if test="AcademicProgramName/text() != ''">
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.ProgramName']"/> <xsl:apply-templates select="AcademicProgramName"/></span>
											</xsl:if>
											<xsl:if test="AcademicProgramType/text() != ''">
												<span> (<xsl:apply-templates select="AcademicProgramType"/>)</span>
											</xsl:if>
											</p>
										</xsl:for-each>
										<xsl:if test="AcademicHonors/HonorsLevel/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.HonorsLevel']"/> <xsl:call-template name="AcademicAward.HonoursLevel" /></span></p>
										</xsl:if>
										<xsl:if test="AcademicAwardProgram/NoteMessage/text() != ''">
											<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.Note']"/> <xsl:call-template name="AcademicAwardProgram.Note" /></span></p>
										</xsl:if>	
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<div id="academic-summary" class="right-column">
							<h2><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.Title']"/></h2>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSummary']">
								<xsl:if test="AcademicSummaryType/text() = 'Cumulative' and GPA/GradePointAverage/text() != ''"> 
									<h3><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.CumulativeGPA']"/> <xsl:value-of select="GPA/GradePointAverage/text()"/></h3>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//*[local-name()='Student']/*[local-name()='AcademicRecord']/*[local-name()='AcademicSummary']">
								<xsl:if test="AcademicSummaryType/text() != 'Cumulative'"> 
									<div id="academic-summary-detail">
									<xsl:attribute name="id">
										<xsl:value-of select="concat('academic-summary-detail-',position())"/>
									</xsl:attribute>
									<h3>
										<xsl:if test="AcademicSummaryLevel/text() != ''">
											<xsl:value-of select="AcademicSummaryLevel/text()"/>
										</xsl:if>
										<xsl:if test="AcademicSummaryType/text() != '' and AcademicSummaryType/text() != 'UserDefined'">
											&#160;(<xsl:value-of select="AcademicSummaryType/text()"/>)
										</xsl:if>
										&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPA']"/> <xsl:value-of select="GPA/GradePointAverage/text()"/>
									</h3>
									<xsl:for-each select="GPA">
										<xsl:if test="GradePointAverage/text() != ''">
											<xsl:if test="CreditHoursEarned/text() != ''">
												<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPACreditHoursEarned']"/> <xsl:value-of select="CreditHoursEarned/text()"/></span>
												<xsl:if test="CreditUnit/text() != ''">
													<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPACreditUnit']"/> <xsl:value-of select="CreditUnit/text()"/></span>
												</xsl:if>
												</p>
											</xsl:if>
											<xsl:if test="NoteMessage/text() != ''">
												<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.GPANote']"/> <xsl:value-of select="NoteMessage/text()"/></span></p>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="NoteMessage">
										<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSummary.Note']"/> <xsl:value-of select="text()"/></span></p>
									</xsl:for-each>
								</div>
								</xsl:if>	
							</xsl:for-each>
						</div>
					</div>
					<xsl:if test="count(//Student/AcademicRecord/Course) > 0">
						<div class="session rounded-corners">
							<div id="transfer-credits" class="row">
								<div id="academic-record-grades" class="all-columns">
									<div id="grades">
										<h2><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.Title']"/></h2>
										<table class="grades-table">
											<thead>
												<tr> 
													<th scope="col" class="width-8"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseNumber']"/></th>
													<th scope="col" class="width-42"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseTitle']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CreditValue']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CreditEarned']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Grade']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.GradeScaleCode']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseQualityPointsEarned']"/></th>
												</tr>
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
													<td class="course-credit">
														<xsl:call-template name="Course.CreditValue" />
													</td>
													<td>
														<xsl:call-template name="Course.CreditsEarned" />
													</td>
													<td class="course-grade">
														<xsl:call-template name="Course.AcademicGrade" />
													</td>
													<td>
														<xsl:call-template name="Course.AcademicCreditQualifier" />
													</td>
													<td>
														<xsl:call-template name="Course.CourseQualityPointsEarned" />
													</td>
												</tr>
												<tr>
													<td></td>
													<td>
														<div style="float: left;"><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.Note']"/>&#160;</div>
														<div style="float: left;">
															<xsl:for-each select="NoteMessage">
																<span><xsl:value-of select="text()"/></span><br />
															</xsl:for-each>
														</div>
													</td>
													<td colspan="2">
														<xsl:if test="CourseCreditBasis/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseCreditBasis']"/> <xsl:call-template name="Course.BasisAcademicDescription" /></span>
														</xsl:if>
														<xsl:if test="CourseCreditUnits/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseCreditUnits']"/> <xsl:call-template name="Course.CourseCreditUnits" /></span>
														</xsl:if>	
														<xsl:if test="CourseCreditLevel/text() != ''">
															<span><br/><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.CourseCreditLevel']"/> <xsl:call-template name="Course.CourseCreditLevel" /></span>
														</xsl:if>
														
													</td>
													<td colspan="3">
														<xsl:if test="CourseAcademicGradeStatusCode/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.Grade']"/> <xsl:call-template name="Course.GradeStatus" /></span><br/>
														</xsl:if>
														<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.SupplementalGrade']"/> <xsl:call-template name="MKS.AcademicGrade" /></span>
																<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text() != ''">
																	<span>&#160;(<xsl:value-of select="$Labels/Label[@key='Student.AcademicRecord.Course.SupplementalGradeCode']"/> <xsl:call-template name="MKS.MarkCodeType" />)</span>
																</xsl:if>
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
								<xsl:attribute name="id">
									<xsl:value-of select="concat('session-summary-',position())"/>
								</xsl:attribute>
								<div class="left-column">
									<h3><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Title']"/> <xsl:value-of select="AcademicSessionDetail/SessionName/text()"/></h3>
									<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.StartDate']"/> <xsl:call-template name="Formatting.string_date_xml"><xsl:with-param name="date" select="AcademicSessionDetail/SessionBeginDate/text()"/></xsl:call-template></span></p>
									<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.EndDate']"/> <xsl:call-template name="Formatting.string_date_xml"><xsl:with-param name="date" select="AcademicSessionDetail/SessionEndDate/text()"/></xsl:call-template></span></p>
									<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Designator']"/> <xsl:value-of select="AcademicSessionDetail/SessionDesignator/text()"/> </span>
										<xsl:if test="string-length(AcademicSessionDetail/SessionDesignatorSuffix/text()) != 0">
												(<span><xsl:value-of select="AcademicSessionDetail/SessionDesignatorSuffix/text()"/>)</span>
											</xsl:if>
										</p>
								</div>
								<div class="centre-column">
									<xsl:if test="count(AcademicProgram) > 0">
										<h3><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicProgram.Title']"/></h3>
										<xsl:for-each select="AcademicProgram">	
											<xsl:if test="string-length(AcademicProgramName/text()) != 0">
												<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicProgram.FieldOfStudy']"/> <xsl:value-of select="AcademicProgramName/text()"/></span></p>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="StudentLevel">	
											<xsl:if test="string-length(StudentLevelCode/text()) != 0">
												<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicProgram.LevelOfStudies']"/> 
													<xsl:call-template name="Enums.StudentLevelCode">
														<xsl:with-param name="v_enum" select="StudentLevelCode/text()" />
													</xsl:call-template>
												</span></p>
												<xsl:for-each select="NoteMessage">
													<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicProgram.Note']"/> <xsl:value-of select="text()"/></span></p>
												</xsl:for-each>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count(AcademicAward) > 0">
										<h3><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.Title']"/></h3>
										<xsl:for-each select="AcademicAward">
											<p>
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.AwardTitle']"/> <xsl:call-template name="AcademicAward.AcademicDegreeDescription" /></span>
											</p>
											<p>
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.AwardLevel']"/> <xsl:call-template name="AcademicAward.AcademicDegreeCode" /></span>
											</p>
											<p>
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.HonorsLevel']"/> <xsl:call-template name="AcademicAward.HonoursLevel" /></span>
											</p>
											<p>
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicAward.AwardDate']"/> <xsl:call-template name="AcademicAward.DateDegreeAwarded" /></span>
											</p>
										</xsl:for-each>
									</xsl:if>
									<xsl:for-each select="NoteMessage">
										<p><span><xsl:value-of select="text()"/></span></p>
									</xsl:for-each>	
								</div>
								<div class="right-column">
									<xsl:for-each select="AcademicSummary">
										<xsl:if test="AcademicSummaryType/text() = 'Cumulative' and GPA/GradePointAverage/text() != ''"> 
											<h3><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.CumulativeGPA']"/> <xsl:value-of select="GPA/GradePointAverage/text()"/></h3>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="AcademicSummary">
										<xsl:if test="AcademicSummaryType/text() != 'Cumulative'"> 
											<div>
											<h3>
												<xsl:if test="AcademicSummaryLevel/text() != ''">
													<xsl:value-of select="AcademicSummaryLevel/text()"/>
												</xsl:if>
												<xsl:if test="AcademicSummaryType/text() != '' and AcademicSummaryType/text() != 'UserDefined'">
													&#160;(<xsl:value-of select="AcademicSummaryType/text()"/>)
												</xsl:if>
												&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.GPA']"/> <xsl:value-of select="GPA/GradePointAverage/text()"/>
											</h3>
											<xsl:for-each select="GPA">
												<xsl:if test="GradePointAverage/text() != ''">
													<xsl:if test="CreditHoursEarned/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.GPACreditHoursEarned']"/> <xsl:value-of select="CreditHoursEarned/text()"/></span>
														<xsl:if test="CreditUnit/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.GPACreditUnit']"/> <xsl:value-of select="CreditUnit/text()"/></span>
														</xsl:if>
														</p>
													</xsl:if>
													<xsl:if test="CreditHoursForGPA/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.GPACredits']"/> <xsl:value-of select="CreditHoursForGPA/text()"/></span></p>
													</xsl:if>
													<xsl:if test="GPARangeMinimum/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.GPARangeMinimum']"/> <xsl:value-of select="GPARangeMinimum/text()"/></span></p>
													</xsl:if>
														<xsl:if test="GPARangeMaximum/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.GPARangeMaximum']"/> <xsl:value-of select="GPARangeMaximum/text()"/></span></p>
													</xsl:if>
													<xsl:if test="NoteMessage/text() != ''">
														<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.GPANote']"/> <xsl:value-of select="NoteMessage/text()"/></span></p>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:if test="Delinquencies/text() != ''">
												<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.Delinquencies']"/> <xsl:call-template name="Enums.Delinquencies">
													<xsl:with-param name="v_enum" select="Delinquencies/text()" />
												</xsl:call-template>
												</span>
											</xsl:if>
											<xsl:for-each select="NoteMessage">
												<p><span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.AcademicSummary.Note']"/> <xsl:value-of select="text()"/></span></p>
											</xsl:for-each>
										</div>
										</xsl:if>	
									</xsl:for-each>
								</div>
							</div>
							<div id="session-details" class="row">
								<xsl:attribute name="id">
									<xsl:value-of select="concat('session-details-',position())"/>
								</xsl:attribute>
								<div id="session-grades" class="all-columns">
									<xsl:attribute name="id">
										<xsl:value-of select="concat('session-grades-',position())"/>
									</xsl:attribute>
									<div id="session-grades-section">
										<xsl:attribute name="id">
											<xsl:value-of select="concat('session-grades-section-',position())"/>
										</xsl:attribute>
										<h2><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Title']"/></h2>
										<table class="grades-table">
											<thead>
												<tr>
													<th scope="col" class="width-8"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseNumber']"/></th>
													<th scope="col" class="width-42"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseTitle']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CreditValue']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CreditEarned']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Grade']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.GradeScaleCode']"/></th>
													<th scope="col" class="width-10"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseQualityPointsEarned']"/></th>
												</tr>
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
													<td class="course-credit">
														<xsl:call-template name="Course.CreditValue" />
													</td>
													<td>
														<xsl:call-template name="Course.CreditsEarned" />
													</td>
													<td class="course-grade">
														<xsl:call-template name="Course.AcademicGrade" />
													</td>
													<td>
														<xsl:call-template name="Course.AcademicCreditQualifier" />
													</td>
													<td>
														<xsl:call-template name="Course.CourseQualityPointsEarned" />
													</td>
												</tr>
												<tr>
													<td></td>
													<td>
														<div style="float: left;"><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.Note']"/>&#160;</div>
														<div style="float: left;">
															<xsl:for-each select="NoteMessage">
																<span><xsl:value-of select="text()"/></span><br />
															</xsl:for-each>
														</div>
													</td>
													<td colspan="2">
														<xsl:if test="CourseCreditBasis/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseCreditBasis']"/> <xsl:call-template name="Course.BasisAcademicDescription" /></span>
														</xsl:if>
														<xsl:if test="CourseCreditUnits/text() != ''">
															<span>&#160;&#160;<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseCreditUnits']"/> <xsl:call-template name="Course.CourseCreditUnits" /></span>
														</xsl:if>	
														<xsl:if test="CourseCreditLevel/text() != ''">
															<span><br/><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.CourseCreditLevel']"/> <xsl:call-template name="Course.CourseCreditLevel" /></span>
														</xsl:if>
														
													</td>
													<td colspan="3">
														<xsl:if test="CourseAcademicGradeStatusCode/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.GradeStatus']"/> <xsl:call-template name="Course.GradeStatus" /></span><br/>
														</xsl:if>
														<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGrade/text() != ''">
															<span><xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.SupplementalGrade']"/> <xsl:call-template name="MKS.AcademicGrade" /></span>
																<xsl:if test="CourseSupplementalAcademicGrade/CourseSupplementalGrade/CourseAcademicSupplementalGradeScaleCode/text() != ''">
																	<span>&#160;(<xsl:value-of select="$Labels/Label[@key='Student.AcademicSession.Course.SupplementalGradeCode']"/> <xsl:call-template name="MKS.MarkCodeType" />)</span>
																</xsl:if>
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
				<div id="end-of-transcript"><xsl:value-of select="$Labels/Label[@key='EndOfTranscript']"/></div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>