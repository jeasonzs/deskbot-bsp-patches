#!/usr/bin/env python3
import os
import subprocess

def main(repo_topdir=None, **kwargs):
    print(f"[HOOK] post-sync repo_topdir={repo_topdir}")
    apply_sh = os.path.join(repo_topdir, "patches", "apply.sh")
    try:
        subprocess.run(["bash", apply_sh], check=True)
        print("[HOOK] apply.sh executed successfully")
    except subprocess.CalledProcessError as e:
        print(f"[HOOK] ERROR: apply.sh failed: {e}")
