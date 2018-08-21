settings.tex="pdflatex";
texpreamble("
\usepackage{boxedminipage}
\usepackage{fancybox}
\usepackage{xmpincl}
\usepackage{color}
\definecolor{mred}{rgb}{0.796875,0,0}
\definecolor{mgold}{rgb}{0.76171875,0.6,0.207843137255}
% \newcommand{\ct}[1]{\colorbox{mred}{\makebox[3mm]{\vphantom{CQFD}#1}}}
\newcommand{\ct}[1]{\textcolor{mred}{#1}}
\newcommand{\ctb}[1]{\textcolor{mgold}{#1}}
\newcommand{\lr}[1]{\makebox[30mm]{#1}}
");

real unitsize=10cm, coef=unitsize/2cm;
unitsize(unitsize);

pen p1=rgb(195,153,53);
pen p2=rgb(204,0,0);

picture pic;
guide gu=scale(sqrt(2))*shift(-0.5,-0.5)*unitsquare;

real scsq=2.1,sccr=1,scla=0.045*coef;
path cr=scale(sccr)*unitcircle;
transform T=scale(scsq,scsq);
path sq1=T*shift(-0.5,-0.5)*unitsquare;
path sq2=T*shift(0,-0.5)*unitsquare;

fill(sq1,black);
radialshade(cr,black,(0,0),0.7,p1,(0,0),1.1);

pair pl=(0,0);
path[] pi=scale(scla)*shift(pl)*texpath("$\pi$");
real a=39/256,b=124/256;
pen[][] ps={{black,p1,p2},{black,p2,p1},{p1,p2,black},{p1,black,p2},{p2,black,p1},{p2,p1,black}};

axialshade(gu,rgb(a,a,a),(0,min(gu).y),rgb(b,b,b),(0,max(gu).y));
latticeshade(pi[0],ps);

path[] prim=shift((0.1,0.815))*scale(scla/3)*rotate(-50)*texpath("$\prime$");
latticeshade(prim,new pen[][]{{black,p1,p2}});

real sq=scsq/2;
picture picl;

label(scale(8)*"\ct{C}",(-sq,sq),SE);
label(scale(8)*"\ct{Q}",(sq,sq),SW);
label(scale(8)*"\ct{F}",(sq,-sq),NW);
label(scale(8)*"\ct{D}",(-sq,-sq),NE);

texpreamble("
\usepackage[pdfauthor={Philippe IVALDI},
            pdftitle={Logo of piprime.fr},
            pdfsubject={http://www.piprime.fr},
            pdfkeywords={logo, avatar},
            pdfproducer={Asmyptote and Latex}]{hyperref}
\includexmp{licence}
");

shipout(bbox(currentpicture,Fill(black)),format="pdf");
