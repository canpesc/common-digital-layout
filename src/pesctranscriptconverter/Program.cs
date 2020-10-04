using System;
using System.IO;
using System.Xml;
using System.Xml.Xsl;
using SelectPdf;

namespace pesctranscriptconverter
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length < 1)
            {
                PrintUsage();

            }
            var option = args[0];
            var inputfilepath = string.Empty;
            var outputfilepath = string.Empty;
            var xsltPath = string.Empty;

            FileStream fsIn;
            TextReader textReader;

            AppContext.SetSwitch("Switch.System.Xml.AllowDefaultResolver", true);

            try
            {

                switch (option)
                {
                    case "tohtml":

                        if (args.Length != 4)
                        {
                            PrintUsage();
                            break;
                        }
                        Console.WriteLine("Beginning conversion from XML to HTML...");

                        inputfilepath = args[1];
                        outputfilepath = args[2];
                        xsltPath = args[3];

                        fsIn = new FileStream(inputfilepath, FileMode.Open);
                        textReader = new StreamReader(fsIn);

                        XmlDocument xmlDocument = new XmlDocument();
                        xmlDocument.LoadXml(textReader.ReadToEnd());

                        XslCompiledTransform xslCompiledTransform = new XslCompiledTransform();
                        XsltArgumentList xsltArgumentList = new XsltArgumentList();

                        FileStream fs = new FileStream(outputfilepath, FileMode.Create, FileAccess.Write);
                        TextWriter writer = new StreamWriter(fs);

                        xslCompiledTransform.Load(xsltPath);
                        xslCompiledTransform.Transform(xmlDocument, xsltArgumentList, writer);

                        fs.Close();

                        Console.WriteLine("Converted to HTML");
                        break;

                    case "topdf":
                        if (args.Length != 3)
                        {
                            PrintUsage();
                            break;
                        }
                        Console.WriteLine("Beginning conversion from HTML to PDF...");
                        inputfilepath = args[1];
                        outputfilepath = args[2];

                        fsIn = new FileStream(inputfilepath, FileMode.Open);
                        textReader = new StreamReader(fsIn);

                        // instantiate the html to pdf converter
                        HtmlToPdf converter = new HtmlToPdf();

                        converter.Options.PdfPageSize = PdfPageSize.Letter;
                        converter.Options.PdfPageOrientation = PdfPageOrientation.Landscape;
                        converter.Options.CssMediaType = HtmlToPdfCssMediaType.Print;

                        converter.Options.MarginLeft = 10;
                        converter.Options.MarginRight = 10;
                        converter.Options.MarginTop = 2;
                        converter.Options.MarginBottom = 2;

                        // header settings
                        converter.Options.DisplayHeader = true;
                        converter.Header.DisplayOnFirstPage = true;
                        converter.Header.DisplayOnOddPages = true;
                        converter.Header.DisplayOnEvenPages = true;
                        converter.Header.Height = 30;

                        // footer settings
                        converter.Options.DisplayFooter = true;
                        converter.Footer.DisplayOnFirstPage = true;
                        converter.Footer.DisplayOnOddPages = true;
                        converter.Footer.DisplayOnEvenPages = true;
                        converter.Footer.Height = 30;

                        // add some html content to the footer
                        PdfHtmlSection headerHtml = new PdfHtmlSection(@"<div style=""text-align: right; width: 100%; font-size: 8pt"">Rendered by CanPESC</div>", "");
                        converter.Header.Add(headerHtml);

                        // page numbers can be added using a PdfTextSection object
                        PdfTextSection text = new PdfTextSection(-10, 10, "Page {page_number} of {total_pages}  ", new System.Drawing.Font("Arial", 8));
                        text.HorizontalAlign = PdfTextHorizontalAlign.Right;
                        converter.Footer.Add(text);

                        PdfTextSection text2 = new PdfTextSection(10, 10, "This is not an official transcript", new System.Drawing.Font("Arial", 8));
                        text2.HorizontalAlign = PdfTextHorizontalAlign.Left;
                        converter.Footer.Add(text2);

                        // convert the url to pdf
                        PdfDocument doc = converter.ConvertHtmlString(textReader.ReadToEnd());

                        // PDF Options - can be configured
                        doc.DocumentInformation.Title = "College Transcript";
                        doc.DocumentInformation.Author = "CanPESC";

                        // save pdf document
                        doc.Save(outputfilepath);

                        // close pdf document
                        doc.Close();

                        Console.WriteLine("Converted to PDF");
                        break;
                    default:
                        PrintUsage();
                        break;

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");

                PrintUsage();
            }

        }

        private static void PrintUsage()
        {
            Console.WriteLine("Usage: pesctranscriptconvert [tohtml|topdf] inputfilepath outputfilepath [xsltfilepath]");
            Console.WriteLine("Example: pesctranscriptconvert tohtml inputfile.xml outputfile.html transform.xslt");
            Console.WriteLine("Example: pesctranscriptconvert topdf inputfile.html outputfile.pdf");
        }

        private static string TransformXMLToHTML(string inputXml, string xsltString)
        {
            XslCompiledTransform transform = new XslCompiledTransform();
            using (XmlReader reader = XmlReader.Create(new StringReader(xsltString)))
            {
                transform.Load(reader);
            }
            StringWriter results = new StringWriter();
            using (XmlReader reader = XmlReader.Create(new StringReader(inputXml)))
            {
                transform.Transform(reader, null, results);
            }
            return results.ToString();
        }
    }
}
