def _newTiktokDemo():
    start 'https://charts.spotify.com/charts/view/regional-us-weekly/latest'
    start "https://play.soundplate.com/analyze/track"
    start "https://songbpm.com"
    start "www.youtube.com"


    $oc r'D:\FL Projects\George\DEMOS\TikTok_Remixes'
    $oc r'D:\User\Song Studies'
    $oc r'D:\User\Song Studies\splits'

    subprocess.run(['powershell.exe', fr'start-process "C:\Users\Harrison\Desktop\FL Studio 20.lnk"'])
    subprocess.run(['powershell.exe', fr'start-process "C:\Users\Harrison\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\StacherIO\Stacher.lnk"'])
    subprocess.run(['powershell.exe', fr'start-process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SpleeterGUI\SpleeterGui.lnk"'])

aliases['newttdemo'] = _newTiktokDemo