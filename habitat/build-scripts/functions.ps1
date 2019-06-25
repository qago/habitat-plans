. ../tmp/env.ps1

function getLatestRelease ($repo) {
    $uri = "https://api.github.com/repos/$repo/releases/latest?access_token=$env:GITHUB_TOKEN"
    return $(Invoke-RestMethod -Uri $uri).tag_name
}
