# PESC Transcript Converter utility

## Introduction

This is a console app that can be used to convert PESC formatted XML Transcripts to HTML and convert HTML transcripts to PDF documents.

This tool is for demonstration purposes only and comes with no warranty from CanPESC or its contributors.

## Getting Started

### Prerequisites

Requires .NET 6.0
<https://dotnet.microsoft.com/en-us/download/dotnet/6.0>

### Build

Build solution in Visual Studio Code

### Limitations

This tool uses a free edition of SelectPdf PDF Library for .NET (https://selectpdf.com/pdf-library-for-net/) which is limited in the number of pages it can convert.

## Usage

From a command prompt or terminal run the pesctranscriptconvert.exe with desired parameters:

### Converting XML to HTML

Use "tohtml" switch with 3 parameters:
1. Path to XML file to be converted
2. Intended name of the HTML file to generate
3. Path to the primary XSLT file for the transformation (note that any Includes do not need to be explicitly added)

#### Example 

`pesctranscriptconvert.exe tohtml "CollegeTranscript.xml" "CollegeTranscript.html" "CollegeTranscript.xsl"`

### Converting HTML to PDF

Use "topdf" switch with 2 parameters:
1. Path to HTML file to be converted
2. Intended name of the PDF file to generate

#### Example 

`pesctranscriptconvert.exe topdf "CollegeTranscript.html" "CollegeTranscript.pdf"`

#### Samples Generation

cd C:\dev\git\common-digital-layout\src\pesctranscriptconverter\bin\Release\net6.0

.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\High School\OntarioHighSchool\HighSchoolTranscript.xml" "C:\dev\git\common-digital-layout\samples\High School\OntarioHighSchool\HighSchoolTranscript.html" "C:\dev\git\common-digital-layout\xslt\HighSchoolTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\High School\OntarioHighSchool\HighSchoolTranscript.html" "C:\dev\git\common-digital-layout\samples\High School\OntarioHighSchool\HighSchoolTranscript.pdf" 

.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript.xml" "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript.html" "C:\dev\git\common-digital-layout\xslt\HighSchoolTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript.html" "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript2.xml" "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript2.html" "C:\dev\git\common-digital-layout\xslt\HighSchoolTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript2.html" "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript2.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript3.xml" "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript3.html" "C:\dev\git\common-digital-layout\xslt\HighSchoolTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript3.html" "C:\dev\git\common-digital-layout\samples\High School\NovaScotiaHighSchool\NSHighSchoolTranscript3.pdf" 

.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\collegetranscript.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\collegetranscript.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\collegetranscript.html" "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\collegetranscript.pdf" 

.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript.html" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2.html" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2.pdf" 

.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1.xml" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1.html" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2.xml" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl"
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2.html" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2.pdf" 