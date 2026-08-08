# UIU CSE Exam Paper Template

A LaTeX template for typesetting UIU CSE final/midterm exam papers,
built around a small set of custom macros so questions stay consistent
and easy to edit without touching raw LaTeX formatting each time.

## Folder structure
.
├── main.tex # Document shell — header, title block, \input list
├── preamble/
│ └── exam-macros.sty # All custom macros (do not edit unless changing style)
├── assests/
│ └── uiu_logo.png # University logo
└── questions/
├── question1.tex
├── question2.tex
├── question3.tex
├── question4.tex
└── question5.tex

## How to edit a question

Open the relevant file in `questions/` and edit the content directly.
Keep the `\question{}{}` and `\subquestion{}{}` calls at the top of
each part — the numbering and mark display depend on them.

## How to add a new question

1. Create a new file, e.g. `questions/question6.tex`.
2. Start it with `\question{6}{marks}` (see existing files for the pattern).
3. Add `\input{questions/question6}` at the bottom of `main.tex`.

## How to remove or reorder questions

Comment out or reorder the `\input{...}` lines near the bottom of `main.tex`.

## Macro reference

### `\question{number}{marks}`
Top-level question header.
```latex
\question{1}{4 + 6 = 10}
```

### `\subquestion{letter}{marks}`
Sub-part header inside a question.
```latex
\subquestion{a}{4}
```

### `javafile` environment
A titled code box for a Java file.
```latex
\begin{javafile}{Shape.java}
public class Shape { ... }
\end{javafile}
```

### `splitcode` environment
Two-column "given code" vs "complete the code" layout.
```latex
\begin{splitcode}{Given Code}{Complete the Code}
\begin{lstlisting}
// left-hand code
\end{lstlisting}
\splitdivider
\begin{lstlisting}
// right-hand code
\end{lstlisting}
\end{splitcode}
```

### `iotable` environment
Sample Input / Output trace table. Rows follow standard tabular syntax.
```latex
\begin{iotable}
Enter index (0-2): 0 & Result = 10 \\ \hline
\end{iotable}
```

### `expectedoutput` environment
Framed console-output box.
```latex
\begin{expectedoutput}
> Result: 20
\end{expectedoutput}
```

### `\umlclass{Name}{fields}{methods}{x}{y}`
UML class box for use inside a `tikzpicture`. `x`/`y` are coordinates in cm.
```latex
\begin{tikzpicture}
  \umlclass{Product}
           {- name : String\\ - price : double}
           {+ getPrice() : double}
           {0}{0}
\end{tikzpicture}
```
Connect two boxes with an inheritance arrow:
```latex
\draw[inherits] (Subclass) -- (Superclass);
```

## Marks / CO tagging convention

Keep mark values inside the `\question`/`\subquestion` arguments only —
don't hardcode `[X Marks]` text manually elsewhere. If tagging Course
Outcomes (CO1, CO2, ...), append them after the marks argument in square
brackets in your own section text, e.g. `\subquestion{a}{4} [CO1]`.~~~~