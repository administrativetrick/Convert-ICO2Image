# Convert-ICO2Image

To use Convert2ICOImage
 - Import the module into Porwershell (Example Import shown below)
   - `Import-Module 'C:\ConvertICO2Image.psd1'`
 - Create a folder c:\ at C:\ico_conversion
 - Place a .ico file into C:\ico_conversion
 - Run the Module

The Module has 2 Parameters
 - files
 - Formats

The files parameter defaults to C:\ico_conversion, you can manually give this another value if you do now want to use c:\ico_conversion as the location to store your ico file and the resulting converted images.

The Formats Paremeter defaults to Png.

Acceptable values for Formates are:
 - Png
 - Jpeg
 - Bmp
 - Tiff
 - Gif

Multiple Formats can be given and the Module will generate all requested formats.
