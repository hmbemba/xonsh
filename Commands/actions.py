from collections import defaultdict
import fire
import subprocess

def getrepo(repoName: str):
    def def_value():
        return "gh repo list"
    o = defaultdict(def_value)
    
    o["edbw"]= "gh repo clone hmbemba/edbw"
    o["dpgw"]= "gh repo clone hmbemba/DPGW"
    o["ffo"]= "gh repo clone hmbemba/FFO"
    o["baseedbw"]= "gh repo clone hmbemba/BASE_EDBW"
    o["basedpgw"]= "gh repo clone hmbemba/BASE_DPGW"

    if repoName not in o.keys():
        print(f"Error: {repoName} not a valid repo name - use gh repo clone ... one of the repo's below")
    subprocess.run(["powershell.exe", o[repoName]])
    
if __name__ == "__main__":
    fire.Fire(
        {
            "getrepo":getrepo
        }
    )