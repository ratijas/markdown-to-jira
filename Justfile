set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

build:
    pnpm run build

upload:
    ssh me mkdir -p /var/www/html/md2jira
    ssh me rm -rf "/var/www/html/md2jira/*"
    scp -r dist/* me:/var/www/html/md2jira/
