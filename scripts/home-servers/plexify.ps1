# Set the root folder path
$rootFolder = "C:\Users\Administrator\Videos\Anime"

# Get all subfolders
$subfolders = Get-ChildItem -Path $rootFolder -Directory

# Loop through each subfolder
foreach ($subfolder in $subfolders) {
    # Get all files in the subfolder
    $files = Get-ChildItem -Path $subfolder.FullName -File

    # Loop through each file
    foreach ($file in $files) {
        # Use regex to extract episode name and extension from the filename
        if ($file.BaseName -match '_(\d+)(\..+)$') {
            $episodeName = $Matches[1]
            $fileExtension = $Matches[2]

            # Construct the new filename without subfolder prefix
            $newFilename = "$episodeName$fileExtension"

            # Get the full path of the destination file
            $newFilePath = Join-Path -Path $file.Directory.FullName -ChildPath $newFilename

            # Rename the file
            Rename-Item -Path $file.FullName -NewName $newFilePath

            # Display the result
            Write-Host "Renamed: $($file.Name) to $newFilename"
        } else {
            # If no match, display an error or handle accordingly
            Write-Host "Error: No match found for $($file.BaseName) in $($subfolder.Name)"
        }
    }
}