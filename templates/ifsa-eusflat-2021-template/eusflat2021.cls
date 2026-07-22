\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eusflat2021}

\LoadClass[twoside,a4paper,10pt]{article}

\RequirePackage{graphicx}
\RequirePackage{mathptmx}
\RequirePackage[T1]{fontenc}

\RequirePackage{url}
\DeclareUrlCommand\email{}

%********************************************************
% Style file for the Conference EUSFLAT2021, Bratislava, Slovakia
%******************************************************** 
% File eusflat2021.cls
%********************************************************

%******************************************************** 
% Page dimensions and layout
%********************************************************
\RequirePackage[a4paper, left=2.50cm, right=2.50cm, top=3.17cm, bottom=3.17cm]{geometry}

\setlength\columnsep{7mm}  
\newlength\titlebox  
\setlength\titlebox{60.8mm} 

\thispagestyle{empty}     
\pagestyle{empty} 
\flushbottom\twocolumn\sloppy 

\def\addcontentsline#1#2#3{} 
 
\def\maketitle{\par
 \begingroup 
   \def\thefootnote{\fnsymbol{footnote}} 
   \def\@makefnmark{\hbox to 0pt{$^{\@thefnmark}$\hss}} 
   \twocolumn[\@maketitle] \@thanks 
 \endgroup 
 \setcounter{footnote}{0} 
 \let\maketitle\relax \let\@maketitle\relax 
 \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax} 
\def\@maketitle{\vbox to \titlebox{\hsize\textwidth 
\linewidth\hsize  \centering \vspace*{1.27cm}
 {\Large\bf \@title \par}   \vskip 5.12mm plus 1fil minus 2.56mm 
 {\def\and{\unskip\enspace{\rm and}\enspace}% 
  \def\And{\end{tabular}\hss \egroup \hskip 25.6mm plus 2fil  
           \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\bf}% 
  \def\AND{\end{tabular}\hss\egroup \hfil\hfil\egroup 
         \vskip 6.4mm plus 1fil minus 3.2mm 
          \hbox to \linewidth\bgroup \hfil\hfil 
            \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\bf} 
 \hbox to \linewidth\bgroup \hfil\hfil 
    \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\bf\@author  
                         \end{tabular}\hss\egroup 
    \hfil\hfil\egroup} 
  \vskip 7.68mm plus 2fil minus 2.56mm 
}} 

\renewenvironment{abstract}
{\centerline{\large\bf Abstract}\vspace{0.5ex}\begin{quote}}
{\par\end{quote}\vskip 0.5ex}
 
%******************************************************** 
% Sections with reduced space
%********************************************************
\def\section{\@startsection {section}{1}{\z@}{-2.0ex plus 
    -0.5ex minus -.2ex}{1.5ex plus 0.3ex minus .2ex}{\large\bf\raggedright}} 
\def\subsection{\@startsection{subsection}{2}{\z@}{-1.8ex plus 
    -0.5ex minus -.2ex}{0.8ex plus .2ex}{\normalsize\bf\raggedright}} 
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-1.5ex plus 
   -0.5ex minus -.2ex}{0.5ex plus .2ex}{\normalsize\bf\raggedright}} 
\def\paragraph{\@startsection{paragraph}{4}{\z@}{1.5ex plus 
   0.5ex minus .2ex}{-1em}{\normalsize\bf}} 
\def\subparagraph{\@startsection{subparagraph}{5}{\z@}{1.5ex plus 
   0.5ex minus .2ex}{-1em}{\normalsize\bf}} 
\def\subsubsubsection{\vskip 5pt{\noindent\normalsize\rm\raggedright}} 
 
 
%******************************************************** 
% Footnotes
%******************************************************** 
\footnotesep 6.65pt % 
\skip\footins 9pt plus 4pt minus 2pt 
\def\footnoterule{\kern-3pt \hrule width 5pc \kern 2.6pt } 
\setcounter{footnote}{0} 


%******************************************************** 
% Acknowledgement
%******************************************************** 
\newenvironment{acknowledgment}{{\bf Acknowledgement}\par}{}


%******************************************************** 
% Lists and paragraphs
%********************************************************
\parindent 0pt 
\topsep 4pt plus 1pt minus 2pt 
\partopsep 1pt plus 0.5pt minus 0.5pt 
\itemsep 2pt plus 1pt minus 0.5pt 
\parsep 2pt plus 1pt minus 0.5pt 
\parskip .5pc 
 
\leftmargin 2em \leftmargini\leftmargin \leftmarginii 2em 
\leftmarginiii 1.5em \leftmarginiv 1.0em \leftmarginv .5em  
\leftmarginvi .5em 
\labelwidth\leftmargini\advance\labelwidth-\labelsep \labelsep 5pt 
 
\def\@listi{\leftmargin\leftmargini} 
\def\@listii{\leftmargin\leftmarginii 
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep 
   \topsep 2pt plus 1pt minus 0.5pt 
   \parsep 1pt plus 0.5pt minus 0.5pt 
   \itemsep \parsep} 
\def\@listiii{\leftmargin\leftmarginiii 
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep 
    \topsep 1pt plus 0.5pt minus 0.5pt  
    \parsep \z@ \partopsep 0.5pt plus 0pt minus 0.5pt 
    \itemsep \topsep} 
\def\@listiv{\leftmargin\leftmarginiv 
     \labelwidth\leftmarginiv\advance\labelwidth-\labelsep} 
\def\@listv{\leftmargin\leftmarginv 
     \labelwidth\leftmarginv\advance\labelwidth-\labelsep} 
\def\@listvi{\leftmargin\leftmarginvi 
     \labelwidth\leftmarginvi\advance\labelwidth-\lat\@ixpt} 
\def\footnotesize{\@setsize\footnotesize{10pt}\ixpt\@ixpt} 
\def\scriptsize{\@setsize\scriptsize{8pt}\viipt\@viipt} 
\def\tiny{\@setsize\tiny{7pt}\vipt\@vipt} 
\def\large{\@setsize\large{14pt}\xiipt\@xiipt} 
\def\Large{\@setsize\Large{16pt}\xivpt\@xivpt} 
\def\LARGE{\@setsize\LARGE{20pt}\xviipt\@xviipt} 
\def\huge{\@setsize\huge{23pt}\xxpt\@xxpt} 
\def\Huge{\@setsize\Huge{28pt}\xxvpt\@xxvpt} 
 
\def\toptitlebar{ 
\hrule height4pt 
\vskip 6.4mm} 
 
\def\bottomtitlebar{ 
\vskip 6.4mm 
\hrule height1pt 
\vskip 6.4mm} 

\IfFileExists{style-fix.tex}{\input{style-fix}}{}

%******************************************************** 
% End of eusflat2021.cls
%********************************************************
