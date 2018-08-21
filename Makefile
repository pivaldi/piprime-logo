.PHONY: png_
png_:
	convert -density 300 logo.pdf[0] -quality 100 -size 500 logo.png

.PHONY: png
png:
	pdftoppm logo.pdf logo -png -f 0 -singlefile
