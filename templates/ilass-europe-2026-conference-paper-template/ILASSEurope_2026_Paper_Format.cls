% This file was converted to LaTeX by Writer2LaTeX ver. 0.4b
% see http://www.hj-gym.dk/~hj/writer2latex for more info
\NeedsTeXFormat{LaTeX2e}
\LoadClass[a4paper,10pt]{article}
\usepackage{graphicx,color}
\usepackage[normalem]{ulem} 
\usepackage{url}
\usepackage{xcolor}
\usepackage{enumitem}
\usepackage{arydshln}
\usepackage{anyfontsize}
\usepackage{fancyhdr}



\DeclareUrlCommand\ULurl{%
  \renewcommand\UrlFont{\ttfamily\color{blue}}%
  \renewcommand\UrlLeft{\uline\bgroup}%
  \renewcommand\UrlRight{\egroup}}
\usepackage[utf8]{inputenc}
%\usepackage[latin1]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{amsmath,amssymb,amsfonts,textcomp}
\usepackage{calc}
\usepackage{hyperref}
\usepackage{caption}
\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
%\usepackage{times}
\hypersetup{hidelinks, colorlinks=false, linkcolor=black, filecolor=black, urlcolor=black}
% Text styles
\newcommand\textstyleFootnoteSymbol[1]{#1}
\newcommand\textstyleInternetlink[1]{\textcolor{blue}{#1}}
\newcommand{\titlesize}{\fontsize{14}{15}\bfseries\selectfont}
\newcommand{\authorsize}{\fontsize{11}{12}\selectfont}
\newcommand{\corresponding}{\fontsize{11}{12}\selectfont}
\renewcommand{\small}{\fontsize{8}{10}\selectfont}
\newcommand{\titleSize}{\fontsize{11}{10}\selectfont}
\newcommand{\subheadingSize}{\fontsize{10}{10}\selectfont}

% Outline numbering
\setcounter{secnumdepth}{2}
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
% Pages styles (master pages)
\makeatletter
\newcommand{\runningheads}[2]{\gdef\@runningheads{\small\textit{#1} \hfill \textit{#2}}}
\newcommand{\runningfoots}[1]{\gdef\@runningfoots{\protect\parbox{\textwidth}{\small{#1}}}}
\newcommand{\ps@Standard}{%
\renewcommand{\@oddhead}{\@runningheads}
\renewcommand{\@evenhead}{\@oddhead}%
\renewcommand{\@oddfoot}{\@runningfoots}%
\renewcommand{\@evenfoot}{\@oddfoot}%
\setlength{\paperwidth}{21cm}
\setlength{\paperheight}{29.7cm}
\setlength{\voffset}{-.9in}
\setlength{\hoffset}{-1in}
\setlength{\topmargin}{1cm
%2cm
}
\setlength{\headheight}{16.4pt}%{12pt}
\setlength{\headsep}{.45cm}
\setlength{\footskip}{12pt+0.5cm}
\setlength{\textheight}{29.7cm-2cm-2cm-12pt}
\setlength{\oddsidemargin}{2.5cm}
\setlength{\textwidth}{21cm-2.5cm-2.5cm}
\renewcommand{\thepage}{\arabic{page}}
\setlength{\skip\footins}{0.1cm}
\setlength{\parindent}{0.0cm}
\setlength{\mathindent}{0cm}
\setlength{\arrayrulewidth}{0.01pt} % Thickness of the line
\renewcommand\footnoterule{\vspace*{-0.018cm}\noindent\textcolor{black}{\rule{0.25\columnwidth}{0.018cm}}\vspace*{0.101cm}}
}


\newcommand{\firstpagehead}[1]{\gdef\@firstpagehead{\small\textit{#1}}}
\newcommand{\doi}[1]{\gdef\@doi{\href{#1}{\small\textit{#1}}}}
\newcommand{\ps@FirstPage}{%
\renewcommand{\@oddhead}{\protect\parbox{\textwidth}{\@firstpagehead \protect\\ \@doi}}%
\renewcommand{\@evenhead}{\@oddhead}%
\renewcommand{\@oddfoot}{\@runningfoots}%\normalfont\hfil\thepage}%
\renewcommand{\@evenfoot}{\@oddfoot}%
\setlength{\paperwidth}{21cm}
\setlength{\paperheight}{29.7cm}
\setlength{\voffset}{-1in}
\setlength{\hoffset}{-1in}
\setlength{\topmargin}{1cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{1cm}
\setlength{\footskip}{12pt+.5cm}
\setlength{\textheight}{29.7cm-2cm-2cm-0.5cm-12pt-0.5cm-12pt}
\setlength{\oddsidemargin}{2.5cm}
\setlength{\textwidth}{21cm-2.5cm-2.5cm}
\renewcommand{\thepage}{\arabic{page}}
\setlength{\skip\footins}{0.1cm}
\setlength{\parindent}{0.0cm}
% \setlength{\mathindent}{0.3cm}
\renewcommand\footnoterule{\vspace*{-0.018cm}\noindent\textcolor{black}{\rule{0.25\columnwidth}{0.018cm}}\vspace*{0.1cm}}
}





% sections
\renewcommand{\section}{\@startsection{section}{1}{\z@}% {1} level {\z@} indent
                                   {0.5cm \@plus -1ex}% -0.5 -> horizontal gap (vertical before section gap when positive)
                                   {0.1ex \@plus.2ex}%
                                   {\normalfont\titleSize\bfseries}}%


\renewcommand{\subsection}{\@startsection{subsection}{2}{1cm}%
                                   {0.5cm \@plus -1ex}%
                                   {0.1ex \@plus.2ex}%
                                   {\normalfont\subheadingSize\bfseries}}%

\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                   {0.5cm \@plus -1ex}%
                                   {.1ex \@plus .2ex}%
                                   {\normalfont\normalsize\bfseries\itshape\hspace{0cm}}}%

% captions
\renewcommand{\@makecaption}[2]{%
  \centering
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\normalsize\fontsize{10}{10}\selectfont \textbf{#1.} \textit{#2}}%
  \normalsize\fontsize{10}{10}\selectfont \textbf{#1.} \textit{#2}\par
  \vskip\belowcaptionskip
}


\makeatother
\pagestyle{Standard}
\thispagestyle{FirstPage}
\setlength\tabcolsep{5mm}
\renewcommand{\arraystretch}{1.0}
% footnotes configuration
\makeatletter
\renewcommand\thefootnote{\normalsize\fnsymbol{footnote}}
\makeatother

% \renewcommand{\equation}{%
%   \begin{center}
%   \refstepcounter{equation}\vspace*{1em}%
%   \begin{math}
% }
% \renewcommand{\endequation}{%
%   \end{math}
%   \end{center}
% }


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
%2pt
}
\end{center}
}

\def\address#1{
\begin{center}
 \vspace*{-12pt}
 \authorsize#1
 \vspace*{-6pt}
\end{center}
}

\setlength{\unitlength}{1.cm}
\def\abstract#1{
 \begin{center}
  \normalfont\bfseries{Abstract}
 \end{center}
 \vspace*{-10pt}
 \noindent\normalfont#1{\\}
 \begin{minipage}[t][0.01cm][t]{16cm}
  \begin{picture}(16,0.001)
   \put(0,-0.25){\line(1,0){16}}
  \end{picture}
 \end{minipage}
 \vspace*{0.25cm}
}



\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyfoot[C]{\color{black}\fontsize{10}{20}\selectfont \thepage}
\fancyhead[C]{\color{black} \textit{\fontsize{8}{20}\selectfont  ILASS Europe 2026, 34th Conference on Liquid Atomization \& Spray Systems, 6th - 9th Sept. 2026, Lisbon, Portugal}}
\firstpagehead{\hspace*{1cm} \color{gray} \textit{\fontsize{8}{20}\selectfont  ILASS Europe 2026, 34th Conference on Liquid Atomization & Spray Systems, 6th - 9th Sept. 2026, Lisbon, Portugal}}
\runningfoots{\hspace*{8.0cm} \color{black} \thepage }
\renewcommand{\headrule}{\vspace{4pt}\color{black}\hrule width\headwidth height 0.4pt}
\renewcommand{\footrule}{\color{black}\hrule width\headwidth height 0.4pt}
\fancypagestyle{FirstPage}{
    \renewcommand{\headrule}{\vspace{4pt}\color{black}\hrule width\headwidth height 0.4pt}
}

\setlength{\footskip}{25pt+.5cm}


% \def\thebibliography#1{
% \list{{\arabic{enumi}}}
% {\def\makelabel##1{\hss{[##1]}}
% \topsep=0pt\parsep=0pt\partopsep=0pt\itemsep=0pt
% \labelsep=1ex\itemindent=-0.5ex
% \settowidth\labelwidth{\footnotesize[#1]}%
% \leftmargin\labelwidth
% \advance\leftmargin\labelsep
% \advance\leftmargin -\itemindent
% \usecounter{enumi}}
% \def\newblock{\ }
% \sloppy\clubpenalty4000\widowpenalty4000
% \sfcode`\.=1000\relax
% }
% \let\endthebibliography=\endlist


