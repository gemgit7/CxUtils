param(
    [Parameter(Mandatory=$true)]
    [hashtable]$session,
    [Parameter(Mandatory=$true)]
    [string]$reportID,
    [string]$projectName
)

. "support/rest_util.ps1"

$rest_url = [String]::Format("/api/reports/{0}", $reportID)
$request_url = New-Object System.Uri $session.base_url, $rest_url


Write-Debug "CxReporting API URL: $request_url"

$headers = GetRestHeadersForJsonRequest($session)

Invoke-RestMethod -Method 'Get' -Uri $request_url -Headers $headers -OutFile $fullpath

