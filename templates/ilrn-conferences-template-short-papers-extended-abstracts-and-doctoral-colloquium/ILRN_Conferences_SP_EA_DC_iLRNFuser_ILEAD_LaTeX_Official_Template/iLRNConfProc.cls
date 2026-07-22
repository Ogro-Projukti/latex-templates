\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iLRN2025}[2025/04/06 Custom class for iLRN Conferences]

\LoadClass[10pt]{article}

% Required packages
\RequirePackage[paper=a4paper, top=1in, bottom=1in, left=1in, right=1in]{geometry}
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{eso-pic}
\RequirePackage{titling}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage{changepage}
\RequirePackage{url}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage[labelfont=bf]{caption}

% Figure and table caption styles
\DeclareCaptionLabelFormat{customFig}{\textbf{Fig.~#2.}}
\DeclareCaptionLabelFormat{customTab}{\textbf{Table~#2.}}
\captionsetup[figure]{labelformat=customFig, labelsep=space}
\captionsetup[table]{labelformat=customTab, labelsep=space}

% Section formatting
\titleformat{\section}{\bfseries\large}{\thesection\quad}{0em}{}
\titleformat{\subsection}{\bfseries}{\thesubsection\quad}{0em}{}
\titleformat{\subsubsection}[runin]{\bfseries}{\thesubsubsection\quad}{0em}{}[.]
\titleformat{\paragraph}[runin]{\itshape}{}{0em}{}[.]

% Title and section formatting
\RequirePackage{titlesec}
\titleformat{\section}{\bfseries\large}{\thesection\quad}{0em}{}
\titleformat{\subsection}{\bfseries}{\thesubsection\quad}{0em}{}
\titleformat{\subsubsection}[runin]{\bfseries}{\thesubsubsection\quad}{0em}{}[.]
\titleformat{\paragraph}[runin]{\itshape}{}{0em}{}[.]

% Title and author block formatting
\RequirePackage{titling}
\pretitle{\vspace{5pt}\centering\fontsize{14pt}{16pt}\selectfont\bfseries}
\posttitle{\par\vspace{23pt}}
\preauthor{\centering\normalsize}
\postauthor{}
\predate{}
\postdate{}


% Custom abstract and keyword macros
\newcommand{\iLRNabstract}[1]{%
  \vspace{30pt}
  \begin{adjustwidth}{1cm}{1cm}
  \begin{spacing}{1}
  \textbf{Abstract.} #1
  \end{spacing}
  \end{adjustwidth}
}

\newcommand{\iLRNkeywords}[1]{%
  \vspace{1em}
  \begin{adjustwidth}{1cm}{1cm}
  \noindent\textbf{Keywords:} #1
  \end{adjustwidth}
}


% Disable page numbers
\AtBeginDocument{\pagestyle{empty}}

% Centered logo on first page
\AtBeginDocument{%
  \AddToShipoutPictureBG*{%
    \put(0,760){\makebox[\paperwidth]{\hfill\includegraphics[width=0.4\textwidth]{iLRN_header_logo.png}\hfill}}%
  }%
}