
.SUFFIXES: .tex .dvi .ps .pdf

.PHONY: clean realclean clobber force

DRV = driver.tex
SRCS = ${DRV}
BIB  = ${DRV:.tex=.bib}
DEPS = ${SRCS} ${BIB}

# file targets

LOPTS = 
DOPTS = 
POPTS = 

LATEX = pdflatex --interaction=nonstopmode ${DRV}
BIBTEX = bibtex

.tex.pdf:; ${LATEX} ${LOPTS} $<

default: 
	${LATEX} ${DRV:.tex=}
	${BIBTEX} ${DRV:.tex=}
	${LATEX} ${DRV:.tex=}
	${LATEX} ${DRV:.tex=}
	${BIBTEX} ${DRV:.tex=}
	${LATEX} ${DRV:.tex=}

bib:
	${BIBTEX} ${DRV:.tex=}

draft: driver.pdf
	cp -a driver.pdf ../IAA-PDC-25-0X-XX_draft.pdf

final: driver.pdf
	cp -a driver.pdf ../IAA-PDC-25-0X-XX.pdf

#force: 
#	for f in ${SRCS:.tex=}; do \
#	  [ -f $${f}.log ] && grep -q "Rerun" $${f}.log && /bin/sleep 1s && /bin/touch $${f}.tex && ${MAKE} $${f}.dvi; \
#	done; echo $$?; 

ref_loop: 
	@for f in ${SRCS:.tex=}; do \
	  if [ -f $${f}.log ] && grep -q "Rerun" $${f}.log ; then \
	    echo "LaTeX induced remake of $${f}.tex..."; \
	    /bin/sleep 1s && /bin/touch $${f}.tex && ${MAKE} $${f}.dvi; \
	  fi; \
	done && echo "LaTeX induced remake unnecessary."

clean:
	-${RM} *.{aux,log,blg,pfg}

realclean: clean
	-${RM} *.{lo{t,f,a},toc,idx,out,glo}

clobber:  realclean
	-${RM} *.{dvi,ps,pdf,bbl,piz}
