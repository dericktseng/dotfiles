\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myhomework}[Custom Homework Template]

\LoadClass[12pt]{article}

%{{{ Packages
\RequirePackage[margin=1truein,letterpaper]{geometry}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{siunitx}
\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage{adjustbox}
\RequirePackage{xurl}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{chemformula}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{pdfpages}
\RequirePackage[style=numeric]{biblatex}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}

\lstset{style=mystyle,basicstyle=\ttfamily\footnotesize,breaklines=true,showstringspaces=false,frame=single}
%}}}

\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}

\author{Derick Tseng}
\date{\today}
