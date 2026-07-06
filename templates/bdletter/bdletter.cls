%% bdletter.cls
%% Bangladeshi Official Letter Class
%% Compatible with XeLaTeX and Tectonic
%%
%% Usage:
%%   \documentclass{bdletter}
%%   \LetterSetup{
%%     date        = {০১ জানুয়ারি ২০২৪ খ্রিঃ},
%%     recipient   = {জনাব আবদুল করিম},
%%     designation = {প্রধান শিক্ষক},
%%     organization= {ঢাকা সরকারি উচ্চ বিদ্যালয়},
%%     address     = {ঢাকা},
%%     subject     = {ছুটির জন্য আবেদন},
%%     name        = {মোঃ রহিম উদ্দিন},
%%     position    = {দশম শ্রেণি, রোল: ০৫},
%%   }
%%   \begin{document}
%%   \PrintLetterHeader   <-- must be first line inside \begin{document}
%%   বিনীত নিবেদন এই যে, ...
%%   \PrintLetterFooter   <-- must be last line inside \end{document}
%%   \end{document}

%% ============================================================
%% IDENTIFICATION
%% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bdletter}[2024/01/01 v0.1 Bangladeshi Official Letter Class]

%% ============================================================
%% BASE CLASS
%% ============================================================
\LoadClass[12pt, a4paper]{article}

%% ============================================================
%% REQUIRED PACKAGES
%% ============================================================
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\RequirePackage[
  a4paper,
  top    = 1in,
  bottom = 1in,
  left   = 1.25in,
  right  = 1in
]{geometry}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage{etoolbox}
\RequirePackage{keyval}

\pagestyle{empty}

%% ============================================================
%% LANGUAGE AND FONT SETUP
%% ============================================================
\setmainlanguage{bengali}
\setotherlanguage{english}

%% Noto Serif Bengali loaded from the bundled fonts/ folder.
%% No system installation required — works on any OS.
\newfontfamily\bengalifont[
  Path       = fonts/,
  Extension  = .ttf,
  BoldFont   = NotoSerifBengali-Bold,
  Script     = Bengali,
  Ligatures  = TeX
]{NotoSerifBengali-Regular}

\setmainfont[
  Path       = fonts/,
  Extension  = .ttf,
  BoldFont   = NotoSerifBengali-Bold,
  Script     = Bengali,
  Ligatures  = TeX
]{NotoSerifBengali-Regular}

%% ============================================================
%% PARAGRAPH AND SPACING DEFAULTS
%% ============================================================
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.6em}
\setstretch{1.4}

%% ============================================================
%% INTERNAL KEY STORAGE
%% ============================================================
\def\bd@date{}
\def\bd@recipient{}
\def\bd@designation{}
\def\bd@organization{}
\def\bd@address{}
\def\bd@through{}
\def\bd@subject{}
\def\bd@salutation{জনাব}
\def\bd@closing{বিনীত নিবেদক}
\def\bd@name{}
\def\bd@position{}
\def\bd@sender@org{}
\def\bd@contact{}

%% ============================================================
%% KEY DEFINITIONS FOR \LetterSetup
%% ============================================================
\define@key{bdletter}{date}        {\def\bd@date{#1}}
\define@key{bdletter}{recipient}   {\def\bd@recipient{#1}}
\define@key{bdletter}{designation} {\def\bd@designation{#1}}
\define@key{bdletter}{organization}{\def\bd@organization{#1}}
\define@key{bdletter}{address}     {\def\bd@address{#1}}
\define@key{bdletter}{through}     {\def\bd@through{#1}}
\define@key{bdletter}{subject}     {\def\bd@subject{#1}}
\define@key{bdletter}{salutation}  {\def\bd@salutation{#1}}
\define@key{bdletter}{closing}     {\def\bd@closing{#1}}
\define@key{bdletter}{name}        {\def\bd@name{#1}}
\define@key{bdletter}{position}    {\def\bd@position{#1}}
\define@key{bdletter}{sender_org}  {\def\bd@sender@org{#1}}
\define@key{bdletter}{contact}     {\def\bd@contact{#1}}

%% ============================================================
%% \LetterSetup — public command (call BEFORE \begin{document})
%% ============================================================
\newcommand{\LetterSetup}[1]{%
  \setkeys{bdletter}{#1}%
}

%% ============================================================
%% HELPER: print content only if macro is non-empty
%% ============================================================
\newcommand{\bd@ifnonempty}[2]{%
  \ifdefempty{#1}{}{#2}%
}

%% ============================================================
%% \PrintLetterHeader
%% Call as the FIRST command inside \begin{document}
%% This ensures \LetterSetup values are already populated.
%% ============================================================
\newcommand{\PrintLetterHeader}{%
  %% --- Date ------------------------------------------------
  \bd@ifnonempty{\bd@date}{%
    তারিখ: \bd@date\par
  }%
  \vspace{0.9em}

  %% --- Recipient block (বরাবর) ---
  %% Temporarily zero parskip for tight address-block spacing
  {%
    \setlength{\parskip}{0pt}%
    বরাবর,\par
    \bd@ifnonempty{\bd@recipient}{\bd@recipient\par}%
    \bd@ifnonempty{\bd@designation}{\bd@designation\par}%
    \bd@ifnonempty{\bd@organization}{\bd@organization\par}%
    \bd@ifnonempty{\bd@address}{\bd@address\par}%
  }%
  \vspace{0.9em}

  %% --- Through line (মাধ্যম) — only printed if set --------
  \bd@ifnonempty{\bd@through}{%
    মাধ্যম: \bd@through\par
    \vspace{0.9em}
  }%

  %% --- Subject (বিষয়) -------------------------------------
  \bd@ifnonempty{\bd@subject}{%
    \textbf{বিষয়: \bd@subject।}\par
  }%
  \vspace{0.9em}

  %% --- Salutation ------------------------------------------
  \bd@salutation,\par
  \vspace{0.3em}
}

%% ============================================================
%% \PrintLetterFooter
%% Call as the LAST command before \end{document}
%% Signature block uses tight spacing like the recipient block.
%% ============================================================
\newcommand{\PrintLetterFooter}{%
  \vspace{1.2em}
  {%
    \setlength{\parskip}{0pt}%
    \bd@closing,\par
    \vspace{0.4em}
    \bd@ifnonempty{\bd@name}{\bd@name\par}%
    \bd@ifnonempty{\bd@position}{\bd@position\par}%
    \bd@ifnonempty{\bd@sender@org}{\bd@sender@org\par}%
    \bd@ifnonempty{\bd@contact}{\bd@contact\par}%
  }%
}

%% ============================================================
%% END OF CLASS
%% ============================================================
\endinput