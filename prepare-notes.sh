downloads=$(./get-downloads.sh)
editor=$(./get-editor.sh)

target=$1
shift 1

if [ ! -f $target/notes.md ]
then
	echo "Preparing directory"
	[ -d $target ] && rm -r $target
	mkdir $target/{,img,slides}

	echo "Moving presentations"
	i=1
	for pattern in "$@"
	do
		for slidesfile in $downloads/$pattern.pdf
		do
			num=$(printf "%02d" $i)
			cp "$slidesfile" $target/slides/slides-$num.pdf
			i=$((i + 1))
		done
	done

	echo "Combining presentations"
	pdfunite $target/slides/slides-*.pdf $target/slides/slides.pdf

	echo "Extracting slides"
	pdftoppm -jpeg $target/slides/slides.pdf $target/img/slide

	echo "Constructing notes"
	ls -l $target/img | grep -oE 'slide-[0-9]{1,}\.jpg' | sed 's/.*/\!\[\]\(\.\/img\/&\)/g' > $target/notes.md
fi

$editor $target/notes.md
