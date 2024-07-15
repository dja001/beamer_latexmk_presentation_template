#/bin/bash

#get everything needed for a new beamer presentation


# compile with " lamekmk"

#set -ex

#first we determine what presentation number this is
current_num=$(find ./ -maxdepth 1 -name 'presentation_*' | sort | wc -l)
presentation_num=$(printf "%02d" $(expr ${current_num} + 1))

if [[ -z "$1" ]] ; then
    echo "Please provide a short description for this presentation"
    exit 1
else
    if [[ "$#" > 1 ]] ; then
        echo "Please no spaces in description"
        exit 1
    fi

    exp_desc="$1"
fi


#new experiment directory with an empty "figures" dir
dir_name=presentation_"${presentation_num}"_"${exp_desc}"
if [[ -d "${dir_name}" ]] ; then
    echo "Directory ${dir_name} already exists, we do nothing"
    exit 1
fi
mkdir -vp ${dir_name}/figures

#copy files from template
cp -vL beamer_latexmk_presentation_template/dom_custom_cmds.sty  ${dir_name}/
cp -vL beamer_latexmk_presentation_template/latexmkrc            ${dir_name}/
cp -vL beamer_latexmk_presentation_template/references.bib       ${dir_name}/
cp -vL beamer_latexmk_presentation_template/intro.svg           ${dir_name}/figures/
cp -vL beamer_latexmk_presentation_template/dominik_template.tex ${dir_name}/dominik_"${presentation_num}".tex
