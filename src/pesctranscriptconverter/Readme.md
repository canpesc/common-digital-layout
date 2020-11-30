# PESC Transcript Converter utility

## Introduction

This is a console app that can be used to convert PESC formatted XML Transcripts to HTML and convert HTML transcripts to PDF documents.

This tool is for demonstration purposes only and comes with no warranty from CanPESC or its contributors.

## Getting Started

### Prerequisites

Requires .NET Core 3.1
<https://dotnet.microsoft.com/download/dotnet-core/3.1>

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
