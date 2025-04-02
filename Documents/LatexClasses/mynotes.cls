% Preamble
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mynotes}[Custom Notes Template]

\LoadClass[12pt]{memoir}

\RequirePackage[letterpaper,left=1in, right=1in]{geometry}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage[per-mode=fraction]{siunitx}
\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage{pdfpages}
\RequirePackage{adjustbox}
\RequirePackage[version=4]{mhchem}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage[style=nature,refsection=chapter]{biblatex}
\RequirePackage{fancyhdr}
\RequirePackage{mdframed}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{derivative}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuration
\author{Derick Tseng}
\pagestyle{fancy}

% hyperref
\hypersetup{
    colorlinks=true,
    linkcolor=purple,
    filecolor=magenta,
    urlcolor=magenta,
    citecolor=purple
}
\urlstyle{same}

% biblatex
\addbibresource{references.bib}

% fancyhdr
\fancyhead[LO]{}
\fancyhead[RE]{}

% siunitx
\DeclareSIUnit\angstrom{\text {Å}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% commands

% \vec{x} bold vector characters
\renewcommand{\vec}[1]{\ensuremath{\mathbf{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% environments

% mdassumption
\newmdenv[
hidealllines=true,
leftline=true,
linecolor=orange!70,
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
backgroundcolor=gray!10,
]{note}

% proof
\renewmdenv[
hidealllines=true,
leftline=true,
linecolor=blue!50,
linewidth=2pt,
backgroundcolor=blue!5,
frametitle=Proof,
]{proof}

% theorem
\theoremstyle{plain}
\newmdtheoremenv[
hidealllines=true,
leftline=true,
linecolor=cyan!50!blue,
linewidth=2pt,
backgroundcolor=cyan!10,
]{theorem}{Theorem}[section]

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
