# Load .env file and set environment variables
Get-Content ".env" | ForEach-Object {
    if ($_ -match "^\s*([^#][^=]+)=(.*)$") {
        $name = $matches[1].Trim()
        $value = $matches[2].Trim()
        [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
    }
}

# Example usage
Write-Host "Domain Name: $env:DOMAIN_NAME"
Write-Host "Database Host: $env:DB_HOST"
Write-Host "Debug Mode: $env:DEBUG"



$currentDir = Get-Location
Write-Host "Current directory is: $currentDir"
