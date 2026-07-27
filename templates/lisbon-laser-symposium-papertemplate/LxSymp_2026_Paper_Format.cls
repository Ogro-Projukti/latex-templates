% This file was converted to LaTeX by Writer2LaTeX ver. 0.4b
% see http://www.hj-gym.dk/~hj/writer2latex for more info
\NeedsTeXFormat{LaTeX2e}
% \ProcessOptions\relax
\LoadClass[a4paper,12pt,oneside]{extarticle}
% \RequirePackage{babel}
% \RequirePackage[dvips]{graphicx,color}
\RequirePackage{graphicx,color}
\newcommand*\bigcdot{\mathpalette\bigcdot@{.5}}
\newcommand*\bigcdot@[2]{\mathbin{\vcenter{\hbox{\scalebox{#2}{$\m@th#1\bullet$}}}}}
\RequirePackage{float}

\RequirePackage[normalem]{ulem} 
\RequirePackage{url}

\DeclareUrlCommand\ULurl{%
  \renewcommand\UrlFont{\ttfamily\color{blue}}%
  \renewcommand\UrlLeft{\uline\bgroup}%
  \renewcommand\UrlRight{\egroup}}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath,amssymb,amsfonts,textcomp}
\RequirePackage{calc}
\RequirePackage{hyperref}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{apacite}
\RequirePackage{natbib}
\RequirePackage{palatino}
\RequirePackage{float}
% \renewcommand{\familydefault}{\sfdefault}
%\RequirePackage{times}
\hypersetup{hidelinks, colorlinks=false, linkcolor=black, filecolor=black, urlcolor=black}
% Text styles
\newcommand\textstyleFootnoteSymbol[1]{#1}
\newcommand\textstyleInternetlink[1]{\textcolor{blue}{#1}}
\newcommand{\titlesize}{\fontfamily{phv}\fontseries{mc}\fontsize{15}{16}\bfseries\selectfont}
\newcommand{\authorsize}{\fontfamily{phv}\fontseries{mc}\fontsize{11}{12}\selectfont}
\newcommand{\addressize}{\fontfamily{phv}\fontseries{mc}\fontsize{9}{10}\selectfont}
\renewcommand{\small}{\fontsize{8}{10}\selectfont}
% Outline numbering
\setcounter{secnumdepth}{3} %subsubsections are numbered
% List styles
\newcommand\liststyleWWviiiNumii{%
\renewcommand\theenumi{\arabic{enumi}}
\renewcommand\theenumii{\arabic{enumii}}
\renewcommand\theenumiii{\arabic{enumiii}}
\renewcommand\theenumiv{\arabic{enumiv}}
\renewcommand\labelenumi{\theenumi.}
\renewcommand\labelenumii{\theenumii.}
\renewcommand\labelenumiii{\theenumiii.}
\renewcommand\labelenumiv{\theenumiv.}
}

% Equation formatting
\RequirePackage{amsmath}
\RequirePackage{nccmath}
\renewcommand{\theequation}{{\fontfamily{ppl}\selectfont\arabic{equation}}}

% Pages styles (master pages)
\makeatletter
\newcommand{\runningheads}[2]{\gdef\@runningheads{\fontfamily{phv}\fontseries{mc}\fontsize{9.5}{10.5}\selectfont\textit{#1} \hfill \textit{#2}}}
%\newcommand{\runningheads}[1]{\gdef\@runningheads{20th LISBON Laser Symposium 2022 $\bigcdot$ doi:...}}
\newcommand{\runnigfoots}[1]{\gdef\@runnigfoots{\protect\parbox{\textwidth}{\small{#1}}}}
\newcommand{\ps@Standard}{%
\renewcommand{\@oddhead}{\@runningheads}
\renewcommand{\@evenhead}{\@runningheads}%
%\renewcommand{\@evenhead}{\@oddhead}%
\renewcommand{\@oddfoot}{\@runnigfoots}%
\renewcommand{\@evenfoot}{\@oddfoot}%

% Page layout (geometry)
\setlength{\paperwidth}{21cm}
\setlength{\paperheight}{28cm}
\setlength\voffset{-1in}
\setlength\hoffset{-1in}
\setlength{\topmargin}{1cm}
\setlength{\oddsidemargin}{1.41cm}
\setlength{\textheight}{28cm-2cm-3cm}
\setlength{\textwidth}{21cm-1.41cm-1.41cm}
\setlength\footskip{2cm}
\setlength{\headheight}{1cm}
\setlength\headsep{1cm}
\setlength{\footskip}{12pt+0.5cm}
\renewcommand{\thepage}{\arabic{page}}
\setlength{\skip\footins}{0.1cm}
\setlength{\parindent}{0.0cm}
\setlength{\mathindent}{0.3cm}
\renewcommand\footnoterule{\vspace*{-0.018cm}\noindent\textcolor{black}{\rule{0.25\columnwidth}{0.018cm}}\vspace*{0.101cm}}
}


\newcommand{\firstpagehead}[1]{\gdef\@firstpagehead{\noindent\rule{\textwidth}{1pt}\\ \centering\fontfamily{phv}\fontseries{mc}\fontsize{9.5}{10.5}\selectfont 22nd International Symposium on Application of Laser and Imaging Techniques to Fluid Mechanics $\bigcdot$ LISBON | PORTUGAL $\bigcdot$ JUNE 29-JULY 2, 2026 \noindent\rule{\textwidth}{1pt}}}
\newcommand{\paperdoi}[1]{\gdef\@paperdoi{\href{#1}{\small\textit{#1}}}}
\newcommand{\ps@FirstPage}{%g
\renewcommand{\@oddhead}{\protect\parbox{\textwidth}{\@firstpagehead \protect\\ %\@paperdoi
}}%
\renewcommand{\@evenhead}{\@oddhead}%
\renewcommand{\@oddfoot}{\@runnigfoots}%\normalfont\hfil\thepage}%
\renewcommand{\@evenfoot}{\@oddfoot}%
\setlength{\paperwidth}{21cm}
\setlength{\paperheight}{28cm}
\setlength{\voffset}{-1in}
\setlength{\hoffset}{-1in}
\setlength{\topmargin}{1cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{1cm}
\setlength{\footskip}{12pt+0.5cm}
\setlength{\textheight}{28cm-1.5cm-2cm}
\setlength{\oddsidemargin}{1.41cm}
\setlength{\textwidth}{21cm-1.41cm-1.41cm}
\renewcommand{\thepage}{\arabic{page}}
\setlength{\skip\footins}{0.1cm}
\setlength{\parindent}{0.0cm}
\setlength{\mathindent}{0.3cm}
\renewcommand\footnoterule{\vspace*{-0.018cm}\noindent\textcolor{black}{\rule{0.25\columnwidth}{0.018cm}}\vspace*{0.1cm}}
}

% paragraph spacing
\setlength{\parskip}{0.5\baselineskip}

% sections
\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\fontsize{12}{13}\bfseries}{\thesection.}{0.5em}{}
\titleformat{\subsection}{\normalfont\normalsize\bfseries}{\thesubsection.}{0.5em}{}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{\thesubsubsection.}{0.5em}{}


% captions
\renewcommand{\@makecaption}[2]{%
\centering
 \vskip\abovecaptionskip
 \sbox\@tempboxa{\normalsize\fontsize{10}{11}\selectfont \textbf{#1.} #2}%
  \normalsize\fontsize{10}{11}\selectfont \textbf{#1.} #2\par
\vskip\belowcaptionskip}

\makeatother
\pagestyle{Standard}
\thispagestyle{FirstPage}
\setlength\tabcolsep{5mm}
\renewcommand{\arraystretch}{1.0}

% footnotes configuration
\makeatletter
\renewcommand\thefootnote{\normalsize\fnsymbol{footnote}}
\makeatother
\everymath{\displaystyle}


\def\title#1{
\begin{center}
 \vspace*{3pt
%2pt
}
 \titlesize{#1}
 \vspace*{1.5pt
}
\end{center}
}

\def\author#1{
\begin{center}
 \authorsize#1
 \vspace*{5pt
}
\end{center}
}

\def\address#1{
\begin{center}
 \vspace*{-12pt}
 \addressize#1
 \vspace*{-6pt}
\end{center}
}

% Formatting ABSTRACT title
\setlength{\unitlength}{1.cm}
\def\abstract#1{
 \begin{center}
  \fontfamily{phv}\fontseries{mc}\fontsize{11}{12}\selectfont{ABSTRACT}
 \end{center}
 \vspace*{-10pt}
 \noindent\fontfamily{ppl}\fontsize{10}{11}\selectfont#1{\\}\normalfont\fontfamily{ppl}\fontsize{12}{14}\selectfont
 \begin{minipage}[t][0.01cm][t]{16cm}
  \begin{picture}(16,0.001)
   \put(0,-0.25){\line(1,0){18.15}}
  \end{picture}
 \end{minipage}
 \vspace*{0.25cm}
}
