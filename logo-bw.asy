settings.tex = "pdflatex";
texpreamble("
\usepackage[charter]{mathdesign}
\def\rmdefault{bch}
\def\ttdefault{blg}
");

real unitsize = 10cm, coef = unitsize/2cm;
unitsize(unitsize);

real scla = 0.0365*coef;
real sqrt2 = sqrt(2)/1.0565;

path cr = unitcircle;
path sq = shift(-sqrt2/2, -sqrt2/2) * scale(sqrt2) * unitsquare;

pair pl = (0,-0.125);
path[] pi=scale(scla) * shift(pl) * texpath("$\pi$");
path[] prim=shift((0.1,0.815))*scale(scla/3)*rotate(-50)*texpath("$\prime$");

fill(pi^^prim, black);
draw(sq, scale(20) * black);
draw(cr, scale(40) * black);

real sq = 1.05;
label(scale(8) * "C", (-sq,sq), SE);
label(scale(8) * "Q", (sq,sq), SW);
label(scale(8) * "F", (sq,-sq), NW);
label(scale(8) * "D", (-sq,-sq), NE);

shipout(currentpicture, format = "pdf");
