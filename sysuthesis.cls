% 定义模板样式
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sysuthesis}[2017/05/06 v4.5.3 Sun Yat-Sen University undergraduate thesis document class]
\newcommand{\newclearpage}{\clearpage} % 设置文章为电子版格式（不添加多余空白页）
\DeclareOption{print-both-sides}{ % 设置文章为双面打印格式（添加多余空白页保证每个表格、章节开头为奇数页面）
    \renewcommand{\newclearpage}{
        \clearpage{
            \pagestyle{empty}
            \cleardoublepage
        }
    }
}  
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[
    % fontset=adobe2, % 可手动下载adobe，并选用此项
    fontset=fandol,    % texlive自带，可移植字体库，只有常用的6763个汉字
    %fontset=ubuntu,
    %fontset=mac,
    %fontset=windows,
    a4paper,
    %openright,
    openany,
    zihao=-4
]{ctexbook}



% 配置英文字体
\RequirePackage{fontspec}
% 如果\RequirePackage{newtxtext}能正常通过编译请注释以下三行，并取消第四行的注释
%\renewcommand*{\rmdefault}{ntxtlf} % always TLF for math
%\renewcommand*{\familydefault}{\rmdefault}
%\setmainfont{Times New Roman} % 如果注释掉能正常编译，请注释
\RequirePackage{newtxtext} % 文本自动采用新罗马字体

% \RequirePackage[margin=1in,headsep=.2in, headheight=2in]{geometry}
\RequirePackage[top=25mm, bottom=20mm, left=30mm, right=30mm,a4paper]{geometry}
\RequirePackage{ifthen} % 用于判断
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage[labelsep=space]{caption}
\RequirePackage[font=footnotesize]{subcaption}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{newtxmath} % 公式使用新罗马字体
\RequirePackage{ragged2e} % 实现两端对齐
\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage[section]{placeins}
% TODO: 伪代码要用中文吗？
% \RequirePackage[onelanguage,linesnumbered,algochapter,ruled,vlined]{algorithm2e}
\RequirePackage[chinese, onelanguage,linesnumbered,algochapter,ruled,vlined]{packages/algorithm2e}
\RequirePackage{enumitem}
\RequirePackage{bbm}
\RequirePackage{bm}
\RequirePackage[notlof,notlot,nottoc,numbib]{tocbibind} %table of content
\RequirePackage{tocloft}
\RequirePackage{wrapfig}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage[bottom, perpage]{footmisc}
\RequirePackage{setspace}
\RequirePackage{datetime}
\RequirePackage{nth}
\RequirePackage{changepage} % 引入调整段落整体宽度的宏包
\RequirePackage[norefpage]{nomencl} % 符号表宏包

% 设定时间为中文日期
\ctexset{today=small}

% 定义英文日期格式
\newcommand\etoday{
    \hspace{0.5\ccwd} \monthname[\the\month]\hspace{2\ccwd} \nth{\the\day}{\hspace{1\ccwd}} \the\year
}

\AtBeginDocument{
    \hypersetup{
        citecolor=green,
        filecolor=black,
        linkcolor=black,
        urlcolor=black,
        CJKbookmarks=true,
        pdftitle={\@ctitle},
        pdfauthor={\@cauthor},
        pdfkeywords={\@ckeywords},
        pdfcreator={LaTeX with hyperref package, using SYSU undergraduate Thesis LaTeX Template}
    }
}
\pagestyle{fancy}
% 1.5倍行距 TODO
\renewcommand{\baselinestretch}{1.5}

% 有序与无序列表环境
\setlist[enumerate]{nosep}
\renewcommand\labelenumi{\theenumi)}
%\renewcommand\labelenumi{\theenumi.}
\setlist[itemize]{nosep}
\setlist[description]{nosep}

