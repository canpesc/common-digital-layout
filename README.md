# common-pdf-layout
PESC Transcript Common PDF Layout

A toolkit to help users of the PESC transcript standards generate PDFs of transcripts they send/receive to facilitate an easy-to-read and easy-to-print layout.

# Introduction 
The goal of the CanPESC Common Layout Working Group is to reduce the effort other institutions and transcript hubs to implement a transcript-to-pdf solution.  This is a common need for organizations adopting the PESC standards and it would be good to not have to reinvent the wheel!

This repository demonstrates primarily taking an XML file and generating HTML using an XSL transform.  Combining HTML with CSS styling allows the user to create a visually appealing and printable document.

## Goals

- Support High School and Post-Secondary (College) transcripts
- Be flexible to be reused for multiple versions of PESC standards

# Getting Started

## Demonstrating the HTML Transformation

TODO

## Demonstrating PDF Render

In order to demonstrate rendering of HTML to PDF, multiple tools can be used.  Here is a short list of tools available for this

### pdfshift.io

> https://pdfshift.io/
>
> Example usage:
> `curl -d source="https://en.wikipedia.org/wiki/PDF" -d landscape="false" -d use_print="false" https://api.pdfshift.io/v2/convert/ -o wikipedia.pdf`

### pdfcrowd.com

> https://pdfcrowd.com/
>
> Example usage:
> `curl -f -u demo:ce544b6ea52a5621fb9d55f8b542d14d -o "document.pdf" -F "url=https://example.com" https://api.pdfcrowd.com/convert/`

### wkhtmltopdf

> https://wkhtmltopdf.org/

Some additional reading on generating a PDF: 

* Using Javascript to generate PDF 
<https://www.codementor.io/@amehjoseph/convert-html-css-content-to-a-sleek-multiple-page-pdf-file-using-jspdf-javascript-library-eyyz74hci>
* <https://www.smashingmagazine.com/2019/06/create-pdf-web-application/>

# Contribute & Contact Us
To contibute or to contact us, please see https://www.pesc.org/canadian-pesc-user-group.html

# Plan

1. Complete skeleton of XSLT sets
2. Share with CanPESC user group
3. Share with PESC Standards group
4. Propose standard

# TODO

* [ ] Ensure all core elements are represented in vanilla transforms
* [ ] Find more examples of XSTL transformation tools
* [ ] Find more samples of PDF rendering tools
* [ ] Provide different stylesheet examples
