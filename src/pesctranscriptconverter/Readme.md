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
- from the command line: `dotnet build`
- from Visual Studio Code: `Ctrl+Shift+B`

### Limitations

This tool uses a free edition of SelectPdf PDF Library for .NET (https://selectpdf.com/pdf-library-for-net/) which is limited in the number of pages it can convert.

## Usage

From a command prompt or terminal run the pesctranscriptconvert.exe with desired parameters:

### Converting XML to HTML

Use "tohtml" switch with 4 parameters:
1. Path to XML file to be converted
2. Intended name of the HTML file to generate
3. Path to the primary XSLT file for the transformation (note that any Includes do not need to be explicitly added)
4. Optional locale (default "en-CA")

#### Example 

`pesctranscriptconvert.exe tohtml "CollegeTranscript.xml" "CollegeTranscript.html" "CollegeTranscript.xsl" fr-CA`

### Converting HTML to PDF

Use "topdf" switch with 2 parameters:
1. Path to HTML file to be converted
2. Intended name of the PDF file to generate

#### Example 

`pesctranscriptconvert.exe topdf "CollegeTranscript.html" "CollegeTranscript.pdf"`

#### Samples Generation

```ps
cd C:\dev\git\common-digital-layout\src\pesctranscriptconverter\bin\Release\net6.0

.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript_en-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" en-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript_en-CA.html" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript_en-CA.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript_fr-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" fr-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript_fr-CA.html" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript_fr-CA.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2_en-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" en-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2_en-CA.html" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2_en-CA.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2_fr-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" fr-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2_fr-CA.html" "C:\dev\git\common-digital-layout\samples\College\OntarioUniversity\UniversityTranscript2_fr-CA.pdf" 

.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\CollegeTranscript.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\CollegeTranscript_en-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" en-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\CollegeTranscript_en-CA.html" "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\CollegeTranscript_en-CA.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\CollegeTranscript.xml" "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\CollegeTranscript_fr-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" fr-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\CollegeTranscript_fr-CA.html" "C:\dev\git\common-digital-layout\samples\College\OntarioCollege\CollegeTranscript_fr-CA.pdf" 

.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1.xml" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1_en-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" en-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1_en-CA.html" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1_en-CA.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1.xml" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1_fr-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" fr-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1_fr-CA.html" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript1_fr-CA.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2.xml" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2_en-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" en-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2_en-CA.html" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2_en-CA.pdf" 
.\pesctranscriptconvert.exe tohtml "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2.xml" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2_fr-CA.html" "C:\dev\git\common-digital-layout\xslt\CollegeTranscript.xsl" fr-CA
.\pesctranscriptconvert.exe topdf "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2_fr-CA.html" "C:\dev\git\common-digital-layout\samples\College\NovaScotiaUniversity\UniversityTranscript2_fr-CA.pdf" 
```