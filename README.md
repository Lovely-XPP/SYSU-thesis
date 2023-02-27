# 中山大学航空航天学院 $\LaTeX$ 毕业论文模板

## 介绍

本项目基于 [SYSU-SCC/sysu-thesis](https://github.com/SYSU-SCC/sysu-thesis) 进行个性化修改，修改标准参照上一届航空航天学院师兄word版毕业论文的板式。

(注：由于`newtext`宏包的原因，不支持Github Action在线编译)


## 如何使用

### texlive 编辑 (本地)

本模板需要使用 `texlive(>=2020)` 进行编译，编译命令如下：

```
make pdf
```

即可生成 `main.pdf` 文件。

### overleaf 编辑（在线）

本模板可以使用 [overleaf](https://www.overleaf.com/) 在线编辑，需要在 [releases](https://github.com/SYSU-SCC/sysu-thesis/releases) 页面提前下载 `Source code (zip)`。

步骤如下：

1. 进入 [overleaf](https://overleaf.com) 并登录账号
2. 左侧 `New Project` 选择 `Upload Project`
3. 上传 `.zip` 压缩包，建立新项目
4. 点击 `menu`，滑动到下方 `Settings` 的 `Compiler` 选择 `XeLaTeX`
5. 打开 `main.tex` 文件，点击中间右侧上方的 `Recompile` 进行编译
6. 如果顺利可以看到 pdf 的预览
7. 如果无法加载图片只有路径信息，点击 `Recompile` 旁边的倒三角，其中的 `Compile Mode` 选择 `Normal` 模式

此时可以得到完整的 `main.pdf` 文件。


## TODO List

- [ ] 增加 [overleaf](https://www.overleaf.com/) 等模板库的自动发布，可一键在 overleaf 中打开项目。
- [ ] 进一步优化代码，可支持多种需求

希望大家踊跃提出自己的想法，提交 pr，一起完善该 $\LaTeX$ 模板， Make **SYSU** Great Again！


## 相关规范

1. [本科生](./specifications/附件1.中山大学本科生毕业论文（设计）写作与印制规范.doc)
2. [研究生](http://graduate.sysu.edu.cn/rules)

## 关于展示

答辩展示的样式涉及到不同人的需求，且学校未对格式做要求，因此目前本仓库在 [presentation](./presentation/) 目录下提供了一个最简单的模板供大家学习和上手调整，在 overleaf 中使用时需要点击 `menu`，滑动到下方 `Settings` 的 `Main document` 选择 `presentation/pre.tex`。此处给出 [overleaf 的 Beamer 教程](https://overleaf.com/learn/latex/Beamer)。

我们欢迎大家自己定制一些符合自己要求的模板，并向我们提交 PR，在下方增加一个指向你的模板的链接作为推荐，参见 [#65](https://github.com/SYSU-SCC/sysu-thesis/issues/65) 。

- [Lovely-XPP/SYSU-PRE](https://github.com/Lovely-XPP/SYSU-PRE)
- [NelsonCheung-cn/SYSU-beamer-template](https://github.com/NelsonCheung-cn/SYSU-beamer-template)

## 致谢

1. 感谢[@chunkwong](https://github.com/chungkwong)师兄在 Github 上放出了中大第一个[非官方的本科论文 LaTex 模板](https://github.com/chungkwong/sysu_thesis)
2. 感谢[@guanyingc](https://github.com/guanyingc)师兄在模板结构化分解上作出了[极大的贡献](https://github.com/guanyingc/SYSU-LaTex-Thesis)
3. 感谢@huangjj27 师兄在模板样式规范化做出极大的贡献
4. 感谢@a20185 @Kinpzz @yttty @perqin @noeagles 等人[对 v4.6.0 作出极大的贡献](https://gitlab.com/sysu-gitlab/latex-group/thesis/merge_requests/32)
5. PPT 的模板源自<[Cumtb-Beamer](https://github.com/JinLingxi/Cumtb-Beamer)>
6. 最后, 感谢 Donald Ervin Knuth 教授发明了`tex`这么好(zhe)用(teng)的工具。
   Finally, thanks Prof. Donald Ervin Knuth for inventing such useful tool as tex.

## 错误反馈以及改进

1. 同学们如果在编译或者使用过程中遇到了一些问题，请参照[这里](ihttps://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way)的步骤尝试解决问题。如果还是没法解决，请开一个新issue汇报错误。
1. 如果您想参与项目的维护，我们强烈建议您发起访问请求(Access request)到本项目，即可成为本项目的开发人员! 我们***非常欢迎校友的加入***。
   或者，Fork本仓库到您的 github 仓库中，修改完成后给本项目提交`Merge Request`。

## 声明

1. 您可以任意地使用和修改这个模板，但该模板可能无法满足最新的《中山大学本科生毕业论文(设计)写作与印制规范》。
2. 目前项目组人手紧缺，**强烈欢迎校友们的加入**。
