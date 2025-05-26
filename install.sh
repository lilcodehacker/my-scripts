#!/bin/sh
unzip "$1" -d $HOME/PICO-8/
echo "what is the name of the folder:"
read folder
echo "What is the name of the app"
read app app1 app2
echo "what is the name of the exec"
read exe 
chmod +x $HOME/PICO-8/$folder/$exec
rm $HOME/Downloads/*
printf "#!/bin/bash\nrm $HOME/.local/share/applications/\"$app $app1 $app2\".desktop\nrm -r $HOME/PICO-8/$folder/" > $HOME/PICO-8/$folder/uninstall.sh
printf "[Desktop Entry]\nExec=$HOME/PICO-8/$folder/$exe\nIcon=$HOME/PICO-8/$folder/$exe.png\nName=$app $app1 $app2\nNoDisplay=false\nPath=\nStartupNotify=true\nTerminal=false\nType=Application\nX-KDE-SubstituteUID=false\nX-KDE-Username=" > "$HOME/.local/share/applications/$app $app1 $app2.desktop"
grep -n "test.desktop" ./.config/menus/applications-kmenuedit.menu | awk '{print $1}' | head -n 1 | tail -n 1 > data.pod
read num1 < data.pod 
grep -n "test.desktop" ./.config/menus/applications-kmenuedit.menu | awk '{print $1}' | head -n 2 | tail -n 1 > data.pod
read num2 < data.pod 
sed -i "${num2%:}i    <Filename>$app $app1 $app2.desktop</Filename>" ~/.config/menus/applications-kmenuedit.menu
sed -i "${num1%:}i    <Filename>$app $app1 $app2.desktop</Filename>" ~/.config/menus/applications-kmenuedit.menu
qdbus org.kde.kappmenu /KAppMenu org.kde.kappmenu.reconfigure
rm data.pod
chmod 644 "$HOME/.local/share/applications/$app$app1$app2.desktop"
chmod +x $HOME/PICO-8/$folder/uninstall.sh
