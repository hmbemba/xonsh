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
    

    exit

    '''
    # 1 Find the bpm / key of the song you want to remix
    # 2 Look in Songdb and find a song or songs of a similar key / bpm - look for one with a cool beat
    # 3 DL and spleeter both songs
    # 4 

    # getBPM/Key of OG song
    - create beat
    # find similar song w/ a similar beat
'''

aliases['newttdemo'] = _newTiktokDemo