%%
%
% ARQUIVO: pfc.cls
%
% VERSÃO: 1.0
% DATA: Maio de 2016
% AUTOR: Coordenação de Trabalhos Especiais SE/8
% 
%  Arquivo cls (classe de documento) com a formatação principal do documento de PFC.
%
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{pfc}


% -----
% OPÇÕES DA CLASSE DO DOCUMENTO
% -----
\newif\if@titlepage
\@titlepagetrue
\newif\if@append
\@appendfalse
\newif\if@appendformat
\@appendformatfalse
\newif\if@annexformat
\@annexformatfalse
\newif\if@abrevia
\@abreviafalse
\newif\if@simbo
\@simbofalse

% -----
% TIPOS DE PAPEL
% -----
\DeclareOption{a4paper}        {\setlength\paperheight{297mm} \setlength\paperwidth{210mm}}
\DeclareOption{a5paper}        {\setlength\paperheight{210mm} \setlength\paperwidth{148mm}}
\DeclareOption{b5paper}        {\setlength\paperheight{250mm} \setlength\paperwidth{176mm}}
\DeclareOption{letterpaper}    {\setlength\paperheight{11in} \setlength\paperwidth{8.5in}}
\DeclareOption{legalpaper}     {\setlength\paperheight{14in} \setlength\paperwidth{8.5in}}
\DeclareOption{executivepaper} {\setlength\paperheight{10.5in} \setlength\paperwidth{7.25in}}
\DeclareOption{landscape}      {\setlength\@tempdima{\paperheight} \setlength\paperheight{\paperwidth} \setlength\paperwidth{\@tempdima}}
\DeclareOption{titlepage}	   {\@titlepagetrue}

% -----
% TAMANHO DE FONTE
% -----
\newcommand\@ptsize{}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

% -----
% NÚMERO DE COLUNAS
% -----
\newif\if@restonecol
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}

% -----
% TIPO DE IMPRESSÃO
% -----
\newif\if@openright
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}

% -----
% APRESENTAÇÃO DE EQUAÇÕES
% -----
\DeclareOption{leqno}{\input{leqno.clo}} % Posicionar a numeração das equações à esquerda
\DeclareOption{fleqn}{\input{fleqn.clo}} % Posicionar as equações a uma indentação fixa da margem esquerda

% -----
% ESTILO DO DOCUMENTO
% -----
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}

% -----
% OPÇÕES PADRÃO DO DOCUMENTO
% -----
\ExecuteOptions{a4paper,12pt,oneside,titlepage,onecolumn,final,openany}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

