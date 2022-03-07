<#
	.SYNOPSIS
		Converts a given ICO file to a either a PNG, JPG, BMP or Tiff File
	
	.PARAMETER Path
		The path where your .ico file is stored

	.PARAMETER Path
		The path where your .ico file is stored
	
	.EXAMPLE
		PS C:\> Convert-ICO2Image -files c:\ico_conversion

	.EXAMPLE
		PS C:\> Convert-ICO2Image -files c:\ico_conversion -Format Png

	.EXAMPLE
		PS C:\> Convert-ICO2Image -files "C:\ico_conversion" -Formats Bmp,Jpeg,Png,Tiff,Gif

#>
function Convert-ICO2Image
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $false)]
		$files = "c:\ico_conversion",
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ValidateSet('Png','Jpeg','Bmp','Tiff','Gif')]
		[string[]]$Formats = 'Png'
	)
	begin
	{
		Add-Type -AssemblyName system.drawing
	}
	process
	{
		foreach ($Format in $Formats)
		{
			$files = Get-ChildItem $files -Filter *.ico -file -Recurse |
			foreach-object {
				$Source = $_.FullName
				$test = [System.IO.Path]::GetDirectoryName($source)
				$base = $_.BaseName + ".$Format"
				$basedir = $test + "\" + $base
				$imageFormat = "System.Drawing.Imaging.ImageFormat" -as [type]
				$image = [drawing.image]::FromFile($Source)
				
				# Create a new image
				$NewImage = [System.Drawing.Bitmap]::new($Image.Width, $Image.Height)
				$NewImage.SetResolution($Image.HorizontalResolution, $Image.VerticalResolution)
				
				# Add graphics based on the new image
				$Graphics = [System.Drawing.Graphics]::FromImage($NewImage)
				$Graphics.DrawImageUnscaled($image, 0, 0) # Add the contents of $image
				
				# Now save the $NewImage 
				$NewImage.Save($basedir, $imageFormat::$Format)
			}
		}
	}
}
