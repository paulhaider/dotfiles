(** User Mathematica initialization file **)

If[ !TrueQ[$Notebooks],
  gvexec = (Export[##2]; Run["(" <> #1 <> " " <> #2 <> "; rm " <> #2 <> ")&"]; #3)&;
  gvfmt[FeynArts`FeynArtsGraphics[_][__]] = gvexec["gv", #1 <> ".ps", #2, "PS"]&;
  _gvfmt = gvexec["evince", #1 <> ".pdf", #2, "PDF"]&;
  gv = gvfmt[#1]["/tmp/gv" <> ToString[Hash[#1]], #1]&;
  $DisplayFunction = gv
]

$Path = Join[{ToFileName[$HomeDirectory, "Software/FeynArts"], 
   ToFileName[$HomeDirectory, "Software/FormCalc"], 
   ToFileName[$HomeDirectory, "Software/LoopTools/x86_64-Linux/bin"]}, $Path]
