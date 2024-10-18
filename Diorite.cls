% a modified Berkeley Beamer class

% AUTHOR          Michael Teresi

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Diorite}[Modified Beamer Berkeley theme]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[aspectratio={169}]{beamer}


\RequirePackage{pgfpages}             % notes on different screen
\RequirePackage{multimedia}           % video using `\movie`
\RequirePackage{media9}               % video using `\includemedia`
\RequirePackage{graphicx}             % \includegraphics
\RequirePackage{appendixnumberbeamer} % count slide numbers after '\appendix' differently
\RequirePackage{mwe}                  % provides `example-image-a` et. al.
\RequirePackage{pgf}                  % graphics
\RequirePackage{tikz}                 % graphics, front end for PGF
\RequirePackage{wasysym}              % unicode
%\RequirePackage{animate}             % animation from image sequence, depends on PDF viewers
\RequirePackage[procnames]{listings}  % code blocks, use 'fragile' frame option
\RequirePackage{adjustbox}            % control vertical alignment

\usepackage{booktabs} % table formatting
\usepackage{animate}  % provides animagegraphics
\usepackage{xmpmulti} % provides multiinclude
\usepackage{float}    % prevent repositioning of tables (use H placement)
\restylefloat{table}
%\usepackage[backend=biber, bibencoding=utf8, style=ieee]{biblatex}
%\setbeamertemplate{bibliography item}{\insertbiblabel}
\usepackage{hyperref}
\usepackage[acronym,toc,shortcuts]{glossaries}

\usetikzlibrary{arrows.meta,automata,shadows,overlay-beamer-styles,positioning}

\usepackage[simplified]{pgf-umlcd}  % uml w/ pfg

\definecolor{michiganGreen}{RGB}{24, 69, 59}

\usecolortheme[named=michiganGreen]{structure}
\usefonttheme[onlymath]{serif}                       % math is math
%\PassOptionsToPackage{demo, draft}{graphicx}        % fake the images
%\setbeameroption{show notes}                        % make notes
%\setbeameroption{show notes on second screen=right} % notes during presentation
\beamertemplatenavigationsymbolsempty                % remove navigation buttons


\newcommand\insertlogowidth{}
\newcommand\logowidth[1]{\renewcommand\insertlogowidth{#1}}
\newcommand\insertlogoheight{}
\newcommand\logoheight[1]{\renewcommand\insertlogoheight{#1}}
\newcommand\insertlogoimage{}
\newcommand\logoimage[1]{\renewcommand\insertlogoimage{#1}}

\newcommand\insertauthoremail{}
\newcommand\authoremail[1]{\renewcommand\insertauthoremail{#1}}

\newcommand\insertauthorname{}
\newcommand\authorname[1]{\renewcommand\insertauthorname{#1}}

\newcommand\insertauthornamelink{\href{mailto:\insertauthoremail}{\insertauthorname}}

\newcommand\insertdistribution{}
\newcommand\distributionstatement[1]{\renewcommand\insertdistribution{#1}}


\graphicspath{{./img/}}     % `\includegraphics` search path(s)
%\day=01\relax
%\month=07\relax
%\year=2021\relax

\authoremail{author.email}               % \insertauthoremail
\authorname{author.name}                 % \insertauthorname

%\distributionstatement{Distribution D}   % e.g. 'Distrobution D'

\logowidth{0.13\paperwidth}             % value for logo width and sidebar
\logoheight{0.14\paperheight}           % value for logo height and sidebar
\logoimage{logo}                          % value for logo path


% STYLE % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
\newlength{\canvaswidth}                % value for page width minus side bar
\makeatletter
\setlength{\canvaswidth}{\paperwidth - \insertlogowidth}
\makeatother
\author{\insertauthornamelink}

\usetheme[hideothersubsections,width=\insertlogowidth]{Berkeley}

% NOTE if you want another theme remove the logo if appropriate
\makeatletter
\logo{%                               % logo in beamer title bar
	\includegraphics[width=\insertlogowidth, height=\insertlogoheight]{%
		\insertlogoimage%
	}%
}
\makeatletter
\beamer@headheight=\insertlogoheight
\makeatother



\setbeamerfont{frametitle}{size=\small}    % use frametitle as CUI marking
\setbeamerfont{framesubtitle}{size=\Large}  % framesubtitle is now the real title

\setbeamerfont{footline}{size=\scriptsize}
\setbeamercolor{section in head/foot}{bg=white, fg=black}

\setbeamerfont{section in sidebar}{size=\fontsize{9}{9}\selectfont}
\setbeamerfont{subsection in sidebar}{size=\fontsize{7}{7}\selectfont}
\setbeamerfont{author in sidebar}{size=\fontsize{8}{7}\selectfont}

\newcommand\CUI{\centerline{CUI}}

% extend sidebar over the footline
\setbeamertemplate{sidebar canvas left}{\usebeamercolor[bg]{section in sidebar}\rule{\insertlogowidth}{\paperheight}}


\makeatother
\setbeamertemplate{footline}
{
	\leavevmode%
	\hbox{%
		\hskip\insertlogowidth
		\begin{beamercolorbox}[wd=.33\canvaswidth=2.25ex,dp=1ex,center]{
				section in head/foot
		}%
		\insertdistribution
		\end{beamercolorbox}%

		\begin{beamercolorbox}[wd=.33\canvaswidth=2.25ex,dp=1ex,center]{
				section in head/foot
		}%
		CUI
		\end{beamercolorbox}%

		\begin{beamercolorbox}[wd=.23\canvaswidth,ht=2.25ex,dp=1ex,center]{
				section in head/foot
		}%
			\insertshortdate
		\end{beamercolorbox}%

		\begin{beamercolorbox}[wd=.11\canvaswidth,ht=2.25ex,dp=1ex,center]{
				section in head/foot
		}%
			\insertframenumber{} / \inserttotalframenumber
		\end{beamercolorbox}%
	}
\vskip0pt%
}
\makeatletter
