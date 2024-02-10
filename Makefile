logo.pdf:
	LC_NUMERIC=\"french\" asy -V  -wait logo.asy


.PHONY: png
png: logo.pdf
	convert -density 300 logo.pdf[0] -quality 100 -size 500 logo.png
