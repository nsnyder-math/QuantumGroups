(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



BeginPackage["QuantumGroups`Algebra`",{"QuantumGroups`","QuantumGroups`RootSystems`","QuantumGroups`WeylGroups`"}]


X;K;\[ScriptOne];\[ScriptZero];


SuperPlus;SuperMinus;


PositiveGenerators;NegativeGenerators;CartanGenerators;Generators;NonCommutativePower;\[CapitalDelta];\[CapitalDelta]op;OperatorWeight;OperatorLength;


Begin["`Private`"];


PositiveGenerators[\[CapitalGamma]_]:=Table[SuperPlus[Subscript[X, i]],{i,1,Rank[\[CapitalGamma]]}];


NegativeGenerators[\[CapitalGamma]_]:=Table[SuperMinus[Subscript[X, i]],{i,1,Rank[\[CapitalGamma]]}];


CartanGenerators[\[CapitalGamma]_]:=Table[Subscript[K, i],{i,1,Rank[\[CapitalGamma]]}];


Generators[\[CapitalGamma]_]:=CartanGenerators[\[CapitalGamma]]~Join~PositiveGenerators[\[CapitalGamma]]~Join~NegativeGenerators[\[CapitalGamma]]


Unprotect[NonCommutativeMultiply];


0**b_:=0


a_**0:=0


a_**b_Plus:=a**#&/@b


a_Plus**b_:=#**b&/@a


(\[Alpha]_?qNumberQ a_)**b_:=\[Alpha](a**b)
a_**(\[Alpha]_?qNumberQ b_):=\[Alpha](a**b)


\[ScriptOne]**Z_:=Z
Z_**\[ScriptOne]:=Z


(a_\[CircleTimes]b_)**(c_\[CircleTimes]d_):=(a**c)\[CircleTimes](b**d)


NonCommutativePower[x_,n_?(#>=2&)]:=NonCommutativeMultiply@@Table[x,{n}]


NonCommutativePower[x_,1]:=x


NonCommutativePower[x_,0]:=\[ScriptOne]


NonCommutativePower[x_,n_?(#<0&)]:=NonCommutativePower[x^-1,-n]


Protect[NonCommutativeMultiply];


\[CapitalDelta][\[ScriptOne]]=\[ScriptOne]\[CircleTimes]\[ScriptOne];
\[CapitalDelta][Subscript[K, i_]]:=Subscript[K, i]\[CircleTimes]Subscript[K, i]
\[CapitalDelta][Subscript[K, i_]^-1]:=Subscript[K, i]^-1\[CircleTimes]Subscript[K, i]^-1
\[CapitalDelta][SuperPlus[Subscript[X, i_]]]:=SuperPlus[Subscript[X, i]]\[CircleTimes]Subscript[K, i]+\[ScriptOne]\[CircleTimes]SuperPlus[Subscript[X, i]]
\[CapitalDelta][SuperMinus[Subscript[X, i_]]]:=SuperMinus[Subscript[X, i]]\[CircleTimes]\[ScriptOne]+Subscript[K, i]^-1\[CircleTimes]SuperMinus[Subscript[X, i]]


\[CapitalDelta][\[Alpha]_?qNumberQ A_]:=\[Alpha] \[CapitalDelta][A]


\[CapitalDelta][A_**B_]:=\[CapitalDelta][A]**\[CapitalDelta][B]


\[CapitalDelta]op[Z_]:=\[CapitalDelta][Z]/.X_\[CircleTimes]Y_:>Y\[CircleTimes]X


\[CapitalDelta][X_Plus]:=\[CapitalDelta]/@X
\[CapitalDelta][X_CircleTimes]:=\[CapitalDelta][First[X]]\[CircleTimes]Rest[X]


OperatorWeight[\[CapitalGamma]_][\[ScriptZero]]:=ZeroVector[Rank[\[CapitalGamma]]]
OperatorWeight[\[CapitalGamma]_][\[ScriptOne]]:=ZeroVector[Rank[\[CapitalGamma]]]
OperatorWeight[\[CapitalGamma]_][Subscript[K, i_]]:=ZeroVector[Rank[\[CapitalGamma]]]
OperatorWeight[\[CapitalGamma]_][Subscript[K, i_]^-1]:=ZeroVector[Rank[\[CapitalGamma]]]


OperatorWeight[\[CapitalGamma]_][SuperPlus[Subscript[X, i_]]]:=OperatorWeight[\[CapitalGamma]][SuperPlus[Subscript[X, i]]]=SimpleRoots[\[CapitalGamma]][[i]]
OperatorWeight[\[CapitalGamma]_][SuperMinus[Subscript[X, i_]]]:=OperatorWeight[\[CapitalGamma]][SuperMinus[Subscript[X, i]]]=-SimpleRoots[\[CapitalGamma]][[i]]


OperatorWeight[\[CapitalGamma]_][A_**B_]:=OperatorWeight[\[CapitalGamma]][A]+OperatorWeight[\[CapitalGamma]][B]


OperatorWeight[\[CapitalGamma]_][A_\[CircleTimes]B_]:=OperatorWeight[\[CapitalGamma]][A]+OperatorWeight[\[CapitalGamma]][B]


OperatorWeight[\[CapitalGamma]_][\[Alpha]_?qNumberQ A_]:=OperatorWeight[\[CapitalGamma]][A]
(*OperatorWeight[\[CapitalGamma]_][A_+B_]/;(OperatorWeight[\[CapitalGamma]][A]\[Equal]OperatorWeight[\[CapitalGamma]][B]):=OperatorWeight[\[CapitalGamma]][A]*)
OperatorWeight[\[CapitalGamma]_][A_Plus]/;(Length[Union[OperatorWeight[\[CapitalGamma]]/@(List@@A)]]==1):=OperatorWeight[\[CapitalGamma]][First[A]]


OperatorLength[\[CapitalGamma]_,A_]:=OperatorLength[\[CapitalGamma],A]=With[{\[Lambda]=OperatorWeight[\[CapitalGamma]][A]},Sqrt[KillingForm[\[CapitalGamma]][\[Lambda],\[Lambda]]]]


Subscript[K, Subscript[A, 1],\[Rho]]=Subscript[K, 1];
Subscript[K, \[CapitalGamma]_,\[Rho]]:=Inner[NonCommutativePower,CartanGenerators[\[CapitalGamma]],(Plus@@PositiveRoots[\[CapitalGamma]]).Inverse[SimpleRoots[\[CapitalGamma]]],NonCommutativeMultiply]


End[];


EndPackage[];
