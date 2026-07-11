% This work (LPSC_example.tex, LPSC_abstract.sty and LPSCshort_url.bst)
%     was created by Seth Humphries 13-Nov-2009 Copyright (C) 2009
%
% This work is licensed under the Creative Commons
% Attribution-Noncommercial-Share Alike 3.0 License. To view a copy
% of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/;
% or, (b) send a letter to Creative Commons, 171 2nd Street, Suite
% 300, San Francisco, California, 94105, USA.
%
%
%%%   Created and then modified by Seth Humphries
%%%     09-Nov-2009
%%%   used "--eprint --doi --inlinelinks --hyperref" options with urlbst
%%%   for Lunar and Planetary Science Conference abstracts
%%%   See <http://purl.org/nxg/dist/urlbst>
%%
%%% Modification of BibTeX style file LPSCshort_url.bst
%%% ... by urlbst, version 0.6-4 (marked with "% urlbst")
%%% See <http://purl.org/nxg/dist/urlbst>
%%% Added webpage entry type, and url and lastchecked fields.
%%% Added eprint support.
%%% Added hyperref support.
%%% Original headers follow...

%%
%% This is file 'LPSCshort.bst'
%% generated with the docstrip utility: makebst.tex.
%%
%%  created 09-Nov-2009 by Seth Humphries for use in LPSC abstracts
%%
%% The original source files were:
%%
%% merlin.mbs  (with options: `head,pres,pres-bf,seq-no,nm-init,ed-au,nmlm,x1,m1,dt-beg,yr-par,xmth,yrp-x,jtit-x,jxper,trnum-it,jpg-1,num-xser,bkpg-x,isbn,issn,doi,edparxc,bkedcap,edby-par,edcap,blk-com,com-blank,ppx,ed,abr,mth-bare,ord,jabr,amper,and-xcom,xand,etal-xc,plntx,,{}')
%% physjour.mbs  (with options: `pres,pres-bf,seq-no,nm-init,ed-au,nmlm,x1,m1,dt-beg,yr-par,xmth,yrp-x,jtit-x,jxper,trnum-it,jpg-1,num-xser,bkpg-x,isbn,issn,doi,edparxc,bkedcap,edby-par,edcap,blk-com,com-blank,ppx,ed,abr,mth-bare,ord,jabr,amper,and-xcom,xand,etal-xc,plntx,,{}')
%% geojour.mbs  (with options: `pres,pres-bf,seq-no,nm-init,ed-au,nmlm,x1,m1,dt-beg,yr-par,xmth,yrp-x,jtit-x,jxper,trnum-it,jpg-1,num-xser,bkpg-x,isbn,issn,doi,edparxc,bkedcap,edby-par,edcap,blk-com,com-blank,ppx,ed,abr,mth-bare,ord,jabr,amper,and-xcom,xand,etal-xc,plntx,,{}')
%% photjour.mbs  (with options: `pres,pres-bf,seq-no,nm-init,ed-au,nmlm,x1,m1,dt-beg,yr-par,xmth,yrp-x,jtit-x,jxper,trnum-it,jpg-1,num-xser,bkpg-x,isbn,issn,doi,edparxc,bkedcap,edby-par,edcap,blk-com,com-blank,ppx,ed,abr,mth-bare,ord,jabr,amper,and-xcom,xand,etal-xc,plntx,,{}')
%% merlin.mbs  (with options: `tail,pres,pres-bf,seq-no,nm-init,ed-au,nmlm,x1,m1,dt-beg,yr-par,xmth,yrp-x,jtit-x,jxper,trnum-it,jpg-1,num-xser,bkpg-x,isbn,issn,doi,edparxc,bkedcap,edby-par,edcap,blk-com,com-blank,ppx,ed,abr,mth-bare,ord,jabr,amper,and-xcom,xand,etal-xc,plntx,,{}')
%% ----------------------------------------
%% *** put something here ***
%%
%% Copyright 1994-2007 Patrick W Daly
 % ===============================================================
 % IMPORTANT NOTICE:
 % This bibliographic style (bst) file has been generated from one or
 % more master bibliographic style (mbs) files, listed above.
 %
 % This generated file can be redistributed and/or modified under the terms
 % of the LaTeX Project Public License Distributed from CTAN
 % archives in directory macros/latex/base/lppl.txt; either
 % version 1 of the License, or any later version.
 % ===============================================================
 % Name and version information of the main mbs file:
 % \ProvidesFile{merlin.mbs}[2007/04/24 4.20 (PWD, AO, DPC)]
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in ENGLISH
 % This is a numerical citation style, and as such is standard LaTeX.
 % It requires no extra package to interface to the main text.
 % The form of the \bibitem entries is
 %   \bibitem{key}...
 % Usage of \cite is as follows:
 %   \cite{key} ==>>          [#]
 %   \cite[chap. 2]{key} ==>> [#, chap. 2]
 % where # is a number determined by the ordering in the reference list.
 % The order in the reference list is that by which the works were originally
 %   cited in the text, or that in the database.
 %---------------------------------------------------------------------

ENTRY
  { address
    author
    booktitle
    chapter
    doi
    edition
    editor
    eid
    howpublished
    institution
    isbn
    issn
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    eprint % urlbst
    pubmed % urlbst
    url % urlbst
    lastchecked % urlbst
  }
  {}
  { label }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
STRINGS { urlintro eprinturl eprintprefix doiprefix doiurl pubmedprefix pubmedurl openinlinelink closeinlinelink } % urlbst...
INTEGERS { hrefform inlinelinks makeinlinelink addeprints adddoiresolver addpubmedresolver }
% Following constants may be adjusted by hand, if desired
FUNCTION {init.urlbst.variables}
{
  "Available from: " 'urlintro := % prefix before URL
  "http://arxiv.org/abs/" 'eprinturl := % prefix to make URL from eprint ref
  "arXiv:" 'eprintprefix := % text prefix printed before eprint ref
  "http://dx.doi.org/" 'doiurl := % prefix to make URL from DOI
  "doi" 'doiprefix :=      % text prefix printed before DOI ref
  "http://www.ncbi.nlm.nih.gov/pubmed/" 'pubmedurl := % prefix to make URL from PUBMED
  "PMID:" 'pubmedprefix :=      % text prefix printed before PUBMED ref
  #1 'addeprints :=         % 0=no eprints; 1=include eprints
  #0 'adddoiresolver :=     % 0=no DOI resolver; 1=include it
  #0 'addpubmedresolver :=     % 0=no PUBMED resolver; 1=include it
  #2 'hrefform :=           % 0=no crossrefs; 1=hypertex xrefs; 2=hyperref refs
  #1 'inlinelinks :=        % 0=URLs explicit; 1=URLs attached to titles
  % the following are internal state variables, not config constants
  #0 'makeinlinelink :=     % state variable managed by possibly.setup.inlinelink
  "" 'openinlinelink :=     % ditto
  "" 'closeinlinelink :=    % ditto
}
INTEGERS {
  bracket.state
  outside.brackets
  open.brackets
  within.brackets
  close.brackets
}
% ...urlbst to here
FUNCTION {init.state.consts}
{ #0 'outside.brackets := % urlbst
  #1 'open.brackets :=
  #2 'within.brackets :=
  #3 'close.brackets :=

  #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}
STRINGS { s t}
% urlbst
FUNCTION {output.nonnull.original}
{ 's :=
  output.state mid.sentence =
    { " " * write$ }
    { output.state after.block =
        { add.period$ write$
          %newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

% urlbst...
% The following three functions are for handling inlinelink.  They wrap
% a block of text which is potentially output with write$ by multiple
% other functions, so we don't know the content a priori.
% They communicate between each other using the variables makeinlinelink
% (which is true if a link should be made), and closeinlinelink (which holds
% the string which should close any current link.  They can be called
% at any time, but start.inlinelink will be a no-op unless something has
% previously set makeinlinelink true, and the two ...end.inlinelink functions
% will only do their stuff if start.inlinelink has previously set
% closeinlinelink to be non-empty.
FUNCTION {possibly.setup.inlinelink}
{ makeinlinelink
    { hrefform #1 = % hypertex
        { "\special {html:<a href=" quote$ * url * quote$ * "> }{" * 'openinlinelink :=
          "\special {html:</a>}" 'closeinlinelink :=
          }
        { hrefform #2 = % hyperref
            % the space between "} {" matters: a URL of just the right length can cause "\% newline em"
            { "\href{" url * "} {" * 'openinlinelink :=
              "}" 'closeinlinelink :=
              }
            'skip$
          if$ % hrefform #2 =
        }
      if$ % hrefform #1 =
      #0 'makeinlinelink :=
    }
    'skip$
 if$ % makeinlinelink
}
FUNCTION {add.inlinelink}
{ openinlinelink empty$
    'skip$
    { openinlinelink swap$ * closeinlinelink *
      "" 'openinlinelink :=
      }
  if$
}
FUNCTION {output.nonnull}
{ % Save the thing we've been asked to output
  's :=
  % If the bracket-state is close.brackets, then add a close-bracket to
  % what is currently at the top of the stack, and set bracket.state
  % to outside.brackets
  bracket.state close.brackets =
    { "]" *
      outside.brackets 'bracket.state :=
    }
    'skip$
  if$
  bracket.state outside.brackets =
    { % We're outside all brackets -- this is the normal situation.
      % Write out what's currently at the top of the stack, using the
      % original output.nonnull function.
      s
      add.inlinelink
      output.nonnull.original % invoke the original output.nonnull
    }
    { % Still in brackets.  Add open-bracket or (continuation) comma, add the
      % new text (in s) to the top of the stack, and move to the close-brackets
      % state, ready for next time (unless inbrackets resets it).  If we come
      % into this branch, then output.state is carefully undisturbed.
      bracket.state open.brackets =
        { " [" * }
        { ", " * } % bracket.state will be within.brackets
      if$
      s *
      close.brackets 'bracket.state :=
    }
  if$
}

% Call this function just before adding something which should be presented in
% brackets.  bracket.state is handled specially within output.nonnull.
FUNCTION {inbrackets}
{ bracket.state close.brackets =
    { within.brackets 'bracket.state := } % reset the state: not open nor closed
    { open.brackets 'bracket.state := }
  if$
}

FUNCTION {format.lastchecked}
{ lastchecked empty$
    { "" }
    { "cited " lastchecked * }
    %{ inbrackets "cited " lastchecked * }
  if$
}
% ...urlbst to here
FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {fin.entry.original}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}
FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  add.blank
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}
STRINGS {z}
FUNCTION {remove.dots}
{ 'z :=
  ""
  { z empty$ not }
  { z #1 #1 substring$
    z #2 global.max$ substring$ 'z :=
    duplicate$ "." = 'pop$
      { * }
    if$
  }
  while$
}
FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}
FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}
FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "\/}" * }
  if$
}
FUNCTION {bolden}
{ duplicate$ empty$
    { pop$ "" }
    { "{\bf " swap$ * "}" * }
  if$
}
FUNCTION {tie.or.space.prefix}
{ duplicate$ text.length$ #3 <
    { " " }
    { " " }
  if$
  swap$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }
 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 % The language selected here is ENGLISH
FUNCTION {bbl.and}
{ "and"}

FUNCTION {bbl.etal}
{ "et~al." }

FUNCTION {bbl.editors}
{ "eds." }

FUNCTION {bbl.editor}
{ "ed." }

FUNCTION {bbl.edby}
{ "edited by" }

FUNCTION {bbl.edition}
{ "edn." }

FUNCTION {bbl.volume}
{ "vol." }

FUNCTION {bbl.of}
{ "of" }

FUNCTION {bbl.number}
{ "no." }

FUNCTION {bbl.nr}
{ "no." }

FUNCTION {bbl.in}
{ "in" }

FUNCTION {bbl.pages}
{ "" }

FUNCTION {bbl.page}
{ "" }

FUNCTION {bbl.chapter}
{ "chap." }

FUNCTION {bbl.techrep}
{ "Tech. Rep." }

FUNCTION {bbl.mthesis}
{ "Master's thesis" }

FUNCTION {bbl.phdthesis}
{ "Ph.D. thesis" }

FUNCTION {bbl.first}
{ "1st" }

FUNCTION {bbl.second}
{ "2nd" }

FUNCTION {bbl.third}
{ "3rd" }

FUNCTION {bbl.fourth}
{ "4th" }

FUNCTION {bbl.fifth}
{ "5th" }

FUNCTION {bbl.st}
{ "st" }

FUNCTION {bbl.nd}
{ "nd" }

FUNCTION {bbl.rd}
{ "rd" }

FUNCTION {bbl.th}
{ "th" }

MACRO {jan} {"Jan."}

MACRO {feb} {"Feb."}

MACRO {mar} {"Mar."}

MACRO {apr} {"Apr."}

MACRO {may} {"May"}

MACRO {jun} {"Jun."}

MACRO {jul} {"Jul."}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sep."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}

FUNCTION {eng.ord}
{ duplicate$ "1" swap$ *
  #-2 #1 substring$ "1" =
     { bbl.th * }
     { duplicate$ #-1 #1 substring$
       duplicate$ "1" =
         { pop$ bbl.st * }
         { duplicate$ "2" =
             { pop$ bbl.nd * }
             { "3" =
                 { bbl.rd * }
                 { bbl.th * }
               if$
             }
           if$
          }
       if$
     }
   if$
}

 %-------------------------------------------------------------------
 % Begin module:
MACRO   {aa}    {"Astron.   \&  Astrophys."}
MACRO   {aao}   {"Atmos.    Ocean"}
MACRO   {aasup} {"Astron.   \&  Astrophys.  Suppl.  Ser."}
MACRO   {acmcs} {"ACM   Comput. Surv."}
MACRO   {acta}  {"Acta  Inf."}
MACRO   {actab} {"Spectrochim.  Acta,   Part    B"} %Spectrochimica Acta, Part B: Atomic Spectroscopy
MACRO   {adp}   {"Ann.  Phys.   (Leipzig)"}
MACRO   {advp}  {"Adv.  Phys."}
MACRO   {afmgb} {"Arch. Meteor. Geophys.    Bioklimatol."}
MACRO   {ag}    {"Ann.  Geophys."}
MACRO   {aisr}  {"Adv.  Space   Res."}
MACRO   {aj}    {"Astron.   J."}
MACRO   {ajm}   {"Amer. J.  Math."}
MACRO   {ajp}   {"Amer. J.  Phys."}
MACRO   {am}    {"Ann.  Math."}
MACRO   {amsci} {"Amer. Sci."}
MACRO   {andgeo}    {"Ann.  d.  Geophys."}
MACRO   {andmet}    {"Ann.  d.  Meteor."}
MACRO   {andphy}    {"Ann.  Phys.-Paris"}
MACRO   {angl}  {"Ann.  Glaciol."}
MACRO   {anigeo}    {"Ann.  Geofis."}
MACRO   {anofd} {"Ann.  Fluid   Dyn."}
MACRO   {ao}    {"Appl. Opt."}
MACRO   {ap}    {"Ann.  Phys.   (NY)"}
MACRO   {aph}   {"Acta  Phys."}
MACRO   {apj}   {"Astrophys.    J."}
MACRO   {apjsup}    {"Astrophys.    J.  Suppl."}
MACRO   {apl}   {"Appl. Phys.   Lett."}
MACRO   {app}   {"Astroparticle Phys."}
MACRO   {appopt}    {"Appl. Opt."}
MACRO   {apss}  {"Astrophys.    Space   Sci."}
MACRO   {araa}  {"Ann.  Rev.    Astron. Astrophys."}
MACRO   {as}    {"Appl. Spect."}
MACRO   {ass}   {"Astrophys.    Space   Sci."}
MACRO   {ASSL}  {"Adv.  Sol.-State  Lasers"}
MACRO   {atenv} {"Atmos.    Environ."}
MACRO   {atph}  {"Atm\'osphera"}
MACRO   {aujag} {"Aust. J.  Agr.    Res."}
MACRO   {aumet} {"Aust. Meteorol.   Mag."}
MACRO   {baas}  {"Bull. Amer.   Astron. Soc."}
MACRO   {bams}  {"Bull. Amer.   Meteorol.   Soc."}
MACRO   {baps}  {"Bull. Amer.   Phys.   Soc."}
MACRO   {bell}  {"Bell  Syst.   Tech.   J."}
MACRO   {blmet} {"Bound.-Lay.   Meteorol."}
MACRO   {cacm}  {"Commun.   ACM"}
MACRO   {cap}   {"Contrib.  Atmos.  Phys."}
MACRO   {cbul}  {"Climatol. Bull."}
MACRO   {cch}   {"Clim. Change"}
MACRO   {cdyn}  {"Clim. Dynam."}
MACRO   {CLEO}  {"CLEO"}
MACRO   {cmp}   {"Comm. Math.   Phys."}
MACRO   {cpam}  {"Commun.   Pure    Appl.   Math."}
MACRO   {cpc}   {"Comp. Phys.   Comm."}
MACRO   {cppcf} {"Comm. Plasma  Phys.   \&  Controlled  Fusion"}
MACRO   {cqg}   {"Class.    Quant.  Grav."}
MACRO   {cra}   {"C.    R.  Acad.   Sci.    A"}
MACRO   {dao}   {"Dynam.    Atmos.  Oceans"}
MACRO   {dhz}   {"Dtsch.    Hydrogr.    Z."}
MACRO   {dsr}   {"Deep-Sea  Res."}
MACRO   {ecms}  {"Estuarine Coastal Mar.    Sci."}
MACRO   {eco}   {"Ecology"}
MACRO   {ell}   {"Electron. Lett."}
MACRO   {empl}{"Earth,  Moon    and Planets"}
MACRO   {envres}    {"Environ.  Res."}
MACRO   {envst} {"Environ.  Sci.    Technol."}
MACRO   {expa}{"Exper.  Astron."}
MACRO   {fed}   {"Fusion    Eng.    \&  Design"}
MACRO   {ft}    {"Fusion    Tech."}
MACRO   {ga}    {"Geophysica"}
MACRO   {gafd}  {"Geophys.  Astrophys.  Fluid   Dyn."}
MACRO   {geogeo}    {"Geol. Geofiz."}
MACRO   {geoint}    {"Geofis.   Int."}
MACRO   {geomag}    {"Geophys.  Mag."}
MACRO   {geopub}    {"Geofys.   Publ."}
MACRO   {georl} {"Geophys.  Res.    Lett."}
MACRO   {gfd}   {"Geophys.  Fluid   Dyn."}
MACRO   {grg}   {"Gen.  Relativ.    Gravit."}
MACRO   {grl}   {"Geophys.  Res.    Lett."}
MACRO   {gs}    {"Geophysics"}
MACRO   {ibmjrd}    {"IBM   J.  Res.    Dev."}
MACRO   {ibmsj} {"IBM   Syst.~J."}
MACRO   {ieeens}    {"IEEE  Trans.  Nucl.   Sci."}
MACRO   {ieeeps}    {"IEEE  Trans.  Plasma  Sci."}
MACRO   {ieeese}    {"IEEE  Trans.  Software    Eng."}
MACRO   {ieeetap}   {"IEEE  Trans.  Antenn. Propag."}
MACRO   {ieeetc}    {"IEEE  Trans.  Comput."}
MACRO   {ieeetcad}  {"IEEE  Trans.  Comput. Aid.    Des."}
MACRO   {ijawp} {"Int.  J.  Air Water   Pollut."}
MACRO   {ijc}   {"Int.  J.  Climatol."}
MACRO   {ijimw} {"Interntl. J.  Infrared    \&  Millimeter  Waves"}
MACRO   {ijrs}  {"Int.  J.  Remote  Sens."}
MACRO   {inc}   {"Nuovo Cimento"}
MACRO   {ip}    {"Infrared  Phys."}
MACRO   {ipl}   {"Inf.  Process.    Lett."}
MACRO   {irp}   {"Infrared  Phys."}
MACRO   {jacm}  {"J.~ACM"}
MACRO   {jaes}  {"J.    Aeronaut.   Sci."}
MACRO   {jam}   {"J.    Appl.   Meteorol."}
MACRO   {jaot}  {"J.    Atmos.  Ocean.  Technol."}
MACRO   {jap}   {"J.    Appl.   Phys."}
MACRO   {japca} {"J.    Air Pollut. Control Assoc."}
MACRO   {jas}   {"J.    Atmos.  Sci."}
MACRO   {jasa}  {"J.    Acoust. Soc.    America"}
MACRO   {jasp}  {"J.    Appl.   Spectr."}
MACRO   {jastp} {"J.    Atmos.  Solar-Terr. Phys."}
MACRO   {jatp}  {"J.    Atmos.  Terr.   Phys."}
MACRO   {jcam}  {"J.    Climate Appl.   Meteor."}
MACRO   {jce}   {"J.    Climate"}
MACRO   {jcm}   {"J.    Climate Meteor."}
MACRO   {jcp}   {"J.    Comp.   Phys."}
MACRO   {jcss}  {"J.~Comput.    Syst.   Sci."}
MACRO   {jcy}   {"J.    Climatol."}
MACRO   {jdp}   {"J.    Phys.   (Paris)"}
MACRO   {jetp}  {"Sov.  Phys.--JETP"}
MACRO   {jfe}   {"J.    Fusion  Energy"}
MACRO   {jfm}   {"J.    Fluid   Mech."}
MACRO   {jga}   {"J.    Glaciol."}
MACRO   {jgr}   {"J.    Geophys.    Res."}
MACRO   {jh}    {"J.    Hydrol."}
MACRO   {jlwt}  {"J.    Lightwave   Technol."}
MACRO   {jm}    {"J.    Meteor."}
MACRO   {jmo}   {"J.    Mod.    Opt."}
MACRO   {jmp}   {"J.    Math.   Phys."}
MACRO   {jmr}   {"J.    Mar.    Res."}
MACRO   {jmrj}  {"J.    Meteor. Res.    Japan"}
MACRO   {jmsj}  {"J.    Meteorol.   Soc.    Japan"}
MACRO   {jmts}  {"J.    Mar.    Technol.    Soc."}
MACRO   {jne}   {"J.    Nucl.   Energy"}
MACRO   {jnec}  {"J.    Nucl.   Energy, C:  Plasma  Phys.,  Accelerators,   Thermonucl. Res."}
MACRO   {jnm}   {"J.    Nucl.   Mat."}
MACRO   {josa}  {"J.    Opt.    Soc.    America"}
MACRO   {josaa} {"J.    Opt.    Soc.    Amer.~A"}
MACRO   {josab} {"J.    Opt.    Soc.    Amer.~B"}
MACRO   {josj}  {"J.    Oceanogr.   Soc.    Japan"}
MACRO   {jpc}   {"J.    Phys.   Chem."}
MACRO   {jpo}   {"J.    Phys.   Oceanogr."}
MACRO   {jpp}   {"J.    Plasma  Phys."}
MACRO   {jpsj}  {"J.    Phys.   Soc.    Japan"}
MACRO   {jqe}   {"IEEE  J.  Quantum Electron."}
MACRO   {jra}   {"J.    Rech.   Atmos."}
MACRO   {jsi}   {"J.    Sci.    Instrum."}
MACRO   {jvst}  {"J.    Vac.    Sci.    \&  Tech."}
MACRO   {jwm}   {"J.    Wea.    Mod."}
MACRO   {lao}   {"Limnol.   Oceanogr."}
MACRO   {map}   {"Meteorol. Atmos.  Phys."}
MACRO   {mau}   {"Mausam"}
MACRO   {meteor}    {"``Meteor''    Forschungsergeb."}
MACRO   {metgid}    {"Meteor.   Gidrol."}
MACRO   {metmag}    {"Meteor.   Mag."}
MACRO   {metmon}    {"Meteor.   Monogr."}
MACRO   {metrun}    {"Meteor.   Rundsch."}
MACRO   {metzeit}   {"Meteor.   Z."}
MACRO   {mwl}   {"Mar.  Wea.    Log"}
MACRO   {mwr}   {"Mon.  Weather Rev."}
MACRO   {nat}   {"Nature"}
MACRO   {nature}    {"Nature"}
MACRO   {nc}    {"Nuovo Cimento"}
MACRO   {nedf}  {"Nucl. Eng.    \&  Design/Fusion"}
MACRO   {nf}    {"Nucl. Fusion"}
MACRO   {nim}   {"Nucl. Inst.   \&  Meth."}
MACRO   {nimpr} {"Nucl. Inst.   \&  Meth.   in  Phys.   Res."}
MACRO   {np}    {"Nucl. Phys."}
MACRO   {npb}   {"Nucl. Phys.   B"}
MACRO   {npbpc} {"Nucl. Phys.   B   (Proc.  Suppl.)"}
MACRO   {npg}   {"Nonlin.   Proc.   Geophys."}
MACRO   {nt/f}  {"Nucl. Tech./Fusion"}
MACRO   {nwd}   {"Natl. Weather Dig."}
MACRO   {nzjmfr}    {"New   Zeal.   J.  Mar.    Freshwater  Res."}
MACRO   {oc}    {"Opt.  Commun."}
MACRO   {ocac}  {"Oceanol.  Acta"}
MACRO   {oceanus}   {"Oceanus"}
MACRO   {ol}    {"Opt.  Lett."}
MACRO   {om}    {"Oceanogr. Meteorol."}
MACRO   {OSA}   {"OSA"}
MACRO   {pag}   {"Pure  Appl.   Geophys."}
MACRO   {paleoc}    {"Paleoceanography"}
MACRO   {pce}   {"Phys. Chem.   Earth"}
MACRO   {pf}    {"Phys. Fluids"}
MACRO   {pfa}   {"Phys. Fluids  A:  Fluid   Dyn."}
MACRO   {pfb}   {"Phys. Fluids  B:  Plasma  Phys."}
MACRO   {phitrsl}   {"Philos.   Trans.  Roy.    Soc.    London"}
MACRO   {phtl}  {"IEEE  Photon. Technol.    Lett."}
MACRO   {physrev}   {"Phys. Rev."}
MACRO   {physzeit}  {"Phys. Z."}
MACRO   {pl}    {"Phys. Lett."}
MACRO   {pla}   {"Phys. Lett.   A"}
MACRO   {plb}   {"Phys. Lett.   B"}
MACRO   {pmg}   {"Pap.  Meteor. Geophys."}
MACRO   {pnas}  {"Proc. Nat.    Acad.   Sci.    USA"}
MACRO   {pp}    {"Phys. Plasmas"}
MACRO   {ppcf}  {"Plasma    Phys.   \&  Controlled  Fusion"}
MACRO   {ppom}  {"Pap.  Phys.   Oceanogr.   Meteor."}
MACRO   {pps}   {"Planet.   Space   Sci."}
MACRO   {pr}    {"Phys. Rev."}
MACRO   {pra}   {"Phys. Rev.    A"}
MACRO   {prb}   {"Phys. Rev.    B"}
MACRO   {prc}   {"Phys. Rev.    C"}
MACRO   {prd}   {"Phys. Rev.    D"}
MACRO   {pre}   {"Phys. Rev.    E"}
MACRO   {prep}  {"Phys. Rep."}
MACRO   {prl}   {"Phys. Rev.    Lett."}
MACRO   {procrsl}   {"Proc. Roy.    Soc.    London"}
MACRO   {ps}    {"Phys. Scripta"}
MACRO   {pspie} {"Proc. Soc.    Photo-Opt.  Instrum.    Eng."}
MACRO   {pss}   {"Planet.   Space   Sci."}
MACRO   {qjrms} {"Quart.    J.  Roy.    Meteorol.   Soc."}
MACRO   {quatres}   {"Quat. Res."}
MACRO   {rdgeo} {"Rev.  Geofis."}
MACRO   {revmeta}   {"Rev.  Meteorol."}
MACRO   {rgeo}  {"Rev.  Geophys."}
MACRO   {rgsp}  {"Rev.  Geophys.    Space   Phys."}
MACRO   {rmp}   {"Rev.  Mod.    Phys."}
MACRO   {rsci}  {"Radio Sci."}
MACRO   {rse}   {"Remote    Sens.   Environ."}
MACRO   {rsi}   {"Rev.  Sci.    Inst."}
MACRO   {sam}   {"Stud. Appl.   Math."}
MACRO   {sciam} {"Sci.  Am."}
MACRO   {science}   {"Science"}
MACRO   {scp}   {"Sci.  Comput. Program."}
MACRO   {sgp}{"Surveys  in  Geophys."}
MACRO   {sicomp}    {"SIAM  J.  Comput."}
MACRO   {sjot}  {"Sov.  J.  Opt.    Technol."}
MACRO   {sjpp}  {"Sov.  J.  Plasma  Phys."}
MACRO   {sjqe}  {"Sov.  J.  Quantum Electron."}
MACRO   {sleb}  {"Sov.  Phys.--Leb. Inst.   Rep."}
MACRO   {sp}    {"Solar Phys."}
MACRO   {spd}   {"Sov.  Phys.--Doklady"}
MACRO   {sptp}  {"Sov.  Phys.--Tech.    Phys."}
MACRO   {spu}   {"Sov.  Phys.--Uspeki"}
MACRO   {sse}   {"Solid-State   Electron."}
MACRO   {ssr}   {"Space Sci.    Rev."}
MACRO   {st}    {"Sky   and Telesc."}
MACRO   {stph}  {"Sov.  Phys.--Techn.   Phys."}
MACRO   {stphl} {"Sov.  Techn.  Phys.   Lett."}
MACRO   {tac}   {"Theor.    Appl.   Climatol."}
MACRO   {tagu}  {"Trans.    Am. Geophys.    Union   (EOS)"}
MACRO   {tcs}   {"Theor.    Comput. Sci."}
MACRO   {tellus}    {"Tellus"}
MACRO   {tocs}  {"ACM   Trans.  Comput. Syst."}
MACRO   {tods}  {"ACM   Trans.  Database    Syst."}
MACRO   {tog}   {"ACM   Trans.  Graphic."}
MACRO   {toms}  {"ACM   Trans.  Math.   Software"}
MACRO   {toois} {"ACM   Trans.  Office  Inf.    Syst."}
MACRO   {toplas}    {"ACM   Trans.  Progr.  Lang.   Syst."}
MACRO   {vr}    {"Vision    Res."}
MACRO   {wafc}  {"Weather   Forecast."}
MACRO   {weather}   {"Weather"}
MACRO   {wmob}  {"WMO   Bull."}
MACRO   {wrr}   {"Water Resour. Res."}
MACRO   {ww}    {"Weatherwise"}
MACRO   {zeitmet}   {"Z.    Meteorol."}
MACRO   {zph}   {"Z.    f.  Physik"}
MACRO   {zphb}  {"Z.    f.  Physik~B"}
MACRO   {zphd}  {"Z.    f.  Physik~D"}


FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}
FUNCTION {bibinfo.warn}
{ swap$
  duplicate$ missing$
    {
      swap$ "missing " swap$ * " in " * cite$ * warning$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ "empty " swap$ * " in " * cite$ * warning$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}
INTEGERS { nameptr namesleft numnames }

FUNCTION {check.speaker}
{ key empty$ 'skip$
  { key nameptr int.to.str$ =
    {
      bolden
    }
      'skip$
    if$
  }
  if$
}


STRINGS  {bibinfo}

FUNCTION {format.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f. }{vv}{ll}{, jj}" %
      format.name$
      bibinfo bibinfo.check
      type$ "presentation" =
        { check.speaker }
        'skip$
      if$
      't :=
      nameptr #1 >
        {
          nameptr #1
          #1 + =
          numnames #1
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "," *
              t "others" =
                {
                  " " * bbl.etal *
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}
FUNCTION {format.names.ed}
{
  format.names
}
FUNCTION {format.authors}
{ author "author" format.names
}
FUNCTION {get.bbl.editor}
{ editor num.names$ #1 > 'bbl.editors 'bbl.editor if$ }

FUNCTION {format.editors}
{ editor "editor" format.names duplicate$ empty$ 'skip$
    {
      " " *
      get.bbl.editor
      capitalize
   "(" swap$ * ")" *
      *
    }
  if$
}
FUNCTION {format.isbn}
{ isbn "isbn" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "ISBN " swap$ *
    }
  if$
}

FUNCTION {format.issn}
{ issn "issn" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "ISSN " swap$ *
    }
  if$
}

FUNCTION {format.note}
{
 note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      note #2 global.max$ substring$ * "note" bibinfo.check
    }
  if$
}

FUNCTION {format.title}
{ title
  duplicate$ empty$ 'skip$
    { "t" change.case$ }
  if$
  "title" bibinfo.check
}
FUNCTION {output.bibitem.original}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{
  't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in
  " " * }

FUNCTION {format.date}
{
  ""
  duplicate$ empty$
  year  "year"  bibinfo.check duplicate$ empty$
    { swap$ 'skip$
        { "there's a month but no year in " cite$ * warning$ }
      if$
      *
    }
    { swap$ 'skip$
        {
          swap$
          " " * swap$
        }
      if$
      *
      remove.dots
    }
  if$
  duplicate$ empty$
    'skip$
    {
      before.all 'output.state :=
    " (" swap$ * ")" *
    }
  if$
}
FUNCTION {format.btitle}
{ title "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      emphasize
    }
  if$
}
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.prefix
      "volume" bibinfo.check * *
      series "series" bibinfo.check
      duplicate$ empty$ 'pop$
        { swap$ bbl.of space.word * swap$
          emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { series empty$
            { number "number" bibinfo.check }
            { output.state mid.sentence =
                { bbl.number }
                { bbl.number capitalize }
              if$
              number tie.or.space.prefix "number" bibinfo.check * *
              bbl.in space.word *
              series "series" bibinfo.check *
            }
          if$
        }
      if$
    }
    { "" }
  if$
}
FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

FUNCTION {convert.edition}
{ extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bbl.first 't := }
    { s "second" = s "2" = or
        { bbl.second 't := }
        { s "third" = s "3" = or
            { bbl.third 't := }
            { s "fourth" = s "4" = or
                { bbl.fourth 't := }
                { s "fifth" = s "5" = or
                    { bbl.fifth 't := }
                    { s #1 #1 substring$ is.num
                        { s eng.ord 't := }
                        { edition 't := }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  t
}

FUNCTION {format.edition}
{ edition duplicate$ empty$ 'skip$
    {
      convert.edition
      output.state mid.sentence =
        { "l" }
        { "t" }
      if$ change.case$
      "edition" bibinfo.check
      " " * bbl.edition *
    }
  if$
}
INTEGERS { multiresult }
FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}
FUNCTION {format.pages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        {
          n.dashify
        }
        {
        }
      if$
      "pages" bibinfo.check
    }
  if$
}
FUNCTION {first.page}
{ 't :=
  ""
    {  t empty$ not t #1 #1 substring$ "-" = not and }
    { t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
  while$
}

FUNCTION {format.journal.pages}
{ pages duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$
        { pop$ pop$ format.pages }
        {
          ":" *
          swap$
          first.page
          "pages" bibinfo.check
          *
        }
      if$
    }
  if$
}
FUNCTION {format.journal.eid}
{ eid "eid" bibinfo.check
  duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$ 'skip$
      {
          ":" *
      }
      if$
      swap$ *
    }
  if$
}
FUNCTION {format.vol.num.pages}
{ volume field.or.null
  duplicate$ empty$ 'skip$
    {
      "volume" bibinfo.check
    }
  if$
  number "number" bibinfo.check duplicate$ empty$ 'skip$
    {
      swap$ duplicate$ empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
      swap$
      "(" swap$ * ")" *
    }
  if$ *
  eid empty$
    { format.journal.pages }
    { format.journal.eid }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$
          "type" bibinfo.check
        }
      if$
      chapter tie.or.space.prefix
      "chapter" bibinfo.check
      * *
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.booktitle}
{
  booktitle "booktitle" bibinfo.check
  emphasize
}
FUNCTION {format.in.ed.booktitle}
{ format.booktitle duplicate$ empty$ 'skip$
    {
      editor "editor" format.names.ed duplicate$ empty$ 'pop$
        {
          bbl.edby
          capitalize
          " " * swap$ *
          "(" swap$ * ")" *
          swap$
          " " * swap$
          * }
      if$
      word.in swap$ *
    }
  if$
}
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}
FUNCTION {format.thesis.type}
{ type duplicate$ empty$
    'pop$
    { swap$ pop$
      "t" change.case$ "type" bibinfo.check
    }
  if$
}
FUNCTION {format.tr.number}
{ number "number" bibinfo.check
  type duplicate$ empty$
    { pop$ bbl.techrep }
    'skip$
  if$
  "type" bibinfo.check
  swap$ duplicate$ empty$
    { pop$ "t" change.case$ }
    { tie.or.space.prefix * * }
  if$
}
FUNCTION {format.article.crossref}
{
  key duplicate$ empty$
    { pop$
      journal duplicate$ empty$
        { "need key or journal for " cite$ * " to crossref " * crossref * warning$ }
        { "journal" bibinfo.check emphasize word.in swap$ * }
      if$
    }
    { word.in swap$ * " " *}
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.crossref.editor}
{ editor #1 "{vv}{ll}" format.name$
  "editor" bibinfo.check
  editor num.names$ duplicate$
  #2 >
    { pop$
      "editor" bibinfo.check
      " " * bbl.etal
      *
    }
    { #2 <
        'skip$
        { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            {
              "editor" bibinfo.check
              " " * bbl.etal
              *
            }
            {
              " \& "
              * editor #2 "{vv}{ll}" format.name$
              "editor" bibinfo.check
              *
            }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.book.crossref}
{ volume duplicate$ empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      pop$ word.in
    }
    { bbl.volume
      swap$ tie.or.space.prefix "volume" bibinfo.check * * bbl.of space.word *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { series emphasize * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.incoll.inproc.crossref}
{
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { format.booktitle duplicate$ empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
            }
            { word.in swap$ * }
          if$
        }
        { word.in key * " " *}
      if$
    }
    { word.in format.crossref.editor * " " *}
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.org.or.pub}
{ 't :=
  ""
  address empty$ t empty$ and
    'skip$
    {
      t empty$
        { address "address" bibinfo.check *
        }
        { t *
          address empty$
            'skip$
            { ", " * address "address" bibinfo.check * }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.publisher.address}
{ publisher "publisher" bibinfo.warn format.org.or.pub
}

FUNCTION {format.organization.address}
{ organization "organization" bibinfo.check format.org.or.pub
}

% urlbst...
% Functions for making hypertext links.
% In all cases, the stack has (link-text href-url)
%
% make 'null' specials
FUNCTION {make.href.null}
{
  pop$
}
% make hypertex specials
FUNCTION {make.href.hypertex}
{
  "\special {html:<a href=" quote$ *
  swap$ * quote$ * "> }" * swap$ *
  "\special {html:</a>}" *
}
% make hyperref specials
FUNCTION {make.href.hyperref}
{
  "\href {" swap$ * "} {\path{" * swap$ * "}}" *
}
FUNCTION {make.href}
{ hrefform #2 =
    'make.href.hyperref      % hrefform = 2
    { hrefform #1 =
        'make.href.hypertex  % hrefform = 1
        'make.href.null      % hrefform = 0 (or anything else)
      if$
    }
  if$
}

% If inlinelinks is true, then format.url should be a no-op, since it's
% (a) redundant, and (b) could end up as a link-within-a-link.
FUNCTION {format.url}
{ inlinelinks #1 = url empty$ or
   { "" }
   { hrefform #1 =
       { % special case -- add HyperTeX specials
         urlintro "\url{" url * "}" * url make.href.hypertex * }
       { urlintro "\url{" * url * "}" * }
     if$
   }
  if$
}

FUNCTION {format.eprint}
{ eprint empty$
    { "" }
    { eprintprefix eprint * eprinturl eprint * make.href }
  if$
}

%FUNCTION {format.doi}
%{ doi "doi" bibinfo.check
%  duplicate$ empty$ 'skip$
%    {
%      "\doi{" swap$ * "}" *
%    }
%  if$
%}

FUNCTION {format.doi}
{ doi empty$
    { "" }
    { doiprefix doiurl doi * make.href }
    %{ doiprefix doi* doiurl doi * make.href }
  if$
}

FUNCTION {format.pubmed}
{ pubmed empty$
    { "" }
    { pubmedprefix pubmed * pubmedurl pubmed * make.href }
  if$
}

% Output a URL.  We can't use the more normal idiom (something like
% `format.url output'), because the `inbrackets' within
% format.lastchecked applies to everything between calls to `output',
% so that `format.url format.lastchecked * output' ends up with both
% the URL and the lastchecked in brackets.
FUNCTION {output.url}
{ url empty$
    'skip$
    { new.block
      format.url output
      format.lastchecked output
    }
  if$
}

FUNCTION {output.web.refs}
{
  new.block
  output.url
  addeprints eprint empty$ not and
    { format.eprint output.nonnull }
    'skip$
  if$
  adddoiresolver doi empty$ not and
    { format.doi output.nonnull }
    'skip$
  if$
  addpubmedresolver pubmed empty$ not and
    { format.pubmed output.nonnull }
    'skip$
  if$
}

% Wrapper for output.bibitem.original.
% If the URL field is not empty, set makeinlinelink to be true,
% so that an inline link will be started at the next opportunity
FUNCTION {output.bibitem}
{ outside.brackets 'bracket.state :=
  output.bibitem.original
  inlinelinks url empty$ not and
    { #1 'makeinlinelink := }
    { #0 'makeinlinelink := }
  if$
}

% Wrapper for fin.entry.original
FUNCTION {fin.entry}
{ output.web.refs  % urlbst
  makeinlinelink       % ooops, it appears we didn't have a title for inlinelink
    { possibly.setup.inlinelink % add some artificial link text here, as a fallback
      "[link]" output.nonnull }
    'skip$
  if$
  bracket.state close.brackets = % urlbst
    { "]" * }
    'skip$
  if$
  fin.entry.original
}

% Webpage entry type.
% Title and url fields required;
% author, note, year, month, and lastchecked fields optional
% See references
%   ISO 690-2 http://www.nlc-bnc.ca/iso/tc46sc9/standard/690-2e.htm
%   http://www.classroom.net/classroom/CitingNetResources.html
%   http://neal.ctstateu.edu/history/cite.html
%   http://www.cas.usf.edu/english/walker/mla.html
% for citation formats for web pages.
FUNCTION {webpage}
{ output.bibitem
  author empty$
    { editor empty$
        'skip$  % author and editor both optional
        { format.editors output.nonnull }
      if$
    }
    { editor empty$
        { format.authors output.nonnull }
        { "can't use both author and editor fields in " cite$ * warning$ }
      if$
    }
  if$
  new.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$
  format.title "title" output.check
  inbrackets "online" output
  new.block
  year empty$
    'skip$
    { format.date "year" output.check }
  if$
  % We don't need to output the URL details ('lastchecked' and 'url'),
  % because fin.entry does that for us, using output.web.refs.  The only
  % reason we would want to put them here is if we were to decide that
  % they should go in front of the rather miscellaneous information in 'note'.
  new.block
  note output
  fin.entry
}
% ...urlbst to here


FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  format.date "year" output.check
  date.block
  crossref missing$
    {
      journal
      remove.dots
      "journal" bibinfo.check
      emphasize
      "journal" output.check
      possibly.setup.inlinelink format.vol.num.pages output% urlbst
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  format.issn output
  format.doi output
  format.note output
  fin.entry
}
FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      add.blank
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.date "year" output.check
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.number.series output
      format.publisher.address output
    }
    {
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.isbn output
  format.doi output
  format.note output
  fin.entry
}
FUNCTION {booklet}
{ output.bibitem
  format.authors output
  format.date output
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.title "title" output.check
  howpublished "howpublished" bibinfo.check output
  address "address" bibinfo.check output
  format.isbn output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.date "year" output.check
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  crossref missing$
    {
      format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      format.number.series output
      format.publisher.address output
    }
    {
      format.chapter.pages "chapter and pages" output.check
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  crossref missing$
    { format.isbn output }
    'skip$
  if$
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  format.date "year" output.check
  date.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      format.publisher.address output
      format.edition output
      format.isbn output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  format.doi output
  format.note output
  fin.entry
}
FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  format.date "year" output.check
  date.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.pages output
      publisher empty$
        { format.organization.address output }
        { organization "organization" bibinfo.check output
          format.publisher.address output
        }
      if$
      format.isbn output
      format.issn output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  format.doi output
  format.note output
  fin.entry
}
FUNCTION {conference} { inproceedings }
FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization "organization" bibinfo.check
      duplicate$ empty$ 'pop$
        { output
          address "address" bibinfo.check output
        }
      if$
    }
    { format.authors output.nonnull }
  if$
  format.date output
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  author empty$
    { organization empty$
        {
          address "address" bibinfo.check output
        }
        'skip$
      if$
    }
    {
      organization "organization" bibinfo.check output
      address "address" bibinfo.check output
    }
  if$
  format.edition output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  format.date "year" output.check
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.btitle
  "title" output.check
  bbl.mthesis format.thesis.type output.nonnull
  school "school" bibinfo.warn output
  address "address" bibinfo.check output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  format.date output
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.title output
  howpublished "howpublished" bibinfo.check output
  format.doi output
  format.note output
  fin.entry
  empty.misc.check
}
FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  format.date "year" output.check
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.btitle
  "title" output.check
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" bibinfo.warn output
  address "address" bibinfo.check output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {presentation}
{ output.bibitem
  format.authors output
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.title output
  format.organization.address "organization and address" output.check
  month "month" output.check
  year "year" output.check
  format.note output
  new.sentence
  type missing$ 'skip$
  {"(" type capitalize * ")" * output}
    if$
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization "organization" bibinfo.check output
    }
    { format.editors output.nonnull }
  if$
  format.date "year" output.check
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  editor empty$
    { publisher empty$
        {
          format.publisher.address output
        }
      if$
    }
    { publisher empty$
        {
          format.organization.address output }
        {
          organization "organization" bibinfo.check output
          format.publisher.address output
        }
      if$
     }
  if$
  format.isbn output
  format.issn output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  format.date "year" output.check
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.title
  "title" output.check
  format.tr.number emphasize output.nonnull
  institution "institution" bibinfo.warn output
  address "address" bibinfo.check output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  format.date output
  date.block
  title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
  format.title "title" output.check
  format.doi output
  format.note "note" output.check
  fin.entry
}

FUNCTION {default.type} { misc }
READ
STRINGS { longest.label }
INTEGERS { number.label longest.label.width }
FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}
FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}
EXECUTE {initialize.longest.label}
ITERATE {longest.label.pass}
FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" *
  write$ newline$
  "\expandafter\ifx\csname urlstyle\endcsname\relax"
  write$ newline$
  "  \expandafter\ifx\csname doi\endcsname\relax"
  write$ newline$
  "  \def\doi#1{doi:\discretionary{}{}{}#1}\fi \else"
  write$ newline$
  "  \expandafter\ifx\csname doi\endcsname\relax"
  write$ newline$
  "  \def\doi{doi:\discretionary{}{}{}\begingroup \urlstyle{rm}\Url}\fi \fi"
  write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.urlbst.variables}
EXECUTE {init.state.consts}
ITERATE {call.type$}
FUNCTION {end.bib}
{ %newline$
  "\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}

%% End of customized bst file
%%
%% End of file `test_short.bst'.
