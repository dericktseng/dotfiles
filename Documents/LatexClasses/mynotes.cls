% Preamble
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myhomework}[Custom Homework Template]

\LoadClass[12pt]{memoir}

\RequirePackage[letterpaper,left=1in, right=1in]{geometry}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{siunitx}
\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage{adjustbox}
\RequirePackage[version=4]{mhchem}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{pdfpages}
\RequirePackage[style=numeric,refsection=chapter]{biblatex}
\RequirePackage[headings]{fancyhdr}
\RequirePackage{mdframed}
\RequirePackage{hyperref}
\RequirePackage{cleveref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuration
\author{Derick Tseng}
\pagestyle{fancy}

% hyperref
\hypersetup{
    colorlinks=true,
    linkcolor=cyan!30!blue,
    filecolor=magenta,
    urlcolor=cyan,
}
\urlstyle{same}

% biblatex
\addbibresource{references.bib}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% commands

% \vec{x} bold vector characters
\renewcommand{\vec}[1]{\ensuremath{\mathbf{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% environments

% mdassumption
\newmdenv[
frametitlebackgroundcolor=orange!50,
linecolor=orange!50,
backgroundcolor=orange!10,
linewidth=2pt,
frametitle={Assumptions},
]{mdassumption}

% note
\newmdenv[
hidealllines=true,
leftline=true,
innerleftmargin=10pt,
innerrightmargin=10pt,
innertopmargin=0pt,
linewidth=2pt,
frametitle={Note:},
backgroundcolor=gray!10
]{note}

% definition
\theoremstyle{definition}
\newmdtheoremenv[
frametitlebackgroundcolor=green!50,
linecolor=green!50!black,
backgroundcolor=green!10,
linewidth=2pt,
frametitlebackgroundcolor=green!50,
hidealllines=true,
leftline=true,
% frametitle={Definition}
]
{definition}{Definition}[section]

% assumption
\newenvironment{assumption}{
\begin{mdassumption}
\begin{enumerate}
}
{
\end{enumerate}
\end{mdassumption}
}