% 页眉、页脚、脚注设定
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{ \markboth{#1}{} }
% 采用带圈数字符号代替*号脚注
\xeCJKsetcharclass{`①}{`⑩}{1}


%% 页眉页脚样式
% 页脚线
\renewcommand{\footrulewidth}{1pt}
% 是否开启双线页眉
\newboolean{doublerule}
\setboolean{doublerule}{false}
\setboolean{doublerule}{true} % 开启，注释以关闭
% 双线页眉
\newcommand{\makedoubleheadrule}{
    \makebox[0pt][l]{\rule[0.55\baselineskip]{\headwidth}{1pt}}
    \vspace*{-0.35cm}

    \rule[0.7\baselineskip]{\headwidth}{1pt}
} 
% 单线页眉
\newcommand{\makeheadrule}{
    \rule[0.7\baselineskip]{\headwidth}{1pt}
} 
% 重定义headrule命令自动获取单/双线页眉
\renewcommand{\headrule}{
    \ifthenelse{\boolean{doublerule}}{\makedoubleheadrule}{\makeheadrule}% 
}
% 默认页面页眉页脚样式
\fancypagestyle{plain}{
    \fancyhf{}
    % F18 页眉与页脚 宋体五号居中
    \fancyfoot[C]{\zihao{5}第\hspace*{0.2em} \thepage \hspace*{0.2em} 页} % 页码位于页脚居中

    % 左右两栏页眉，左为论文题目右为当前章
    % \fancyhead[L]{\zihao{-5}\@ctitle}
    % \fancyhead[R]{\zihao{-5}\leftmark}

    % 居中式页眉，可以选择为论文题目或当前章
    \fancyhead[C]{\zihao{5}\@ctitle}
    %\fancyhead[C]{\zihao{-5}\leftmark}
}
\pagestyle{plain}
% 中英文摘要页面样式
\fancypagestyle{cAbstract}{
    \fancyhead[L]{\zihao{-5}\@ctitle}
    \fancyhead[R]{\zihao{-5}摘要}
}
\fancypagestyle{eAbstract}{
    \fancyhead[L]{\zihao{-5}\@etitle}
    \fancyhead[R]{\zihao{-5}ABSTRACT}
}
% 目录样式
\fancypagestyle{contents}{
    \fancyhf{}
    \renewcommand{\headrule}{}
    \fancyfoot[C]{\zihao{5}第\hspace*{0.2em} \thepage \hspace*{0.2em} 页}
}
\fancypagestyle{main}{
    \renewcommand{\headrule}{
    \ifthenelse{\boolean{doublerule}}{\makedoubleheadrule}{\makeheadrule}% 
    }
    \fancyhf{}
    % F18 页眉与页脚 宋体五号居中
    \fancyfoot[C]{\zihao{5}第\hspace*{0.2em} \thepage \hspace*{0.2em} 页} % 页码位于页脚居中

    % 左右两栏页眉，左为论文题目右为当前章
    % \fancyhead[L]{\zihao{-5}\@ctitle}
    % \fancyhead[R]{\zihao{-5}\leftmark}

    % 居中式页眉，可以选择为论文题目或当前章
    \fancyhead[C]{\zihao{5}\@ctitle}
    %\fancyhead[C]{\zihao{-5}\leftmark}
}
% 样式调用
\newcommand\cAbstractpagestyle{\cleardoublepage\pagestyle{cAbstract}\let\ps@plain\ps@cAbstract}
\newcommand\eAbstractpagestyle{\cleardoublepage\pagestyle{eAbstract}\let\ps@plain\ps@eAbstract}
\newcommand\contentspagestyle{\cleardoublepage\pagestyle{contents}\let\ps@plain\ps@contents}
\newcommand\mainpagestyle{\cleardoublepage\pagestyle{main}\let\ps@plain\ps@main}


% 表格与图片标题设定
% https://blog.csdn.net/uncle_gy/article/details/78313861
% https://tex.stackexchange.com/questions/101591/setting-font-size-for-caption-package
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\setlength\heavyrulewidth{0.2em}
% F19 图题表题 宋体五号
\DeclareCaptionFormat{sysucaption}{\fontsize{10.5}{10.5}\selectfont#1#2#3}
\captionsetup{format=sysucaption}


% 目录设定，使用tocloft宏包
\setcounter{secnumdepth}{3} % depth of toc, 2
%\setcounter{tocdepth}{1}
% 如果要在目录中显示子章节请换用下面这行(目录中显示到x.y.z章)，如果不用这行默认显示到x.y章。
\setcounter{tocdepth}{2}

% F8 目录标题：3号黑体居中
\renewcommand{\cfttoctitlefont}{\hfill\zihao{3}\heiti}
\renewcommand{\cftlottitlefont}{\hfill\zihao{3}\heiti}
\renewcommand{\cftloftitlefont}{\hfill\zihao{3}\heiti}

% 如果要加粗，放 \bfseries
% 目录中章节标题：小四号宋体
% F9 目录内容：宋体小四号
\renewcommand{\cftchapfont}{\bfseries\zihao{-4}\songti}
\renewcommand{\cftchappagefont}{\bfseries\zihao{-4}\songti}

% 目录中其他内容：小四号宋体
\renewcommand{\cftsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsecpagefont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecpagefont}{\zihao{-4}\songti}
\setlength{\cftsecindent}{0.5em}        % 小节缩进, 对齐章标题空隙
\setlength{\cftsubsecindent}{2em}        % 子小节缩进, 对齐章标题空隙

% 插图目录
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\cftfigfont}{\zihao{-4}\songti}
\renewcommand{\cftfigpagefont}{\zihao{-4}\songti}

% 表格目录
\renewcommand{\listtablename}{表格目录}
\renewcommand{\cfttabfont}{\zihao{-4}\songti}
\renewcommand{\cfttabpagefont}{\zihao{-4}\songti}

\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftdotsep}{1.5}
\renewcommand{\cftnodots}{\cftdotsep} 
\cftsetpnumwidth{1.2em}

% 目录标题到目录正文的间距调整
\setlength{\cftaftertoctitleskip}{0.5cm}
\setlength{\cftafterloftitleskip}{0.6cm}
\setlength{\cftafterlottitleskip}{0.6cm}

% \addtolength{\cftchapnumwidth}{3\ccwd} % 用来设置目录中章节标题离数字的距离
\newcommand\mybold[1]{\textit{\textbf{#1}}}


% 各个定理引理环境创建
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newtheoremstyle{dotless}{3pt}{3pt}{\kaishu}{2em}{\heiti}{}{\ccwd}{}
\theoremstyle{dotless}
\newtheorem{theorem}{{定理}}[chapter]
\newtheorem{proposition}{{命题}}[chapter]
\newtheorem{lemma}{{引理}}[chapter]
\newtheorem{corollary}{{推论}}[chapter]
\newtheorem{definition}{{定义}}[chapter]
\newtheorem{remark}{{注记}}[chapter]
\newtheorem{eg}{例}[chapter]
\newtheorem{assumption}{假设}[chapter]
% 证明环境
\renewcommand{\proofname}{{\heiti 证明}}
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}
    \kaishu \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item[\hskip\labelsep
                \itshape
                #1]\ignorespaces
}{
    \popQED\endtrivlist\@endpefalse
}


% 参考文献引用标记格式：右上角，带方括号
\RequirePackage{gbt7714}


% 相关信息宏定义
\newcommand\ctitle[1]{\def\@ctitle{#1}}
\newcommand\etitle[1]{\def\@etitle{#1}}
\newcommand\covertitlefirst[1]{\def\@covertitlefirst{#1}}
\newcommand\covertitlesecond[1]{\def\@covertitlesecond{#1}}
% 这两个在原来的info.tex里面定义，用于英文标题过长的时候的换行情况
\newcommand\etitlefirst[1]{\def\@etitlefirst{#1}}
\newcommand\etitlesecond[1]{\def\@etitlesecond{#1}}
\newcommand\eabstracttitlefirst[1]{\def\@eabstracttitlefirst{#1}} % 解决英文摘要页标题过长问题 (Issue 49&63)
\newcommand\eabstracttitlesecond[1]{\def\@eabstracttitlesecond{#1}}
\newcommand\cauthor[1]{\def\@cauthor{#1}} % 默认中文名为封面作者名字
\newcommand\eauthor[1]{\def\@eauthor{#1}}
\newcommand\studentid[1]{\def\@studentid{#1}}
\newcommand\cschool[1]{\def\@cschool{#1}}
\newcommand\cmajor[1]{\def\@cmajor{#1}}
\newcommand\emajor[1]{\def\@emajor{#1}}
\newcommand\cmentor[1]{\def\@cmentor{#1}}
\newcommand\ementor[1]{\def\@ementor{#1}}


% 新版封面，add by wyf 2021-01-11 21:57:01
\newcommand\makeUndergraduateCover {
    \begin{titlepage}
        \begin{center}
            \heiti
            \definecolor{sysugreen}{RGB}{36,86,44}
            \ \vspace{0.5cm}
            \includegraphics[width=3cm]{image/template/sysu-logo.pdf} \\
            \vspace{\baselineskip}
            {\zihao{-0}\textcolor{sysugreen}{\songti\textbf{\ 本科生毕业论文（设计）}}}

            \vspace{\baselineskip}

            % 做分割线
            \noindent\makebox[\linewidth]{ { \color{sysugreen} \rule{\paperwidth}{0.12cm} } }
            % \noindent\makebox[\linewidth]{ { \color{sysugreen} \rule[1.05cm]{\paperwidth}{0.05cm} } }
            \noindent\makebox[\linewidth]{ { \color{sysugreen} \rule[0.8\baselineskip]{\paperwidth}{0.05cm} } }

            \ \vspace{1cm}

            {
                % 二号对应22pt
                \renewcommand{\arraystretch}{1.5}
                \fontsize{22}{22}\heiti\selectfont
                {
                    \centering
                    \begin{tabular}{l}
                        % F1: 论文题目 黑体二号居中
                        \makebox[1.5cm]{题目：\hfill} \underline{\makebox[13cm]{\hfill\zihao{2}\textbf\@covertitlefirst\hfill}} \\
                        % \vspace{1pt}\\
                        \makebox[1.5cm]{\hfill} \underline{\makebox[13cm]{\hfill\zihao{2}\textbf\@covertitlesecond\hfill}}      \\
                    \end{tabular}
                }
                \ \vspace{1.3cm} \\
                % 小三对应15pt
                \renewcommand{\arraystretch}{1.8}
                % \setlength\arrayrulewidth{1.4pt}
                \fontsize{15}{15}\heiti\selectfont
                \begin{tabular}{cc}
                    % [s] 两端对齐
                    \makebox[2.2cm][s]{姓名}     & \makebox[8cm]{\hfill\@cauthor\hfill}   \\ \cline{2-2}
                    \makebox[2.2cm][s]{学号}     & \makebox[8cm]{\hfill\@studentid\hfill} \\ \cline{2-2}
                    \makebox[2.2cm][s]{院系}     & \makebox[8cm]{\hfill\@cschool\hfill}   \\ \cline{2-2}
                    \makebox[2.2cm][s]{专业}     & \makebox[8cm]{\hfill\@cmajor\hfill}    \\ \cline{2-2}
                    \makebox[2.2cm][s]{指导教师} & \makebox[8cm]{\hfill\@cmentor\hfill}   \\ \cline{2-2}
                \end{tabular}
            }\\[3em]
            \ \\
            \underline{\makebox[0.9cm]{\number\year}}年\underline{\makebox[0.9cm]{\number\month}}月\underline{\makebox[0.9cm]{\number\day}}日

            % \zihao{-3}
            % {\centering
            %     \ctexset{today=big}         % 汉字数字形式日期
            %     时间：\today     \\ % 使用最后一次编译的日期, 实现日期的自动化
            %     % Date:\hspace{0.5\ccwd} Month\hspace{2\ccwd} Day\hspace{1\ccwd} Year
            %     Date: \etoday % 英文日期自动化
            % }

        \end{center}
    \end{titlepage}
    \newclearpage
}


% 新版封面，add by wyf 2021-01-11 21:57:01
\newcommand\makeUndergraduateTitlePage {
    \begin{center}
        \ \vspace{2cm} \\
        {
        \renewcommand{\arraystretch}{1.2}
        \zihao{2}\heiti\selectfont
        \begin{tabular}{c}
            % F1: 论文题目 黑体二号居中
            \makebox[13cm]{\heiti\hfill\zihao{2}\textbf{\@covertitlefirst}\hfill}  \\
            \makebox[13cm]{\heiti\hfill\zihao{2}\textbf{\@covertitlesecond}\hfill} \\
        \end{tabular}
        \ \vspace{1cm} \\
        \zihao{2}\selectfont
        \begin{tabular}{c}
            % F1: 论文题目 黑体二号居中
            \makebox[13cm]{\hfill\zihao{2}\textbf{\@etitlefirst}\hfill}  \\
            \makebox[13cm]{\hfill\zihao{2}\textbf{\@etitlesecond}\hfill} \\
        \end{tabular}
        }

        \ \vspace{1.8cm} \\

        {
        % 小三对应15pt
        \renewcommand{\arraystretch}{1.5}
        % \setlength\arrayrulewidth{1.4pt}
        \zihao{3}\heiti\selectfont
        \begin{tabular}{cc}
            % [s] 两端对齐
            \makebox[2.3cm][s]{姓名}     & \makebox[8.5cm]{\hfill\@cauthor\hfill}   \\ \cline{2-2}
            \makebox[2.3cm][s]{学号}     & \makebox[8.5cm]{\hfill\@studentid\hfill} \\ \cline{2-2}
            \makebox[2.3cm][s]{院系}     & \makebox[8.5cm]{\hfill\@cschool\hfill}   \\ \cline{2-2}
            \makebox[2.3cm][s]{专业}     & \makebox[8.5cm]{\hfill\@cmajor\hfill}    \\ \cline{2-2}
            \makebox[2.3cm][s]{指导教师} & \makebox[8.5cm]{\hfill\@cmentor\hfill}   \\ \cline{2-2}
        \end{tabular}
        }\\

        \ \vspace{1.5cm} \\

        {\zihao{4}\heiti \underline{\makebox[0.9cm]{\number\year}}年\underline{\makebox[0.9cm]{\number\month}}月\underline{\makebox[0.9cm]{\number\day}}日 }

        % \zihao{-3}
        % {\centering
        %     \ctexset{today=big}         % 汉字数字形式日期
        %     时间：\today     \\ % 使用最后一次编译的日期, 实现日期的自动化
        %     % Date:\hspace{0.5\ccwd} Month\hspace{2\ccwd} Day\hspace{1\ccwd} Year
        %     Date: \etoday % 英文日期自动化
        % }

    \end{center}
    \thispagestyle{empty}
    \newclearpage
}


% 诚信声明
\newcommand\makedisclaim{
    \ctexset {
        chapter = {
          titleformat = {\zihao{3}\heiti\bfseries},
          beforeskip = {10pt},
          afterskip = {20pt}
         }
    }
    \chapter*{学术诚信声明}
    % {\centering\zihao{3}\heiti\textbf{学术诚信声明} }

    \zihao{-4}\songti\selectfont

    % 旧版的学术诚信声明
    % 本人所呈交的毕业论文，是在导师的指导下，独立进行研究工作所取得的成果，所有数据、图片资料均真实可靠。除文中已经注明引用的内容外，本论文不包含任何其他人或集体已经发表或撰写过的作品或成果。对本论文的研究作出重要贡献的个人和集体，均已在文中以明确的方式标明。本毕业论文的知识产权归属于培养单位。本人完全意识到本声明的法律结果由本人承担。

    % 新版的
    本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文（设计）不包含任何其他个人或集体已经发表或撰写过的作品成果。对本论文（设计）的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本论文（设计）的知识产权归属于培养单位。本人完全意识到本声明的法律结果由本人承担。

    \vspace{2\baselineskip}

    \begin{flushright}
        \makebox[2.1cm][s]{作者签名：} \makebox[5cm]{\hspace{1cm}} \\
        \vspace{\baselineskip}
        \makebox[2.1cm][s]{日期：} \makebox[5cm]{\hspace{1cm}年\hspace{1cm}月\hspace{1cm}日} \\
    \end{flushright}

    % \input{docs/disclaim}
    \thispagestyle{empty}
    \newclearpage
}

% 摘要
\newcommand\ckeywords[1]{\def\@ckeywords{#1}}
\newcommand\ekeywords[1]{\def\@ekeywords{#1}}
\newcommand\cabstract[1]{\def\@cabstract{#1}}
\newcommand\eabstract[1]{\def\@eabstract{#1}}

% 中文摘要、关键字标题：5号黑体并加方括号
% 中文摘要、关键字内容：5号楷体
\newcommand\makecabstract{
    \ctexset{
        section = {
          titleformat = {\zihao{4}\heiti},
          beforeskip = {10pt},
          afterskip = {20pt}
         },
        paragraph/format = {}
    }

    % 使用隐藏目录项的section及添加为chapter形式目录的方法来去掉在openright环境中中英文摘要间出现空白页的情况
    \section*{}
    \addcontentsline{toc}{chapter}{摘\hspace{\ccwd}要}

    % 或者只要一个醒目的标题
    % F2：中文摘要标题 黑体三号居中
    \vspace*{-5ex}
    \centerline{\zihao{3}\heiti 摘\hspace{\ccwd}要}
    \vspace{2ex}


    % F3: 中文摘要内容 宋体小四号
    % F4: 中文关键词 宋体小四号(关键词加粗)
    \zihao{-4}\songti
    % \fontsize{12}{18}\songti
    % \paragraph{}
    % \setlength{\baselineskip}{20pt}
    \@cabstract
    \paragraph{\textbf{关键词：}}\@ckeywords
}


% 英文摘要、关键字标题：小四号新罗马体(Time New Roman)加粗并加方括号
\newcommand\makeeabstract{
    \ctexset{
        section = {
          titleformat = {\zihao{4}\bfseries},
          beforeskip = {10pt},
          afterskip = {20pt}
         }
    }

    \section*{}
    \addcontentsline{toc}{chapter}{ABSTRACT}

    % F5 英文摘要标题，加粗三号全部大写
    \zihao{3}
    \vspace*{-5ex}
    \centerline{\textbf{ABSTRACT}}
    \vspace*{1.5ex}
    \setlength{\baselineskip}{20pt}

    % F6 英文摘要内容，小四号
    % F7 英文关键词，小四号，加粗
    \zihao{-4}
    \@eabstract
    \paragraph{\textbf{Keywords:}}\@ekeywords
}

% 摘要
\newcommand\makeabstract{
    \setcounter{page}{1}
    % \cAbstractpagestyle  % 采用自己设定的摘要页眉页脚
    \makecabstract
    
    \newclearpage
    % \eAbstractpagestyle  % 采用自己设定的摘要页眉页脚
    \makeeabstract
    \newclearpage
}

% 表格目录
\newcommand\maketableofcontents{
    % 设置目录标题与页眉的距离
    % \setlength{\cftbeforetoctitleskip}{0em}
    % 设置目录标题与目录正文的距离
    % \setlength{\cftaftertoctitleskip}{0em}
    \mainpagestyle
    % \contentspagestyle  % 采用自己设定的目录页眉页脚
    \section*{}
    \addcontentsline{toc}{chapter}{目\hspace{\ccwd}录}
    \vspace*{-2.8cm}
    \tableofcontents
    \newclearpage
}

% 插图目录
\newcommand\makelistoffiguretable{
    % \contentspagestyle  % 采用自己设定的目录页眉页脚
    \section*{}
    \addcontentsline{toc}{chapter}{插图目录}
    \vspace*{-2.8cm}
    \listoffigures
    \newclearpage
    \section*{}
    \addcontentsline{toc}{chapter}{表格目录}
    \vspace*{-2.8cm}
    \listoftables
}

% 符号说明表 
\renewcommand{\nomname}{\vspace*{-1.8cm}\\符号和缩略语说明}
\renewcommand{\pagedeclaration}[1]{, #1}
\setlength{\nomitemsep}{-0.2cm}
\newcommand\makenomenclaturetable{
    % \contentspagestyle  % 采用自己设定的目录页眉页脚
    \section*{}
	\printnomenclature[1.32in]
    \addcontentsline{toc}{chapter}{符号和缩略语说明}
    \newclearpage
}

\renewcommand\mainmatter{
    \@mainmattertrue
    \pagenumbering{arabic}
    \ctexset {
        chapter = {
          %fixskip = true,
          beforeskip = {10pt},
          afterskip = {20pt},
          format = {\centering},
          % F10 正文各章标题 黑体三号居中
          nameformat = {\zihao{3}\heiti},
          name = {,},
          number = {\arabic{chapter}},
          % aftername = {},
          titleformat = {\zihao{3}\heiti}
         },
        section = {
          %fixskip = true,
          beforeskip = {0.5\baselineskip},
          afterskip = {0.5\baselineskip},
          format = {},
          % F11 正文各节一级标题 黑体四号居中
          nameformat = {\zihao{4}\heiti},
          titleformat = {\zihao{4}\heiti}
         },
        subsection = {
                %fixskip = true,
                beforeskip = {0.5\baselineskip},
                afterskip = {0.5\baselineskip},
                format = {},
                % F12 正文各节二级及以下标题 宋体小四号加粗左对齐空两格
                indent = {24pt},
                nameformat = {\zihao{-4}\songti\bfseries},
                titleformat = {\zihao{-4}\songti\bfseries}
            },
        subsubsection = {
                beforeskip = {0.5\baselineskip},
                afterskip = {0.5\baselineskip},
                format = {},
                % F12 正文各节二级及以下标题 宋体小四号加粗左对齐空两格
                indent = {24pt},
                nameformat = {\zihao{-4}\songti\bfseries},
                titleformat = {\zihao{-4}\songti\bfseries}
                % 按照中大规定的格式需要显示成a.b.c.d章，而不是(d)节
                % number = {(\arabic{subsubsection})}
            }
    }
    % F13 正文内容  宋体小四号
    \zihao{-4}\songti \linespread{1.5}\selectfont
    \mainpagestyle
}

\renewcommand\backmatter{
    \@mainmatterfalse
    % \fancypagestyle{plain}{ \fancyhead[R]{\zihao{-5} \leftmark} }
    \mainpagestyle
}

% 参考文献
% 标题小五号黑体加冒号
% 内容小五号宋体
\newcommand\makereferences{
    \begingroup
    \ctexset {
        chapter = {
          % aftertitle = {：},
          format = {\centering},
          % F14 参考文献标题：黑体三号居中
          titleformat = {\zihao{3}\heiti}
         }
    }

    % 引用样式
    \bibliographystyle{gbt7714-numerical}
    % F15 参考文献内容 宋体五号
    {\zihao{5}\rmfamily\songti\bibliography{main}}    % 引用文献列表
    \endgroup
}

% 附录样式
\renewcommand\appendix{\par
    \@mainmattertrue
    % \fancypagestyle{plain}{
    %     \fancyhead[R]{\zihao{-5} 附录\thechapter \leftmark}
    % }
    \mainpagestyle
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \gdef\@chapapp{\appendixname}
    \gdef\thechapter{\@Alph\c@chapter}
    \gdef\CTEX@prechapter{\CTEX@preappendix}
    \gdef\CTEX@thechapter{\CTEX@appendix@number}
    \gdef\CTEX@postchapter{}
    \ctexset {
        chapter = {
          % F16 附录标题 黑体三号居中
          format = {\centering},
          nameformat = {\zihao{3}\heiti},
          titleformat = {\zihao{3}\heiti},
         },
        section = {
          format = {},
          nameformat = {\zihao{4}\heiti},
          titleformat = {\zihao{4}\heiti}
         },
        subsection = {
                format = {},
                indent = {24pt},
                nameformat = {\zihao{-4}\songti\bfseries},
                titleformat = {\zihao{-4}\songti\bfseries}
            }
    }
}


% 配置超链接。
% hyperref一般要求是导言区最后一个宏包，才能正常工作
% 若把该宏包提前，则会引起附录列表跳转到第一章的问题
% TODO: 重构宏包引入顺序以让代码语义聚集
\RequirePackage[hidelinks, hyperfootnotes=true]{hyperref}
\RequirePackage{footnotebackref}

\def\equationautorefname{式}%
\def\footnoteautorefname{脚注}%
\def\itemautorefname{项}%
\def\figureautorefname{图}%
\def\tableautorefname{表}%
\def\partautorefname{篇}%
\def\appendixautorefname{附录}%
\def\chapterautorefname{章}%
\def\sectionautorefname{节}%
\def\subsectionautorefname{小节}%
\def\subsubsectionautorefname{小小节}%
\def\paragraphautorefname{段落}%
\def\subparagraphautorefname{子段落}%
\def\FancyVerbLineautorefname{行}%
\def\theoremautorefname{定理}%
% 暂时不能处理引理，推论


\renewcommand{\@fnsymbol}[1]{
    \ifcase#1\or \text{①}\or \text{②}\or \text{③}\or    \text{④}\or \text{⑤}\or \text{⑥}\or \text{⑦}\or \text{⑧} \or \text{⑨} \or \text{⑩}
    \else
        \@ctrerr
    \fi
}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
