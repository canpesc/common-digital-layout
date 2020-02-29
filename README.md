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

In order to demonstrate rendering of HTML to PDF, multiple tools can be used

https://pdfshift.io/#pricing

curl -d source="https://en.wikipedia.org/wiki/PDF" -d landscape="false" -d use_print="false" https://api.pdfshift.io/v2/convert/ -o wikipedia.pdf

# Contribute & Contact Us
To contibute or to contact us, please see https://www.pesc.org/canadian-pesc-user-group.html

# Plan

1. Complete skeleton of XSLT sets
2. Share with CanPESC user group
3. Share with PESC Standards group
4. Propose standard

# TODO
- Find more examples of XSTL transformation tools
- Find more samples of PDF rendering tools