% -----
% ESTILO DAS PÁGINAS
% -----
\if@twoside
    \def\ps@headings{%
        \let\@oddfoot\@empty\let\@evenfoot\@empty
        \def\@evenhead{\thepage\hfil\slshape\leftmark}%
        \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
        \let\@mkboth\markboth
        \def\chaptermark##1{%
            \markboth {\MakeUppercase{%
            \ifnum \c@secnumdepth >\m@ne \@chapapp\ \thechapter. \ \fi
            ##1}}{}}%
        \def\sectionmark##1{%
            \markright {\MakeUppercase{%
            \ifnum \c@secnumdepth >\z@ \thesection. \ \fi
        ##1}}}}
\else
    \def\ps@headings{%
        \let\@oddfoot\@empty
        \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
        \let\@mkboth\markboth
        \def\chaptermark##1{%
            \markright {\MakeUppercase{%
            \ifnum \c@secnumdepth >\m@ne \@chapapp\ \thechapter. \ \fi
            ##1}}}}
\fi

\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble}
\def\ssp{\def\baselinestretch{1.0}\large\normalsize}
\def\dsp{\def\baselinestretch{1.37}\large\normalsize}


% -----
% ELEMENTOS DO TEXTO (CAPÍTULO, SEÇÃO, SUBSEÇÃO, ETC.)
% -----
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{3}

\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

\renewcommand\thepart {\@Roman\c@part}
\renewcommand\thechapter {\@arabic\c@chapter}
\renewcommand\thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}

\newcommand\nomecapitulo{CAP{\'I}TULO}
\newcommand\@chapapp{\nomecapitulo}

\newcommand\part{
	\if@openright \cleardoublepage \else \clearpage \fi
	\thispagestyle{plain}
	\if@twocolumn \onecolumn \@tempswatrue \else \@tempswafalse \fi
	\null\vfil
	\secdef\@part\@spart}

\def\@part[#1]#2{
	\ifnum \c@secnumdepth >-2\relax
		\refstepcounter{part}%
		\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
	\else
		\addcontentsline{toc}{part}{#1}%
	\fi
	\markboth{}{} {
		\centering
		\interlinepenalty \@M
		\normalfont
		\ifnum \c@secnumdepth >-2\relax
			\huge\bfseries \nomeparte~\thepart
			\par
			\vskip 20\p@
		\fi
		\Huge \bfseries #2\par}
	\@endpart}

\def\@spart#1{
    {  \centering
	   \interlinepenalty \@M
       \normalfont
       \Huge \bfseries #1\par}
    \@endpart}

\def\@endpart{
	\vfil\newpage
	\if@twoside
		\null
		\thispagestyle{empty}%
		\newpage
	\fi
	\if@tempswa
		\twocolumn
	\fi}

\newcommand\chapter{
    \if@openright \cleardoublepage \else \clearpage \fi
    \thispagestyle{plain}%
    \global\@topnum\z@
    \@afterindenttrue
    \dsp
    \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{
    \ifnum \c@secnumdepth >\m@ne
        \if@append \refstepcounter{section} \else \refstepcounter{chapter} \fi%
        \typeout{\@chapapp\space\thechapter.}%
        {
            \def\\{ }%
            \if@append
                \addcontentsline{toc}{section}{\protect\numberline{\thesection\ }\uppercase{\@chapapp \space \@arabic\c@section}:\space#1}
            \else
                \if@appendformat
                    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter\ }\textbf\nomeindiceapendice}
                \else
                    \if@annexformat
                        \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter\ }\textbf\nomeindiceanexo}
                    \else
                        \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter\ }\bf#1}
                    \fi
                \fi
            \fi
        }%
    \else
        {
            \def\\{ }  % allow \\ in title
            \addcontentsline{toc}{chapter}{#1}
        }%
    \fi
    \chaptermark{#1}%
    \addtocontents{lof}{\protect\addvspace{10\p@}}%
    \addtocontents{lot}{\protect\addvspace{10\p@}}%
    \if@twocolumn \@topnewpage[\@makechapterhead{#2}] \else \@makechapterhead{#2} \@afterheading \fi}

\def\@makechapterhead#1{%
    {
        \parindent \z@ \raggedright \normalfont
        \interlinepenalty\@M
        \if@append 
%            \thesection \space \@chapapp \space \@arabic\c@section: \space \MakeUppercase{#1} \par \nobreak% 
            \@chapapp \space \@arabic\c@section: \space \MakeUppercase{#1} \par \nobreak% 
        \else 
            \bfseries \thechapter \space \MakeUppercase{#1} \par \nobreak%
        \fi
            \vskip 3\baselineskip
        \dsp
    }}

\def\@schapter#1{
	\if@twocolumn
		\@topnewpage[\@makeschapterhead{#1}]%
	\else
		\@makeschapterhead{#1}%
		\@afterheading
	\fi}

\def\@makeschapterhead#1{
	\parindent \z@ 
	\normalfont
	\hbox to\textwidth{\bfseries \hfill
	\MakeUppercase{#1}\hfill}
	\nobreak
	\vskip 20\p@
	\dsp}

\newcommand\section{
    \@startsection {section}{1}{\z@}
        {-3.5ex \@plus -1ex \@minus -.2ex}
        {2.3ex \@plus.2ex}
        {\normalfont\MakeUppercase}}

\newcommand\subsection{
    \@startsection{subsection}{2}{\z@}
    {-3.25ex\@plus -1ex \@minus -.2ex}
    {1.5ex \@plus .2ex}
    {\normalfont\MakeUppercase}}

\newcommand\subsubsection{
    \@startsection{subsubsection}{3}{\z@}
    {-3.25ex\@plus -1ex \@minus -.2ex}
    {1.5ex \@plus .2ex}
    {\normalfont\normalsize\MakeUppercase}}

\newcommand\paragraph{
    \@startsection{paragraph}{4}{\z@}
    {3.25ex \@plus1ex \@minus.2ex}
    {-1em}
    {\normalfont\normalsize}}

\newcommand\subparagraph{
    \@startsection{subparagraph}{5}{\parindent}
    {3.25ex \@plus1ex \@minus .2ex}
    {-1em}%
    {\normalfont\normalsize}}


% -----
% DEFINIÇÕES DE LISTAS
% -----
\if@twocolumn \setlength\leftmargini  {2em} \else \setlength\leftmargini  {2.5em} \fi

\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}

\if@twocolumn \setlength\leftmarginv  {.5em} \setlength\leftmarginvi {.5em} \else \setlength\leftmarginv  {1em} \setlength\leftmarginvi {1em} \fi

\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand{\labelenumi}{\alph{enumi})}
\newcommand\labelenumii{\arabic{enumii})}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}

\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\newenvironment{description}
    {\list{}{
        \labelwidth\z@ \itemindent-\leftmargin
        \let\makelabel\descriptionlabel}}
    {\endlist}

\newcommand*\descriptionlabel[1]{\hspace\labelsep \normalfont\bfseries #1}


% -----
% DEFINIÇÕES DE CITAÇÕES LONGAS
% -----
\newenvironment{verse}
    {\let\\\@centercr
     \list{}{
        \itemsep      \z@
        \itemindent   -1.5em%
        \listparindent\itemindent
        \rightmargin  \leftmargin
        \advance\leftmargin 1.5em}%
     \item\relax}
    {\endlist}

\newenvironment{quotation}
    {\list{}{
        \listparindent 1.5em%
        \itemindent    \listparindent
        \rightmargin   \leftmargin
        \parsep        \z@ \@plus\p@}%
     \item\relax}
    {\endlist}

\newenvironment{quote}
    {\list{}{\rightmargin\leftmargin} \item\relax}
    {\endlist}


% -----
% DEFINIÇÕES DE TIPOS DE TEOREMAS
% -----
\newcounter{teorema}[chapter]
\newenvironment{thm}[1][]{\refstepcounter{teorema}\par\medskip
   \textbf{Teorema~\theteorema. #1} \rmfamily\itshape}

\newcounter{problema}[chapter]
\newenvironment{probl}[1][]{\refstepcounter{problema}\par\medskip
   \textbf{Problema~\theproblema. #1} \rmfamily\itshape}

\newcounter{questao}[chapter]
\newenvironment{qpesq}[1][]{\refstepcounter{questao}\par\medskip
   \textbf{Quest\~{a}o de Pesquisa~\thequestao. #1} \rmfamily\itshape}

\newcounter{hipotese}[chapter]
\newenvironment{hipo}[1][]{\refstepcounter{hipotese}\par\medskip
   \textbf{Hip\'{o}tese~\thehipotese. #1} \rmfamily\itshape}

\newcounter{proposicao}[chapter]
\newenvironment{prop}[1][]{\refstepcounter{proposicao}\par\medskip
   \textbf{Proposi\c{c}\~{a}o~\theproposicao. #1} \rmfamily}

\newcounter{definicao}[chapter]
\newenvironment{defn}[1][]{\refstepcounter{definicao}\par\medskip
   \textbf{Defini\c{c}\~{a}o~\thedefinicao. #1} \rmfamily\itshape}

\newcounter{exemplo}[chapter]
\newenvironment{exmp}[1][]{\refstepcounter{exemplo}\par\medskip
   \textbf{Exemplo~\theexemplo. #1} \rmfamily}

\newcounter{nota}[chapter]
\newenvironment{nota}[1][]{\refstepcounter{nota}\par\medskip
   \textbf{Nota~\thenota. #1} \rmfamily}


% -----
% NUMERAÇÃO DAS EQUAÇÕES POR CAPÍTULO
% -----
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}


% -----
% DEFINIÇÕES DE FIGURAS E TABELAS
% -----
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\newcommand\nomefigura{FIG.}
\newcommand\nometabela{TAB.}

\newcounter{figure}[chapter]
\renewcommand \thefigure {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\nomefigura~\thefigure}
\newenvironment{figure}
    {\ssp\@float{figure}}
    {\end@float\dsp}
\newenvironment{figure*}
    {\ssp\@dblfloat{figure}}
    {\end@dblfloat\dsp}

\newcounter{table}[chapter]
\renewcommand \thetable {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\nometabela~\thetable}
\newenvironment{table}
    {\ssp\@float{table}}
    {\end@float\dsp}
\newenvironment{table*}
    {\ssp\@dblfloat{table}}
    {\end@dblfloat\dsp}

% -----
% DEFINIÇÕES DE RÓTULOS DE FIGURAS E TABELAS
% -----
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}

\long\def\@makecaption#1#2{
    \vskip\abovecaptionskip
    \sbox\@tempboxa{#1: #2}
    \ifdim \wd\@tempboxa >\hsize
        #1: #2\par
    \else
        \global \@minipagefalse
        \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
    \vskip\belowcaptionskip}


% -----
% DEFINIÇÕES DE TYPEFACE
% -----
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


% -----
% DADOS DO PFC
% -----
\def\autorI#1{\gdef\@autorI{#1}}
\def\autorII#1{\gdef\@autorII{#1}}
\def\autorIII#1{\gdef\@autorIII{#1}}

\def\postoautorI#1{\gdef\@postoautorI{#1}}
\def\postoautorII#1{\gdef\@postoautorII{#1}}
\def\postoautorIII#1{\gdef\@postoautorIII{#1}}

\def\titulo#1{\gdef\@titulo{#1}}

\def\datadefesa#1#2#3{\gdef\@dia{#1} \gdef\@mes{#2} \gdef\@ano{#3}}

\def\orientador#1#2#3#4{\gdef\@introrientador{#1} \gdef\@orientador{#2} \gdef\@titorientador{#3} \gdef\@localorientador{#4}}
\def\coorientador#1#2#3#4{\gdef\@intrcoorientador{#1} \gdef\@coorientador{#2} \gdef\@titcoorientador{#3} \gdef\@localcoorientador{#4}}

\gdef\@orientadorStr{} \gdef\@orientadorLocalStr{}
\gdef\@coorientadorStr{} \gdef\@coorientadorLocalStr{}

\def\biblioref#1#2{\gdef\@bibliorefA{#1} \gdef\@bibliorefB{#2}}

\def\palavraschaves#1{\gdef\@palavraschaves{#1}}

\def\membrobancaI#1#2#3#4{\gdef\@intrmembrobancaI{#1} \gdef\@membrobancaI{#2} \gdef\@titmembrobancaI{#3} \gdef\@localmembrobancaI{#4}}
\def\membrobancaII#1#2#3#4{\gdef\@intrmembrobancaII{#1} \gdef\@membrobancaII{#2} \gdef\@titmembrobancaII{#3} \gdef\@localmembrobancaII{#4}}
\def\membrobancaIII#1#2#3#4{\gdef\@intrmembrobancaIII{#1} \gdef\@membrobancaIII{#2} \gdef\@titmembrobancaIII{#3} \gdef\@localmembrobancaIII{#4}}
\def\membrobancaIV#1#2#3#4{\gdef\@intrmembrobancaIV{#1} \gdef\@membrobancaIV{#2} \gdef\@titmembrobancaIV{#3} \gdef\@localmembrobancaIV{#4}}
\def\membrobancaV#1#2#3#4{\gdef\@intrmembrobancaV{#1} \gdef\@membrobancaV{#2} \gdef\@titmembrobancaV{#3} \gdef\@localmembrobancaV{#4}}

\gdef\@membroIstr{} \gdef\@membroIIstr{} \gdef\@membroIIIstr{} \gdef\@membroIVstr{} \gdef\@membroVstr{}

% -----
% COMANDOS AUXILIARES
% -----
\newcommand\prepareadvisors{
    \ifnum\pdfstrcmp{\@introrientador}{P}=0\edef\@orientadorStr{\@orientadorStr {Prof. }}
    \else\ifnum\pdfstrcmp{\@introrientador}{PA}=0\edef\@orientadorStr{\@orientadorStr {Prof$^a$. }}
    \else\ifnum\pdfstrcmp{\@introrientador}{}=0\else\edef\@orientadorStr{\@orientadorStr {\@introrientador~}}\fi\fi\fi

    \edef\@orientadorStr{\@orientadorStr {\@orientador~}}

    \ifnum\pdfstrcmp{\@titorientador}{P}=0\edef\@orientadorStr{\@orientadorStr {- Ph.D. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{D}=0\edef\@orientadorStr{\@orientadorStr {- D.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{DC}=0\edef\@orientadorStr{\@orientadorStr {- D.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{D.C.}=0\edef\@orientadorStr{\@orientadorStr {- D.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{D.C}=0\edef\@orientadorStr{\@orientadorStr {- D.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{DC.}=0\edef\@orientadorStr{\@orientadorStr {- D.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{M}=0\edef\@orientadorStr{\@orientadorStr {- M.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{MC}=0\edef\@orientadorStr{\@orientadorStr {- M.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{M.C.}=0\edef\@orientadorStr{\@orientadorStr {- M.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{M.C}=0\edef\@orientadorStr{\@orientadorStr {- M.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{MC.}=0\edef\@orientadorStr{\@orientadorStr {- M.Sc. }}
    \else\ifnum\pdfstrcmp{\@titorientador}{}=0\else\edef\@orientadorStr{\@orientadorStr {-~\@titorientador~}}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi

    \edef\@orientadorLocalStr{\@orientadorLocalStr \@orientadorStr}
    \edef\@orientadorLocalStr{\@orientadorLocalStr \@localorientador}

	\ifdefined \@coorientador
        \ifnum\pdfstrcmp{\@intrcoorientador}{P}=0\edef\@coorientadorStr{\@coorientadorStr {Prof. }}
        \else\ifnum\pdfstrcmp{\@intrcoorientador}{PA}=0\edef\@coorientadorStr{\@coorientadorStr {Prof$^a$. }}
        \else\ifnum\pdfstrcmp{\@intrcoorientador}{}=0\else\edef\@coorientadorStr{\@coorientadorStr {\@intrcoorientador~}}\fi\fi\fi
    
        \edef\@coorientadorStr{\@coorientadorStr {\@coorientador~}}
    
        \ifnum\pdfstrcmp{\@titcoorientador}{P}=0\edef\@coorientadorStr{\@coorientadorStr {- Ph.D. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{D}=0\edef\@coorientadorStr{\@coorientadorStr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{DC}=0\edef\@coorientadorStr{\@coorientadorStr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{D.C.}=0\edef\@coorientadorStr{\@coorientadorStr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{D.C}=0\edef\@coorientadorStr{\@coorientadorStr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{DC.}=0\edef\@coorientadorStr{\@coorientadorStr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{M}=0\edef\@coorientadorStr{\@coorientadorStr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{MC}=0\edef\@coorientadorStr{\@coorientadorStr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{M.C.}=0\edef\@coorientadorStr{\@coorientadorStr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{M.C}=0\edef\@coorientadorStr{\@coorientadorStr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{MC.}=0\edef\@coorientadorStr{\@coorientadorStr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titcoorientador}{}=0\else\edef\@coorientadorStr{\@coorientadorStr {-~\@titcoorientador~}}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi

        \edef\@coorientadorLocalStr{\@coorientadorLocalStr \@coorientadorStr}
        \edef\@coorientadorLocalStr{\@coorientadorLocalStr \@localcoorientador}
    \fi
}

\newcounter{numMembros}
\newcommand\preparemembers{
    \ifdefined \@membrobancaI
        \refstepcounter{numMembros}
        \ifnum\pdfstrcmp{\@intrmembrobancaI}{P}=0\edef\@membroIstr{\@membroIstr {Prof. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaI}{PA}=0\edef\@membroIstr{\@membroIstr {Prof$^a$. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaI}{}=0\else\edef\@membroIstr{\@membroIstr {\@intrmembrobancaI~}}\fi\fi\fi
        \edef\@membroIstr{\@membroIstr {\@membrobancaI~}}
        \ifnum\pdfstrcmp{\@titmembrobancaI}{P}=0\edef\@membroIstr{\@membroIstr {- Ph.D. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{D}=0\edef\@membroIstr{\@membroIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{DC}=0\edef\@membroIstr{\@membroIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{D.C.}=0\edef\@membroIstr{\@membroIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{D.C}=0\edef\@membroIstr{\@membroIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{DC.}=0\edef\@membroIstr{\@membroIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{M}=0\edef\@membroIstr{\@membroIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{MC}=0\edef\@membroIstr{\@membroIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{M.C.}=0\edef\@membroIstr{\@membroIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{M.C}=0\edef\@membroIstr{\@membroIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{MC.}=0\edef\@membroIstr{\@membroIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaI}{}=0\else\edef\@membroIstr{\@membroIstr {-~\@titmembrobancaI~}}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
        \edef\@membroIstr{\@membroIstr \@localmembrobancaI}
    \fi
    \ifdefined \@membrobancaII
        \refstepcounter{numMembros}
        \ifnum\pdfstrcmp{\@intrmembrobancaII}{P}=0\edef\@membroIIstr{\@membroIIstr {Prof. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaII}{PA}=0\edef\@membroIIstr{\@membroIIstr {Prof$^a$. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaII}{}=0\else\edef\@membroIIstr{\@membroIIstr {\@intrmembrobancaII~}}\fi\fi\fi
        \edef\@membroIIstr{\@membroIIstr {\@membrobancaII~}}
        \ifnum\pdfstrcmp{\@titmembrobancaII}{P}=0\edef\@membroIIstr{\@membroIIstr {- Ph.D. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{D}=0\edef\@membroIIstr{\@membroIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{DC}=0\edef\@membroIIstr{\@membroIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{D.C.}=0\edef\@membroIIstr{\@membroIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{D.C}=0\edef\@membroIIstr{\@membroIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{DC.}=0\edef\@membroIIstr{\@membroIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{M}=0\edef\@membroIIstr{\@membroIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{MC}=0\edef\@membroIIstr{\@membroIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{M.C.}=0\edef\@membroIIstr{\@membroIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{M.C}=0\edef\@membroIIstr{\@membroIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{MC.}=0\edef\@membroIIstr{\@membroIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaII}{}=0\else\edef\@membroIIstr{\@membroIIstr {-~\@titmembrobancaII~}}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
        \edef\@membroIIstr{\@membroIIstr \@localmembrobancaII}
    \fi
    \ifdefined \@membrobancaIII
        \refstepcounter{numMembros}
        \ifnum\pdfstrcmp{\@intrmembrobancaIII}{P}=0\edef\@membroIIIstr{\@membroIIIstr {Prof. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaIII}{PA}=0\edef\@membroIIIstr{\@membroIIIstr {Prof$^a$. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaIII}{}=0\else\edef\@membroIIIstr{\@membroIIIstr {\@intrmembrobancaIII~}}\fi\fi\fi
        \edef\@membroIIIstr{\@membroIIIstr {\@membrobancaIII~}}
        \ifnum\pdfstrcmp{\@titmembrobancaIII}{P}=0\edef\@membroIIIstr{\@membroIIIstr {- Ph.D. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{D}=0\edef\@membroIIIstr{\@membroIIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{DC}=0\edef\@membroIIIstr{\@membroIIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{D.C.}=0\edef\@membroIIIstr{\@membroIIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{D.C}=0\edef\@membroIIIstr{\@membroIIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{DC.}=0\edef\@membroIIIstr{\@membroIIIstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{M}=0\edef\@membroIIIstr{\@membroIIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{MC}=0\edef\@membroIIIstr{\@membroIIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{M.C.}=0\edef\@membroIIIstr{\@membroIIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{M.C}=0\edef\@membroIIIstr{\@membroIIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{MC.}=0\edef\@membroIIIstr{\@membroIIIstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIII}{}=0\else\edef\@membroIIIstr{\@membroIIIstr {-~\@titmembrobancaIII~}}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
        \edef\@membroIIIstr{\@membroIIIstr \@localmembrobancaIII}
    \fi
    \ifdefined \@membrobancaIV
        \refstepcounter{numMembros}
        \ifnum\pdfstrcmp{\@intrmembrobancaIV}{P}=0\edef\@membroIVstr{\@membroIVstr {Prof. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaIV}{PA}=0\edef\@membroIVstr{\@membroIVstr {Prof$^a$. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaIV}{}=0\else\edef\@membroIVstr{\@membroIVstr {\@intrmembrobancaIV~}}\fi\fi\fi
        \edef\@membroIVstr{\@membroIVstr {\@membrobancaIV~}}
        \ifnum\pdfstrcmp{\@titmembrobancaIV}{P}=0\edef\@membroIVstr{\@membroIVstr {- Ph.D. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{D}=0\edef\@membroIVstr{\@membroIVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{DC}=0\edef\@membroIVstr{\@membroIVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{D.C.}=0\edef\@membroIVstr{\@membroIVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{D.C}=0\edef\@membroIVstr{\@membroIVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{DC.}=0\edef\@membroIVstr{\@membroIVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{M}=0\edef\@membroIVstr{\@membroIVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{MC}=0\edef\@membroIVstr{\@membroIVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{M.C.}=0\edef\@membroIVstr{\@membroIVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{M.C}=0\edef\@membroIVstr{\@membroIVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{MC.}=0\edef\@membroIVstr{\@membroIVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaIV}{}=0\else\edef\@membroIVstr{\@membroIVstr {-~\@titmembrobancaIV~}}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
        \edef\@membroIVstr{\@membroIVstr \@localmembrobancaIV}
    \fi
    \ifdefined \@membrobancaV
        \refstepcounter{numMembros}
        \ifnum\pdfstrcmp{\@intrmembrobancaV}{P}=0\edef\@membroVstr{\@membroVstr {Prof. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaV}{PA}=0\edef\@membroVstr{\@membroVstr {Prof$^a$. }}
        \else\ifnum\pdfstrcmp{\@intrmembrobancaV}{}=0\else\edef\@membroVstr{\@membroVstr {\@intrmembrobancaV~}}\fi\fi\fi
        \edef\@membroVstr{\@membroVstr {\@membrobancaV~}}
        \ifnum\pdfstrcmp{\@titmembrobancaV}{P}=0\edef\@membroVstr{\@membroVstr {- Ph.D. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{D}=0\edef\@membroVstr{\@membroVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{DC}=0\edef\@membroVstr{\@membroVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{D.C.}=0\edef\@membroVstr{\@membroVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{D.C}=0\edef\@membroVstr{\@membroVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{DC.}=0\edef\@membroVstr{\@membroVstr {- D.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{M}=0\edef\@membroVstr{\@membroVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{MC}=0\edef\@membroVstr{\@membroVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{M.C.}=0\edef\@membroVstr{\@membroVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{M.C}=0\edef\@membroVstr{\@membroVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{MC.}=0\edef\@membroVstr{\@membroVstr {- M.Sc. }}
        \else\ifnum\pdfstrcmp{\@titmembrobancaV}{}=0\else\edef\@membroVstr{\@membroVstr {-~\@titmembrobancaV~}}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
        \edef\@membroVstr{\@membroVstr \@localmembrobancaV}
    \fi
}

\gdef\@rotuloOrientador{Orientador}
\newcommand{\montaRotuloOrientador}[1] {
    \ifnum\pdfstrcmp{#1}{PA}=0\gdef\@rotuloOrientador{Orientadora}\fi
}

\gdef\@rotuloCoOrientador{Orientador}
\newcommand{\montaRotuloCoOrientador}[1] {
    \ifnum\pdfstrcmp{#1}{PA}=0\gdef\@rotuloCoOrientador{Orientadora}\fi
}

\gdef\@nauI{0}
\gdef\@nauII{0}
\gdef\@nauIII{0}
\gdef\@nor{0}
\gdef\@nco{0}
\newcommand{\testaNomes}[4] {
    \def\testaultimo {
        \ifnum \pdf@strcmp{#3}{FILHO}=0 1 
        \else\ifnum \pdf@strcmp{#3}{JUNIOR}=0 1
        \else\ifnum \pdf@strcmp{#3}{JR}=0 1
        \else\ifnum \pdf@strcmp{#3}{JR.}=0 1 
        \else\ifnum \pdf@strcmp{#3}{SEGUNDO}=0 1
        \else\ifnum \pdf@strcmp{#3}{NETO}=0 1 \else 0 \fi\fi\fi\fi\fi\fi}
    
    \def\testapenultimo {
        \ifnum \pdf@strcmp{#2}{DA}=0 1 
        \else\ifnum \pdf@strcmp{#2}{DE}=0 1
        \else\ifnum \pdf@strcmp{#2}{DI}=0 1
        \else\ifnum \pdf@strcmp{#2}{DO}=0 1 
        \else\ifnum \pdf@strcmp{#2}{DAS}=0 1
        \else\ifnum \pdf@strcmp{#2}{DOS}=0 1 \else 0 \fi\fi\fi\fi\fi\fi}

    \def\testaantepenultimo {
        \ifnum \pdf@strcmp{#1}{DA}=0 1 
        \else\ifnum \pdf@strcmp{#1}{DE}=0 1
        \else\ifnum \pdf@strcmp{#1}{DI}=0 1
        \else\ifnum \pdf@strcmp{#1}{DO}=0 1 
        \else\ifnum \pdf@strcmp{#1}{DAS}=0 1
        \else\ifnum \pdf@strcmp{#1}{DOS}=0 1 \else 0 \fi\fi\fi\fi\fi\fi}

    \def\qttotal {
        \ifnum\testaultimo=1 \ifnum\testaantepenultimo=1 3 \else 2 \fi
        \else \ifnum\testapenultimo=1 2 \else 0 \fi\fi}

    \ifnum#4=1 \edef\@nau{\qttotal} \fi
    \ifnum#4=2 \edef\@nor{\qttotal} \fi
    \ifnum#4=3 \edef\@nco{\qttotal} \fi
}

\newcommand{\premonta}[2] {
    \solelyuppercase[e]{#1}
    \getargs[e]{\thestring}
    \ifnum \narg = 8 \testaNomes{\argvi}{\argvii}{\argviii}{#2} \fi
    \ifnum \narg = 7 \testaNomes{\argv}{\argvi}{\argvii}{#2} \fi
    \ifnum \narg = 6 \testaNomes{\argiv}{\argv}{\argvi}{#2} \fi
    \ifnum \narg = 5 \testaNomes{\argiii}{\argiv}{\argv}{#2} \fi
    \ifnum \narg = 4 \testaNomes{\argii}{\argiii}{\argiv}{#2} \fi
    \ifnum \narg = 3 \testaNomes{\argi}{\argii}{\argiii}{#2} \fi
}

\gdef\@ctrlnomes{0}
\newcommand{\montaNome}[2] {
    \ifnum#2=1 \edef\@ctrlnomes{\@nauI} \fi
    \ifnum#2=2 \edef\@ctrlnomes{\@nauII} \fi
    \ifnum#2=3 \edef\@ctrlnomes{\@nauIII} \fi
    \ifnum#2=4 \edef\@ctrlnomes{\@nor} \fi
    \ifnum#2=5 \edef\@ctrlnomes{\@nco} \fi
    \getargs[e]{#1}
    \ifnum \narg = 8
        \ifnum\@ctrlnomes=3 \retokenize[v]{\argvi~\argvii~\argviii, \argi~\argii~\argiii~\argiv~\argv}
        \else \ifnum\@ctrlnomes=2 \retokenize[v]{\argvii~\argviii, \argi~\argii~\argiii~\argiv~\argv~\argvi}
        \else \retokenize[v]{\argviii, \argi~\argii~\argiii~\argiv~\argv~\argvi~\argvii} \fi\fi
    \fi
    \ifnum \narg = 7
        \ifnum\@ctrlnomes=3 \retokenize[v]{\argv~\argvi~\argvii, \argi~\argii~\argiii~\argiv}
        \else \ifnum\@ctrlnomes=2 \retokenize[v]{\argvi~\argvii, \argi~\argii~\argiii~\argiv~\argv}
        \else \retokenize[v]{\argvii, \argi~\argii~\argiii~\argiv~\argv~\argvi} \fi\fi
    \fi
    \ifnum \narg = 6
        \ifnum\@ctrlnomes=3 \retokenize[v]{\argiv~\argv~\argvi, \argi~\argii~\argiii}
        \else \retokenize[v]{\ifnum\@ctrlnomes=2 \argv~\argvi, \argi~\argii~\argiii~\argiv}
        \else \retokenize[v]{\argvi, \argi~\argii~\argiii~\argiv~\argv~\argv} \fi\fi
    \fi
    \ifnum \narg = 5
        \ifnum\@ctrlnomes=3 \retokenize[v]{\argiii~\argiv~\argv, \argi~\argii}
        \else \ifnum\@ctrlnomes=2 \retokenize[v]{\argiv~\argv, \argi~\argii~\argiii}
        \else \retokenize[v]{\argv, \argi~\argii~\argiii~\argiv} \fi\fi
    \fi
    \ifnum \narg = 4
        \ifnum\@ctrlnomes=3 \retokenize[v]{\argii~\argiii~\argiv, \argi}
        \else \ifnum\@ctrlnomes=2 \retokenize[v]{\argiii~\argiv, \argi~\argii}
        \else \retokenize[v]{\argiv, \argi~\argii~\argiii} \fi\fi
    \fi
    \ifnum \narg = 3
        \ifnum\@ctrlnomes=2 \retokenize[v]{\argii~\argiii, \argi}
        \else \retokenize[v]{\argiii, \argi~\argii}\fi
    \fi
    \ifnum \narg = 2
        \retokenize[v]{\argii, \argi}
    \fi
    \ifnum \narg = 1
        \retokenize[v]{\argi}
    \fi
}
 

% -----
% CAPA
% -----
\newcommand\makecapa{
    \thispagestyle{empty}
    \noindent

    \begin{center}

        {\fontsize{13.20}{16}\selectfont
            \textbf{MINIST\'{E}RIO DA DEFESA\\}
            \textbf{EX\'{E}RCITO BRASILEIRO\\}
            \textbf{DEPARTAMENTO DE CI\^{E}NCIA E TECNOLOGIA\\}
            \textbf{INSTITUTO MILITAR DE ENGENHARIA\\}
            \textbf{CURSO DE GRADUA\c{C}\~{A}O EM ENGENHARIA DE COMPUTA\c{C}\~{A}O}

            \vspace{5cm}
            \ifdefined\@autorI
                \ifdefined\@postoautorI\textbf{\@postoautorI}{ }\fi\textbf{\MakeUppercase{\@autorI}}\fi
            \ifdefined\@autorII
                \ifdefined\@postoautorII\textbf{\\ \@postoautorII}{ }\else \\ \fi\textbf{\MakeUppercase{\@autorII}}\fi
            \ifdefined\@autorIII
                \ifdefined\@postoautorIII\textbf{\\ \@postoautorIII}{ }\else \\ \fi\textbf{\MakeUppercase{\@autorIII}}\fi

            \vspace{5cm}
            \textbf{\MakeUppercase{\@titulo}}

            \vspace{5cm}
            \textbf{Rio de Janeiro\\}
            \textbf{\@ano}
        }
    \end{center}

	\global\let\makecapa\relax
	\global\let\and\relax
    \newpage}


% -----
% TÍTULO
% -----
\newenvironment{titlepage} {
    \if@twocolumn \@restonecoltrue\onecolumn
    \else \@restonecolfalse\newpage \fi
    \thispagestyle{empty}
    \setcounter{page}\@ne
} { \if@restonecol\twocolumn \else \newpage \fi
    \if@twoside\else \setcounter{page}\@ne \fi }

\newcommand\maketitle{
    \premonta{\@autorI}{1}
    \ifdefined \@autorII \premonta{\@autorII}{2} \fi
    \ifdefined \@autorIII \premonta{\@autorIII}{3} \fi
    \premonta{\@orientador}{4}
    \ifdefined \@coorientador \premonta{\@coorientador}{5} \fi

    \thispagestyle{empty}
	\begin{titlepage}
		\begin{center}
			{\normalsize \MakeUppercase{\textbf{INSTITUTO MILITAR DE ENGENHARIA}} \par}

			\vspace{2cm}
            {\normalsize \begin{tabular}[t]{c}
                \ifdefined\@autorI
                    \ifdefined\@postoautorI\textbf{\@postoautorI}{ }\fi\textbf{\MakeUppercase{\@autorI}}\fi
                \ifdefined\@autorII
                    \\ \ifdefined\@postoautorII\textbf{\@postoautorII}{ }\fi\textbf{\MakeUppercase{\@autorII}}\fi
                \ifdefined\@autorIII
                    \\ \ifdefined\@postoautorIII\textbf{\@postoautorIII}{ }\fi\textbf{\MakeUppercase{\@autorIII}}\fi
                \end{tabular} \par}

			\vspace{4cm}
			{\large \MakeUppercase{\textbf{\@titulo}} \par}

			\vspace{3cm}
		\end{center}

		\leftskip=4cm
		\noindent
		Projeto de Fim de Curso apresentado ao Curso de Gradua\c{c}\~{a}o em Engenharia de Computa\c{c}\~{a}o do Instituto Militar de Engenharia, como requisito parcial para a obten\c{c}\~{a}o do t\'{i}tulo de Engenheiro de Computa\c{c}\~{a}o. \vspace{3mm}

        \montaRotuloOrientador{\@introrientador}
		\noindent
		{\@rotuloOrientador}: {\@orientadorStr}

		\ifdefined \@coorientador
            \montaRotuloCoOrientador{\@intrcoorientador}
			\noindent
			{\@rotuloCoOrientador}: {\@coorientadorStr}
		\fi

		\leftskip=0cm
		\vfill

		\begin{center}
			{\large Rio de Janeiro\\ \@ano}
		\end{center}\par
		\vfil\null
	\end{titlepage}

	\global\let\maketitle\relax
	\global\let\and\relax
    \newpage}


% -----
% CRÉDITOS
% -----
\newcounter{pc}
\refstepcounter{pc}

\newcommand\makecredits{ 
    \noindent
	c\@ano
	\vspace{1cm}

    \noindent
    INSTITUTO MILITAR DE ENGENHARIA \\
    Pra\c{c}a General Tib\'{u}rcio, 80 - Praia Vermelha \\
    Rio de Janeiro - RJ \hskip3\fontdimen6\font CEP 22290-270
    \vspace{1cm}

    \noindent
    Este exemplar \'{e} de propriedade do Instituto Militar de Engenharia, que poder\'{a} inclu\'\i-lo em base de dados, armazenar em computador, microfilmar ou adotar qualquer forma de arquivamento.
    \vspace{3mm}

    \indent
    \'{E} permitida a men\c{c}\~{a}o, reprodu\c{c}\~{a}o parcial ou integral e a transmiss\~{a}o entre bibliotecas deste trabalho, sem modifica\c{c}\~{a}o  de seu texto, em qualquer meio que esteja ou venha a ser fixado, para pesquisa acad\^{e}mica, coment\'{a}rios e cita\c{c}\~{o}es, desde que sem finalidade comercial e que seja feita a refer\^{e}ncia bibliogr\'{a}fica completa.
    \vspace{3mm}

    \indent
    Os conceitos expressos neste trabalho s\~{a}o de responsabilidade do(s) autor(es) e do(s) orientador(es). \vspace{3mm}

	\begin{flushright}
		\framebox[12.5cm]{
			\vspace*{5mm}
			\begin{minipage}{11.5cm}
				\parbox[t]{11.5cm}{\rule{8cm}{0cm}}
				\parbox[t]{1.5cm}{\@bibliorefA}\montaNome{\@autorI}{1} \\
				\parbox[t]{1.5cm}{\@bibliorefB}{\parbox[t]{10cm}{\hskip\fontdimen6\font \@titulo { /} \@autorI, \ifdefined \@autorII {\@autorII}, \fi \ifdefined \@autorIII {\@autorIII}, \fi orientado por {\@orientador } \ifdefined \@coorientador {e \@coorientador} \fi - Rio de Janeiro: Instituto Militar de Engenharia, \@ano.}}
				\vspace{3mm}

				\parbox[t]{1.5cm}{\hskip\fontdimen6\font}{\parbox[t]{10cm}{\hskip2\fontdimen6\font %{\@numpaginas}p.: il.}} \vspace{1mm}
                \pageref{LastPage}p.: il.}} \vspace{0mm}

				\parbox[t]{1.5cm}{\hskip\fontdimen6\font}{\parbox[t]{10cm}{\hskip2\fontdimen6\font Projeto de Fim de Curso (gradua\c{c}\~{a}o) - Instituto Militar de Engenharia, Rio de Janeiro, \@ano.}} \vspace{3mm}

				\ifdefined \@coorientador
                    \parbox[t]{1.5cm}{\hskip\fontdimen6\font}{\parbox[t]{10cm}{\hskip2\fontdimen6\font 1. Curso de Gradua\c{c}\~{a}o em Engenharia de Computa\c{c}\~{a}o - projeto de fim de curso. \foreach \n in \@palavraschaves {\thepc. \n. \refstepcounter{pc}} I.\montaNome{\@orientador}{4}. II.\montaNome{\@coorientador}{5}. III. T\'{i}tulo. IV. Instituto Militar de Engenharia.}} \vspace{3mm}
				\else
					\parbox[t]{1.5cm}{\hskip\fontdimen6\font}{\parbox[t]{10cm}{\hskip2\fontdimen6\font 1. Curso de Gradua\c{c}\~{a}o em Engenharia de Computa\c{c}\~{a}o - projeto de fim de curso. \foreach \n in \@palavraschaves {\thepc. \n. \refstepcounter{pc}} I.\montaNome{\@orientador}{4}. II. T\'{i}tulo. III. Instituto Militar de Engenharia.}} \vspace{3mm}					
				\fi
			\end{minipage}
		}
	\end{flushright}

    \global\let\makecredits\relax
    \global\let\and\relax
    \newpage}


% -----
% APROVAÇÃO
% -----
%\def\@approvalspace{.75in}
%\def\nummembrosbanca#1{\gdef\@nummembrosbanca{#1} \ifnum \@nummembrosbanca > 5 \gdef\@approvalspace{.5in} \fi}

\def\@approvalspace{.75in}

\newcommand\approvalpage{
	\thispagestyle{plain}
	\noindent
	\begin{center}
		\MakeUppercase{\textbf{INSTITUTO MILITAR DE ENGENHARIA}}
		\vfill \vfill \vfill
            \ifdefined\@autorI
                \ifdefined\@postoautorI\textbf{\@postoautorI}{ }\fi\textbf{\MakeUppercase{\@autorI}}\fi
            \ifdefined\@autorII
                \ifdefined\@postoautorII\textbf{\\ \@postoautorII}{ }\else \\ \fi\textbf{\MakeUppercase{\@autorII}}\fi
            \ifdefined\@autorIII
                \ifdefined\@postoautorIII\textbf{\\ \@postoautorIII}{ }\else \\ \fi\textbf{\MakeUppercase{\@autorIII}}\fi
		\vfill \vfill \vfill
		\large \MakeUppercase{\textbf{\@titulo}}
		\vfill
	\end{center}

	\indent
	Projeto de Fim de Curso apresentado ao Curso de Gradua\c{c}\~{a}o em Engenharia de Computa\c{c}\~{a}o do Instituto Militar de Engenharia, como requisito parcial para a obten\c{c}\~{a}o do t\'{i}tulo de Engenheiro de Computa\c{c}\~{a}o.

	\montaRotuloOrientador{\@introrientador}
	\indent
	{\@rotuloOrientador}: {\@orientadorStr} \\
	\ifdefined \@coorientador
	    \montaRotuloCoOrientador{\@intrcoorientador}
		\indent
		{\@rotuloCoOrientador}: {\@coorientadorStr}
	\fi

    \ifnum \thenumMembros>4 \gdef\@approvalspace{.5in} \fi
    \ifdefined \@coorientador
        \ifnum \thenumMembros>3 \gdef\@approvalspace{.5in} \fi \fi

	\vspace{0.7cm}
	\noindent
	Aprovado em {\@dia} de {\@mes} de {\@ano} pela seguinte Banca Examinadora:

	\begin{center}
		\vspace{\@approvalspace}
		$\:\overline{\makebox[15.5cm][c]{{\@orientadorLocalStr} - Presidente}}\:$ \\
		\ifdefined \@coorientador
			\vspace{\@approvalspace}
		    $\:\overline{\makebox[15.5cm][c]{\@coorientadorLocalStr}}\:$ \\
		\fi
		\ifnum \thenumMembros>0
    		\vspace{\@approvalspace}
    		$\:\overline{\makebox[15.5cm][c]{\@membroIstr}}\:$ \\
    	\fi
		\ifnum \thenumMembros>1
    		\vspace{\@approvalspace}
		    $\:\overline{\makebox[15.5cm][c]{\@membroIIstr}}\:$ \\
    	\fi
		\ifnum \thenumMembros>2
			\vspace{\@approvalspace}
		    $\:\overline{\makebox[15.5cm][c]{\@membroIIIstr}}\:$ \\
    	\fi
		\ifnum \thenumMembros>3
			\vspace{\@approvalspace}
		    $\:\overline{\makebox[15.5cm][c]{\@membroIVstr}}\:$ \\
    	\fi
		\ifnum \thenumMembros>4
			\vspace{\@approvalspace}
		    $\:\overline{\makebox[15.5cm][c]{\@membroVstr}}\:$ \\
		\fi
		\vfill\null
		Rio de Janeiro\\
		{\@ano}
		\vfill\null
	\end{center}

    \global\let\approvalpage\relax
    \global\let\and\relax
    \newpage}


% -----
% DEDICATÓRIA
% -----
\def\dedicatoria#1{\gdef\@dedicatoria{#1}}

\newcommand\makededication{
    \thispagestyle{plain}
	\onecolumn
	\null
	\vspace{9.0cm}

    \begingroup \leftskip=4cm \noindent \@dedicatoria \par\endgroup

    \global\let\makededication\relax
    \global\let\and\relax
	\newpage}


% -----
% AGRADECIMENTOS
% -----
\newcommand\nomeagradecimentos{Agradecimentos}
\def\agradecimentos#1{\gdef\@agradecimentos{#1}}

\newcommand\makethanks{
	\chapter*{\nomeagradecimentos
		\@mkboth{\MakeUppercase\nomeagradecimentos}{\MakeUppercase\nomeagradecimentos}}
	{\let\footnotemark\relax
	\setlength\parindent{0.75cm} \indent \@agradecimentos}
	\if@restonecol\twocolumn\fi
	\newpage}


% -----
% EPÍGRAFE
% -----
\def\epigrafe#1{\gdef\@epigrafe{#1}}
\def\autorepigrafe#1{\gdef\@autorepigrafe{#1}}

\newcommand\makeepigraph{
    \thispagestyle{plain}
	\onecolumn
	\null
	\vspace{9.0cm}

    \begingroup \leftskip=4cm \noindent ``{\@epigrafe}'' \par\endgroup
    \begin{flushright}\MakeUppercase{\@autorepigrafe}\end{flushright}

    \global\let\makeepigraph\relax
    \global\let\and\relax
	\newpage}


\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{5em}
\newcommand\@dotsep{2}
\setcounter{tocdepth}{3}

% -----
% SUMÁRIO
% -----
\newcommand\nomeconteudo{SUM{\'A}RIO}

\newcommand\tableofcontents{
	\if@twocolumn \@restonecoltrue\onecolumn \else \@restonecolfalse \fi
	\chapter*{\nomeconteudo
		\@mkboth{\MakeUppercase\nomeconteudo}{\MakeUppercase\nomeconteudo}}
    {\let\footnotemark\relax \@starttoc{toc}}
    \if@restonecol\twocolumn\fi
    \newpage}

\newcommand*\l@part[2]{
	\ifnum \c@tocdepth >-2
		\addpenalty{-\@highpenalty}
		\addvspace{\baselineskip}
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\bfseries \MakeUppercase{#1} \normalfont
			\nobreak
			\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
			\hfil \nobreak \hb@xt@\@pnumwidth{\hss #2}\par
			\nobreak
			\global\@nobreaktrue
			\everypar{\global\@nobreakfalse\everypar{}}
		\endgroup
	\fi}

\newcommand*\l@listas[2]{
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}
		\vskip 0.5\baselineskip
		\setlength\@tempdima{3.0em}
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\MakeUppercase{#1}
			\nobreak
			\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
			\hfil \nobreak \hb@xt@\@pnumwidth{\hss #2}\par
			\penalty\@highpenalty
		\endgroup
	\fi}

\newcommand*\l@chapter[2]{
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{3.0em}
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\bfseries \MakeUppercase{#1} \normalfont
			\nobreak
			\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
			\hfil\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
			\penalty\@highpenalty
		\endgroup
	\fi}

\newcommand*\l@section{\normalfont \@dottedtocline{1}{0em}{3.0em}}
\newcommand*\l@subsection{\normalfont \@dottedtocline{2}{0em}{3.0em}}
\newcommand*\l@subsubsection{\normalfont \@dottedtocline{3}{0em}{3.0em}}
\newcommand*\l@paragraph{\normalfont \@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\normalfont \@dottedtocline{5}{12em}{6em}}


% -----
% LISTA DE FIGURAS
% -----
\newcommand\nomelistafiguras{LISTA DE ILUSTRA{\c{C}}{\~O}ES}

\newcommand\listoffigures{
	\addcontentsline{toc}{listas}{\protect\nomelistafiguras}
	\chapter*{\nomelistafiguras
		\@mkboth{\MakeUppercase\nomelistafiguras}{\MakeUppercase\nomelistafiguras}}
	{\let\footnotemark\relax  \@starttoc{lof}}
	\if@restonecol\twocolumn\fi
	\newpage}

\newcommand*\l@figure[2]{
	\addpenalty{-\@highpenalty}
	\setlength\@tempdima{2.6em}
	\begingroup
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\advance\leftskip\@tempdima
		\hskip -\leftskip
		\hangindent=\@tempdima
		\nomefigura\textnormal{#1}
		\nobreak
		\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
		\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		\penalty\@highpenalty
	\endgroup}


% -----
% LISTA DE TABELAS
% -----
\newcommand\nomelistatabelas{LISTA DE TABELAS}

\newcommand\listoftables{
	\addcontentsline{toc}{listas}{\protect\nomelistatabelas}
	\chapter*{\nomelistatabelas
		\@mkboth{\MakeUppercase\nomelistatabelas}{\MakeUppercase\nomelistatabelas}}
	{\let\footnotemark\relax  \@starttoc{lot}}
	\if@restonecol\twocolumn\fi
	\newpage}

\newcommand*\l@table[2]{
	\addpenalty{-\@highpenalty}
	\setlength\@tempdima{2.4em}
	\begingroup
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\advance\leftskip\@tempdima
		\hskip -\leftskip
		\hangindent=\@tempdima
		\nometabela\textnormal{#1}
		\nobreak
		\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
		\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		\penalty\@highpenalty
	\endgroup}


% -----
% LISTA DE SIGLAS
% -----
\newcommand\nomelistasiglas{LISTA DE SIGLAS}

\newcounter{sigla}
\def\ftype@sigla{5}
\def\ext@sigla{lon}
\def\sigla#1#2{\addtocontents{lon}{\contentsline {sigla}{#2}{#1}}} 

\newcommand{\acronimo}[2]{
	\addtocontents{lon}{\protect\parbox[t]{0.2\textwidth}{#1}
	\protect\parbox[t]{0.8\textwidth}{#2}
	\protect}
}

\newcommand\listofnicks{
	\addcontentsline{toc}{listas}{\protect\nomelistasiglas}
	\chapter*{\nomelistasiglas
		\@mkboth{\MakeUppercase\nomelistasiglas}{\MakeUppercase\nomelistasiglas}}
	{\let\footnotemark\relax
	\@starttoc{lon}}
	\if@restonecol\twocolumn\fi
	\newpage}


% -----
% LISTA DE ABREVIATURAS E SÍMBOLOS
% -----
\newcommand\nomelistaabreviaturas{LISTA DE ABREVIATURAS}
\newcommand\nomeabreviatura{Abreviaturas}
\newcommand\nomesimbolo{S\'{\i}mbolos}

\newcounter{abreviatura}
\def\ftype@abreviatura{3}
\def\ext@abreviatura{loa}
\def\abrevia#1#2{\addtocontents{loa}{\contentsline {abreviatura}{#2}{#1}}}

\newcounter{simbolo}
\def\ftype@simbolo{4}
\def\ext@simbolo{los}
\def\simbo#1#2{\addtocontents{los}{\contentsline {simbolo}{#2}{#1}}}

\newcommand{\abreviatura}[2]{
	\if@abrevia
		\addtocontents{loa}{\protect\parbox[t]{0.1\textwidth}{#1}
		\protect\parbox[t]{0.05\textwidth}{-}
		\protect\parbox[t]{0.9\textwidth}{#2}
		\protect}%
	\else
		\@abreviatrue
		\addtocontents{loa}{\protect\parbox[t]{0.9\textwidth}{\bfseries\MakeUppercase\nomeabreviatura}
		\protect\\[0.5cm]}                     
		\addtocontents{loa}{\protect\parbox[t]{0.1\textwidth}{#1}
		\protect\parbox[t]{0.05\textwidth}{-}
		\protect\parbox[t]{0.9\textwidth}{#2}
		\protect}
	\fi
}
\newcommand{\simbolo}[2]{
	\if@simbo
		\addtocontents{los}{\protect\parbox[t]{0.1\textwidth}{#1}
		\protect\parbox[t]{0.05\textwidth}{-}
		\protect\parbox[t]{0.9\textwidth}{#2}
		\protect}
	\else
		\@simbotrue
		\addtocontents{los}{\protect\\
		\protect\parbox[t]{0.9\textwidth}{\bfseries\MakeUppercase\nomesimbolo}
		\protect\\[0.5cm]}                    
		\addtocontents{los}{\protect\parbox[t]{0.1\textwidth}{#1}
		\protect\parbox[t]{0.05\textwidth}{-}
		\protect\parbox[t]{0.9\textwidth}{#2}
		\protect}
	\fi
}

\newcommand\listofsymbols{
	\addcontentsline{toc}{listas}{\protect\nomelistaabreviaturas}
	\chapter*{\nomelistaabreviaturas
		\@mkboth{\MakeUppercase\nomelistaabreviaturas}{\MakeUppercase\nomelistaabreviaturas}}%
	{\let\footnotemark\relax
	\@starttoc{loa}
	\@starttoc{los}}
	\if@restonecol\twocolumn\fi
	\newpage}


% -----
% RESUMO
% -----
\newcommand\nomeresumo{RESUMO}
\def\resumo#1{\gdef\@resumo{#1}}

\newcommand\makeresumo{
	\chapter*{\nomeresumo
		\@mkboth{\MakeUppercase\nomeresumo}{\MakeUppercase\nomeresumo}}
	{\let\footnotemark\relax
	\setlength\parindent{0.75cm} \indent \@resumo}
	\if@restonecol\twocolumn\fi
	\newpage}


% -----
% ABSTRACT
% -----
\newcommand\nomeabstract{ABSTRACT}
\def\abstract#1{\gdef\@abstract{#1}}

\newcommand\makeabstract{
	\chapter*{\nomeabstract
		\@mkboth{\MakeUppercase\nomeabstract}{\MakeUppercase\nomeabstract}}
	{\let\footnotemark\relax
	\setlength\parindent{0.75cm} \@abstract}
	\if@restonecol\twocolumn\fi
	\newpage}


% -----
% REFERÊNCIAS BIBLIOGRÁFICAS
% -----
\newcommand\nomebibliografia{REFER\^ENCIAS BIBLIOGR\'AFICAS}

\newdimen\bibindent
\setlength\bibindent{1.5em}

\newenvironment{thebibliography}[1] {}

\newenvironment{thethesisbibliography}[1] {
    \chapter{
        \nomebibliografia
        \@mkboth{\MakeUppercase\nomebibliografia}{\MakeUppercase\nomebibliografia}
    }
    \ssp \list{}{}
} {\def\@noitemerr {\@latex@warning{Empty `thethesisbibliography' environment}} \endlist}

\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\renewenvironment{thethesisbibliography}[1] {
    \chapter{
        \nomebibliografia
        \@mkboth{\MakeUppercase\nomebibliografia}{\MakeUppercase\nomebibliografia}
    }
    \list{\@biblabel{\@arabic\c@enumiv}} {
        \settowidth\labelwidth{\@biblabel{#1}}
        \leftmargin=20pt
        \itemindent=-20pt
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}
    }
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m
} {\def\@noitemerr {\@latex@warning{Empty `thethesisbibliography' environment}} \endlist}


% -----
% APÊNDICE
% -----
\newcommand\nomeapendice{AP{\^E}NDICE}
\newcommand\nomeindiceapendice{AP{\^E}NDICES}

\newcommand\inappendix {
    \setcounter{section}{0}
    \gdef\@chapapp{\nomeapendice}
    \@appendformattrue \chapter{\underline\nomeindiceapendice} \@appendformatfalse
    \@appendtrue
    \gdef\thechapter{\@arabic\c@chapter}
    \renewcommand \thesection {\thechapter.\@arabic \c@section}
}

\newcommand\outappendix {
    \@appendfalse
}


% -----
% ANEXO
% -----
\newcommand\nomeanexo{ANEXO}
\newcommand\nomeindiceanexo{ANEXOS}

\newcommand\inannex {
    \setcounter{section}{0}
    \gdef\@chapapp{\nomeanexo}
    \@annexformattrue \chapter{\underline\nomeindiceanexo} \@annexformatfalse
    \@appendtrue
    \gdef\thechapter{\@arabic\c@chapter}
    \renewcommand \thesection {\thechapter.\@arabic \c@section}
}

\newcommand\outannex {
    \@appendfalse
}


% -----
% ÍNDICE REMISSIVO
% -----
\newcommand\nomeindice{{\'I}NDICE}

\newenvironment{theindex} {
    \if@twocolumn \@restonecolfalse \else \@restonecoltrue \fi
    \columnseprule \z@
    \columnsep 35\p@
    \twocolumn[\@makeschapterhead{\nomeindice}]
    \@mkboth{\MakeUppercase\nomeindice}
            {\MakeUppercase\nomeindice}
    \thispagestyle{plain}\parindent\z@
    \parskip\z@ \@plus .3\p@\relax
    \let\item\@idxitem
} {\if@restonecol\onecolumn\else\clearpage\fi}

\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{
    \kern-3\p@
    \hrule\@width.4\columnwidth
    \kern2.6\p@
}
\newcommand\@makefntext[1] {
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1
}


% -----
% GERAÇÃO DAS PÁGINAS DO DOCUMENTO
% -----

\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}

\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside \else \raggedbottom \fi
\if@twocolumn \twocolumn \sloppy \flushbottom \else \onecolumn \fi

\newenvironment{frontmatter} {
    \if@twocolumn \@restonecolfalse \else \@restonecoltrue \fi
    \columnseprule \z@
    \columnsep 35\p@
    \onecolumn
    \setcounter{page}{2}
    \renewcommand{\thepage}{\arabic{page}}
} {\newpage}
\endinput

% -----
% FIM
% -----
