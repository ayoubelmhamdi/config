#!/bin/zsh



alias t=termux-url-opener
# cd $HOME/storage/downloads/
return

pdf_lang2(){
  lang="${1:-}"
  pdf_file="${2:-}"
  [ -z "$pdf_file" ] && echo "is an empty file" && return 1
  [ -z "$lang" ] && echo "no lang provide" && return 1
  [ ! -f "$pdf_file" ] && echo "does no $pdf_file" && return 1
  echo "$pdf_file"
  pdf_path="$(realpath "$pdf_file")"
  echo "$pdf_path"
  if cd $HOME/pdfgpt;then
    echo pull origin master
    git pull origin master || { echo "can not pull" && return 1}
    output_pdf="${lang}_PDFs/$pdf_file"
    cp "$pdf_path" "$output_pdf"
    [ ! -f "$output_pdf" ] && echo "does no $output_pdf" && return 1
    git add "$output_pdf"
    git commit -m"init $output_pdf"
    git push -u origin master
  fi

  cd $HOME/storage/downloads/
}

#alias pdf="pdf_lang en"
#alias pdf-fr="pdf_lang fr"

pdf_lang(){
  lang="${1:-}"
  pdf_file="${*: -1}"

  [ -z "$pdf_file" ] && echo "is an empty file" && return 1
  [ -z "$lang" ] && echo "no lang provide" && return 1
  [ ! -f "$pdf_file" ] && echo "does no $pdf_file" && return 1


  shift 1
  text=""
  for arg in "${@}"; do
    if [ ! "$arg" = "$pdf_file" ];then
      text+="--llm $arg\n"
    fi
  done

  pdf_path="$(realpath "$pdf_file")"

  echo "lang=$lang"
  echo "pdf_file=$pdf_file"
  echo "pdf_path$pdf_path"


  if cd "$HOME/pdfgpt";then
    echo "pull origin master"
    git pull origin master || { echo "can not pull" && return 1;}


    cat /dev/null > ./tasks.txt
    echo -e "$text" > ./tasks.txt

    git add tasks.txt
    git commit -m"modify tasks.txt in: $(date +%Y-%m-%d)" ./tasks.txt
    git push -u origin master

    output_pdf="${lang}_PDFs/$pdf_file"
    mkdir -p "${lang}_PDFs/"
    cp "$pdf_path" "$output_pdf"
    [ ! -f "$output_pdf" ] && echo "there is no $output_pdf" && return 1

    git add "$output_pdf"
    git commit -m"init $output_pdf in: $(date +%Y-%m-%d)" "$output_pdf"

    git push -u origin master
  fi

  cd "$HOME/storage/downloads/" || return 1;
}

alias pdf="pdf_lang en correct_ocr paraphrasing" # file.pdf
alias pdf-fr="pdf_lang fr correct_ocr paraphrasing" # file.pdf
# alias pdf-fr="pdf_lang fr correct_ocr" # file.pdf
sshd



# zprofile doesnt loaded in termux
export ayoub="best2"
if [[ -e $HOME/.config/zprofile  ]];then
    export ayoub="best1"
    for file in $HOME/.config/zprofile/*;do
        zi ice lucid wait
        zi snippet "$file"
    done
fi

export ayoub="ok"
