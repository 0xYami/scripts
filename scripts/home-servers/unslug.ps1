# Set the path to the directory
$directoryPath = "C:\Users\Administrator\Videos\Anime"

# Get all folders in the specified directory
$folders = Get-ChildItem -Path $directoryPath -Directory

# Iterate through each folder and rename it
foreach ($folder in $folders) {
    # Remove dashes and (Dub) from the folder name
    $newName = $folder.Name -replace '-', ' ' -replace '\(Dub\)', ''

    # Construct the new path with the updated folder name
    $newPath = Join-Path -Path $directoryPath -ChildPath $newName

    # Rename the folder
    Rename-Item -Path $folder.FullName -NewName $newName -ErrorAction SilentlyContinue
}



Write-Host "Folder renaming complete."
