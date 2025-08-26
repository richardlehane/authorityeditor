# authorityeditor

Authority Editor, on a modern stack.

dart run build_runner build

## Build for web



flutter build web --base-href "/nsw/"

Copy build/web folder to sites/authorityeditor.com/nsw

git add .
git commit -m "fresh build"
git push origin main


If wiped:
git init
git add .
git commit -m "fresh build"
git remote add origin git@github.com:richardlehane/authorityweb.git
git push --force origin main
