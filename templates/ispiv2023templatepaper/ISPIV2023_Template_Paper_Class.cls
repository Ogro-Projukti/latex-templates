% Template two-column paper for ICEFM 2018 Munich Conference
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ISPIV2023_Template_Paper_Class}


% DECLARE TEMPLATE OPTIONS
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
%%
\LoadClass[letterpaper,11pt,onecolumn,notitlepage]{article}
%%
\usepackage{pslatex}
\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{textcomp}
\usepackage{natbib}	
\usepackage[top=25mm, bottom=25mm, left=25mm, right=25mm]{geometry}
\usepackage{subfigure}	
\usepackage{hyperref}


%% FONT SIZES
\renewcommand{\normalsize}{\fontsize{11}{11}\selectfont}
\newcommand{\authorsize}{\fontsize{14}{14}\selectfont}
\newcommand{\titlesize}{\fontsize{20}{20}\selectfont}

%% page style
\pagestyle{fancy}
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{}

\renewcommand{\headrulewidth}{0pt}
\setlength{\columnsep}{12.5mm}

\fancypagestyle{firstpage}{%
 	 \lhead{\textit{15\textsuperscript{th} International Symposium on Particle Image Velocimetry -- ISPIV 2023\\ June 19--21, 2023, San Diego, California, USA}}
	}
  
 \renewcommand{\maketitle}{
 		\global\@topnum\z@
  		\@maketitle
    		\thispagestyle{firstpage}
	}
	
\def\@maketitle{
	\newpage
 	\null
 	\begin{center}
		{\bfseries \titlesize \@title}
		\vskip 15pt%
		{\bfseries \authorsize \@author}
		\vskip 15pt%
		{\mdseries \normalsize \@affiliation}
	\end{center}
	}
	
\def\affiliation#1{\gdef\@affiliation{#1}}
\gdef\@affiliation{}
	
	
%%%%
\renewenvironment{abstract}{\section*{Abstract}}{}%
\newenvironment{acknowledgments}{\section*{Acknowledgements}}{}%

\bibliographystyle{ISPIV2023_BibliographyStyle}
