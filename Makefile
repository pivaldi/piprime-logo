.PHONY: all
all: png

logo.pdf:
	LC_NUMERIC=\"french\" asy -V  -wait logo.asy

logo-bw.pdf:
	LC_NUMERIC=\"french\" asy -V  -wait logo-bw.asy

logo.png:
	convert -density 300 logo.pdf[0] -quality 100 -size 500 logo.png

logo-bw.png:
	convert -quiet  -density 300 logo-bw.pdf[0] -quality 100 -size 500 logo-bw.png

.PHONY: png
png: logo.pdf logo-bw.pdf logo.png logo-bw.png
