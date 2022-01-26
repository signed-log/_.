if [ -f "/usr/bin/bat" ]; then
  alias cat=bat
fi

if [ -f "/usr/bin/exa" ]; then
  alias ls="exa --group-directories-first --all"
fi

pdfcompress ()
{
   gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=$1.compressed.pdf $1; 
}

pdfcombine () 
{
  gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=${1%.*}.pdf -dBATCH ${@:2} 
} 

pipenv-base ()
{
  pipenv -v install --dev --pre black ipython pyright pylint coverage isort autoflake
}
