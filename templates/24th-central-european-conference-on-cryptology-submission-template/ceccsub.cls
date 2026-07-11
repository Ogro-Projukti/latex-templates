\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ceccsub}[2024/01/04 CECC 2024 Submission LaTeX class]

% Document class for extended abstract submission for CECC 2024 conference.
% Heavily inspired by IACR's iacrcc and iacrtrans classes.
% Author: Oliwer Sobolewski

\def\confname{24th Central European Conference on Cryptology}
\def\confnameshort{CECC 2024}

\RequirePackage{xkeyval}

% You can pass options to xcolor and hyperref package with `xcolor=<options>`
\define@key{CECC}{xcolor}{\PassOptionsToPackage{#1}{xcolor}}
\define@key{CECC}{hyperref}{\PassOptionsToPackage{#1}{hyperref}}

% By default options are passed to the 'article' class
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptionsX\relax

\LoadClass[10pt, oneside]{article}

% Page geometry setup
\RequirePackage[a4paper,hscale=0.65,vscale=0.75,marginratio=1:1,marginparwidth=2.7cm]{geometry}

% Set fonts

% Causes warnings about \underbar and \underline
\RequirePackage{sectsty}
\RequirePackage{libertine}
% Title fonts
\allsectionsfont{\sffamily\boldmath}
% Description fonts
\renewcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries\sffamily\boldmath #1}

\RequirePackage{xcolor}
\RequirePackage{etoolbox}

% hyperref and totpages must be loaded last
\AtEndPreamble{
    \RequirePackage{hyperref}
    \RequirePackage[T1]{fontenc}
    \hypersetup{pdflang=en,
        urlcolor=blue,
        colorlinks=true,
        citecolor=black!70!green,
        linkcolor=black!70!red
    }

    \hypersetup{pdfsubject={\confname}}
    \RequirePackage{totpages}
}

% Hacky way of redefining macros back to their original definitions
\newenvironment{metadata}{}{}

\AtBeginDocument{
\begin{metadata}
    % PDF metadata
    %% PDF keywords
    \def\and{, }%
    \def\thanks#1{}%
    \def\footnote#1{}%
    \def\inst#1{}%
    \def\fnmsep{}%
    \def\\{}%
    \def\orcid#1{}
    \def\zap@first@space #1{#1}
    \def\insert@last@space#1,#2{%
      #1%
      \ifx#2\@empty\space\else, \expandafter\insert@last@space#2\fi}
    \def\zap@comma@space#1 ,#2{%
      #1%
      \ifx#2\@empty\else, \expandafter\zap@comma@space#2\fi}
    \def\zap@dbl@space#1 #2{%
      #1%
      \ifx#2\@empty\else\space\expandafter\zap@dbl@space#2\fi}
    \ifdefined\@PDFkeywords
      \hypersetup{pdfkeywords=\@PDFkeywords}
    \else
      \protected@edef\@tmp{\expandafter\@keywords}
      \protected@edef\@tmp{\expandafter\insert@last@space\@tmp,\@empty}
      \protected@edef\@tmp{\expandafter\zap@comma@space\@tmp ,\@empty}
      \protected@edef\@tmp{\expandafter\insert@last@space\@tmp,\@empty}
      \protected@edef\@tmp{\expandafter\zap@dbl@space\@tmp \@empty}
      \protected@edef\@tmp{\expandafter\zap@first@space \@tmp}
      \typeout{@KEYWORDS: \@tmp}
      \hypersetup{pdfkeywords=\@tmp}
    \fi
    %% PDF author
    \def\zap@one#1,#2{#1}
    \def\zap@last#1,#2{\ifx#1\@empty\else\space and \expandafter\zap@one#1\fi}
    \def\zap@last@comma#1,#2,#3{%
      #1%
      \ifx#3\@empty%
      \expandafter\zap@last\else
      ,\expandafter\zap@last@comma\fi%
      #2,#3
    }
    \protected@edef\@tmp{\expandafter\@author}
    \protected@edef\@tmp{\expandafter\zap@dbl@space\@tmp \@empty}
    \protected@edef\@tmp{\expandafter\insert@last@space\@tmp,\@empty}
    \protected@edef\@tmp{\expandafter\zap@comma@space\@tmp ,\@empty}
    \protected@edef\@tmp{\expandafter\insert@last@space\@tmp,\@empty}
    \protected@edef\@tmp{\expandafter\zap@dbl@space\@tmp \@empty}
    \ifx\@tmp\empty\else
      %\protected@edef\@tmp{\expandafter\zap@first@space \@tmp}
      \typeout{@AUTHOR: \@tmp}
      \hypersetup{pdfauthor=\@tmp}
    \fi
    %% PDF title
    \protected@edef\@tmp{\expandafter\@title}
    \protected@edef\@tmp{\expandafter\insert@last@space\@tmp,\@empty}
    \protected@edef\@tmp{\expandafter\zap@dbl@space\@tmp \@empty}
    \ifx\@tmp\empty\else
      \protected@edef\@tmp{\expandafter\zap@first@space \@tmp}
      \hypersetup{pdftitle=\@tmp}
      \typeout{@TITLE: \@tmp^^J}
    \fi
\end{metadata}
}

% Assert correct length of the document
\AtEndDocument{
    \ifnum\theTotPages>3\relax
        \ClassError{ceccsub}{Extended abstract cannot exceed 4 pages}
    \fi
}

% Authors

% Full author list for the metadata
\global\let\@listofauthors\@empty

\global\let\@author\@empty
\global\let\@affiliation\@empty


\def\@institute{Unknown institute.}
\newcommand{\institute}[1]{\gdef\@institute{#1}}

% alphalph: Convert numbers to letters,
\RequirePackage{alphalph}
\RequirePackage{afterpage}

\def\@keywords{No keywords given.}

\def\keywords{\@ifnextchar[{\@@keywords}{\@keywords}}
\def\@@keywords[#1]#2{\gdef\@PDFkeywords{#1}\gdef\@keywords{#2}}
\def\@keywords#1{\gdef\@keywords{#1}}

\AtBeginDocument{
    \renewcommand\maketitle{\par
         %\hypersetup{pdftitle={\@plaintitle}}
         \begingroup
              \global\@topnum\z@   % Prevents figures from going at top of page.
              % Ensure we use alphabetical numbering for the author footnotes
              \renewcommand*{\thefootnote}{\alphalph{\value{footnote}}}%
              \@maketitle
              \thispagestyle{title}\@thanks
        \endgroup
        \setcounter{footnote}{0}%
        \global\let\thanks\relax
        \global\let\maketitle\relax
        \global\let\@maketitle\relax
        \global\let\@thanks\@empty
        \global\let\@date\@empty
        \global\let\date\relax
        \global\let\and\relax
        % Adjust header size for title page
        \addtolength{\headheight}{\baselineskip}%
        \addtolength{\headsep}{-\baselineskip}%
        \afterpage{%
          \global\advance\headheight by -\baselineskip%
          \global\advance\headsep by \baselineskip%
        }%
        %\vskip 0.5em%
        \hrule
        
        % keywords
        \small\quotation\setlength{\parindent}{0pt}\noindent
        {\smallskip\par\textbf{\textsf{Keywords:}}
        \def\and{\unskip\space\textperiodcentered\space\ignorespaces}\@keywords
        \endquotation}
        \vskip 0.5em%
        \hrule
        }
}



\newif\if@autoinst
\@autoinsttrue
\newif\if@anonymous
\@anonymousfalse
\def\author@last{0}

% Count the number of authors
\newcounter{author@cnt}
% Count the number of institutions
\newcounter{institute@cnt}
% Count the number of provided e-mail addresses
\newcounter{email@cnt}

\def\@maketitle{
  % Setup counters
  \setcounter{author@cnt}{1}%
  \setcounter{institute@cnt}{1}%
  \setbox0\hbox{\def\thanks##1{\global\@autoinstfalse}\def\inst##1{\global\@autoinstfalse}\def\and{\stepcounter{author@cnt}}\@author}%
  \setbox0\hbox{\def\and{\stepcounter{institute@cnt}}\@institute}%
  \xdef\author@last{\theauthor@cnt}%
  \edef\inst@last{\theinstitute@cnt}
  \ifnum\author@last=\inst@last\else\@autoinstfalse\fi
  \ifnum\author@last=1 \@autoinstfalse\fi
  
  \newpage
  \null
  %\vskip 1em%
  \begin{center}%
    % Insert the title and subtitle (if defined)
    {\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      {\LARGE \bfseries\sffamily\boldmath \@title\par}%
      \ifdefined\@subtitle\vskip .5em{\large\sffamily\bfseries\@subtitle\par}\fi
    }%
    %\vskip 1.5em
    \vskip 0.75em%
    %\hrule
    \vskip 0.75em
    {\large
      \lineskip .5em%
        \if@anonymous
          Anonymous Submission
        \else
          \setcounter{footnote}{0}%
          \newcounter{@cnt}
          \setcounter{@cnt}{1}%
          % Make sure authors are separated by a comma except the last one where we use ' and '
          \def\and{
            \stepcounter{@cnt}
            \ifnum\the@cnt=\theauthor@cnt\unskip\space and \ignorespaces\else\unskip, \ignorespaces\fi
          }
          
          \@author\if@autoinst\inst{\the@cnt}\fi
          \vskip 1em\par
          \small
          \setcounter{@cnt}{1}%
          % When there is only one author with one or more affiliations
          % do not display the affiliation counter
          % Redefine \and to make sure we print the affiliation numbers
          \def\and{\par\ifnum\theauthor@cnt=1\relax\else\stepcounter{@cnt}$^{\the@cnt}$~\fi}
          %\def\and{\par\stepcounter{author@cnt}$^{\theauthor@cnt}$~}
          % The above redefinition does not work for the first institute: fix that here
          %\ifnum\inst@last>1 $^1$~\fi\ignorespaces%
          \ifnum\theauthor@cnt=1\relax\else
            \ifnum\theinstitute@cnt>1$^1$~\fi\ignorespaces%
          \fi
          \@institute

          %\vskip 1em\par
          
        \fi%
      }%
  \end{center}%
  \par
}

\def\email{\@ifnextchar[{\@@email}{\@email}}
\def\@@email[#1]#2{\href{mailto:#1}{\nolinkurl{#2}}}
\def\@email#1{\href{mailto:#1}{\nolinkurl{#1}}}

\RequirePackage{url}

\gdef\emaildomain{}% Emails domain
\newcommand{\emails}[2][]{% Use a declaration
  \edef\emaildomain{#1}
  \texttt{\{}\href{mailto:#2@\emaildomain}{\nolinkurl{#2}}\checknextarg}
\newcommand{\checknextarg}{\@ifnextchar\bgroup{\gobblenext}{}}% Check if another "argument" exists
\newcommand{\gobblenext}[1]{\href{mailto:#1@\emaildomain}{\nolinkurl{,#1}}\@ifnextchar\bgroup{\gobblenext}{\texttt{\}}\nolinkurl{@\emaildomain}}}% Gobble next "argument"


\newcommand{\inst}[1]{\unskip$^{#1}$\ignorespaces}
\newcommand{\orcid}[1]{\hspace{1pt}\orcidlink{#1}\hspace{1pt}\ignorespaces}

\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}

\def\@plaintitle{Title}

% For orcid links generation
\RequirePackage{orcidlink}

% Head/foot
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}

\fancypagestyle{title}{%
\fancyhf{} % clear all header and footer fields
    \fancyhead[L]{%
      \small%
      \confname{}\\
    }
    %\fancyfoot[L]{%
    %  \small%
    %  \hfill{}%
    %  Received: \date \hfill{}%
    %}%
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}
}

\fancyhf{}
\fancyhead[RO,L]{\thepage}
\fancyhead[R]{%
  \ifdefined\runningtitle\runningtitle%
  %\else%
  %  \def\thanks##1{}%
  %  \def\fnmsep{}%
  %  \def\\{}%
  %  \def\footnote##1{}%
  %  \@title%
  \fi
}
\fancyhead[LO]{%
  \ifdefined\runningauthors\runningauthors%
  \else%
    \def\thanks##1{\ignorespaces}%
    \def\orcid##1{\ignorespaces}%
    \def\inst##1{\ignorespaces}%
    \def\fnmsep{}%
    \def\\{}%
    \def\footnote##1{\ignorespaces}%
    \setcounter{author@cnt}{1}%
    \def\and{\stepcounter{author@cnt}%
      \ifnum\theauthor@cnt=\author@last\unskip\space and \ignorespaces\else\unskip, \ignorespaces\fi}
    %\typeout{AUTHOR: \@author}
    \@author%
  \fi}
  \fancyfoot[C]{
    \thepage
  }
\fancyfoot[L]{
    \confnameshort
}

\renewcommand{\markboth}[2]{}
\pagestyle{fancy}

\newcommand{\authorrunning}[1]{\gdef\runningauthors{#1}}
\newcommand{\titlerunning}[1]{\gdef\runningtitle{#1}}