# Beginner GitHub upload guide

## 1. Create a GitHub account

Go to GitHub and create/log in to your account.

## 2. Create a new repository

- Click **New repository**
- Name: `godot-kokoro-linux-godot-addon`
- Visibility: Public
- Do not add README/license/gitignore from GitHub if this folder already contains them.

## 3. Upload from terminal

Open a terminal:

```bash
cd /home/Visler/Skrivebord/godot-kokoro-linux-godot-addon
git init
git add .
git commit -m "Initial Linux Godot Kokoro addon release"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/godot-kokoro-linux-godot-addon.git
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.

## 4. Make a release

On GitHub:

- Go to the repository
- Click **Releases**
- Click **Create a new release**
- Tag: `v0.1.0-linux`
- Title: `Linux x86_64 Godot Kokoro addon v0.1.0`
- Upload the `.tar.gz` package created by the release script.

## 5. Do not upload these

Do not upload:

```text
kokoro_linux_build/
godot-cpp build folders
*.o
*.a
build logs
random test projects
large model files unless you intentionally use Git LFS or GitHub Releases
```
