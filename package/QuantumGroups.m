(* ::Package:: *)

(* ::Subtitle:: *)
(*QuantumGroups package*)


(* ::Text:: *)
(*Version 2, June 19 2005, Scott Morrison*)


(* ::Section:: *)
(*Introduction*)


(* ::Section:: *)
(*Implementation*)


(* ::Input::Initialization:: *)
(* We let the symbols X and K escape to the System` context, to avoid shadowing problems with KnotTheory`. *)
System`K;System`X;


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`Utilities`IntersectSubspaces`",{"IntersectSubspaces"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`Utilities`MatrixWrapper`",{"OnesMatrix","ZeroesMatrix","ZeroMatrixQ","NonZeroMatrixQ","Matrix","MatrixData","identityMatrix","KroneckerProduct","BlockDiagonalMatrix","AppendRows","AppendColumns","MatrixInverse","PrepareInverse","InterpolationInverseThreshold"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`Utilities`Debugging`",{"DebugEcho","DebugPrint","DebugEvaluate","DebugSet","DebugPrintHeld"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`Utilities`DataPackage`",{"DefiniteValues","MatchingValues","ValuesAsString","PackageData","PackageMatrixPresentations","PackageDecompositionMaps","PackageQuantumRoots","PackageRMatrix","PackagePartialRMatrixPresentation","PackageHighWeightVectors","PackageBraidingMatrices","PackageBRPresentations","PackageBraidingMaps"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`RootSystems`",{"CartanMatrix","CartanFactors","LacingNumber","Rank","KillingForm","\[Rho]","SimpleRoots","SimpleReflection","WeylOrbit","RootWeightQ","WeightsModRoots","WeightInLatticeQ","IntermediateLattices","PositiveWeightQ","InWeylPolytopeQ","SortWeights","SortWeightMultiplicities","MinisculeWeightQ","MinusculeRepresentationQ","MinusculeRepresentations","ReflectIntoPositiveWeylChamber","ShortDominantRoots","LongDominantRoots","ShortSimpleRoots","ShortRoots","ShortDominantRootQ","DualCoxeterNumber","TwistFactor"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`RootsOfUnity`",{"AlcoveDefiningRoot","WeightInAlcoveQ","AlcoveWeights","AlcoveWeightsInLattice","AlcoveRoots","LevelFromRoot","RootFromLevel"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`Algebra`",{"\[ScriptOne]","\[ScriptZero]","PositiveGenerators","NegativeGenerators","CartanGenerators","Generators","NonCommutativePower","\[CapitalDelta]","\[CapitalDelta]op","OperatorWeight","OperatorLength"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`BraidAction`",{"T","BraidAction","BraidRelations","CheckBraidRelations"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`QuantumRoots`",{"ExpandQuantumRoot","QuantumPositiveRoots","QuantumNegativeRoots","QuantumRootHeight"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`LittelmannPaths`",{"LittelmannPath","LittelmannPathDecomposeRepresentation","LittelmannPathWeightMultiplicities","LittelmannPathOneStepLowerings","LittelmannPathLowerings","LittelmannPathEndpoint"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`Steinberg`",{"SteinbergDecomposeRepresentation"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`WeylGroups`",{"PositiveRoots","LongestWordDecomposition","LongestWord","WeylGroup"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`Representations`",{"WeightMultiplicities","WeightMultiplicity","MultiplicityFreeQ","DecomposeRepresentation","Weights","WeightDiameter","PositiveWeights","qDimension","DualRepresentation"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`MatrixPresentations`",{"ChangeOfBasisMatrix","ShortRootBasis","FundamentalBasis","MatrixPresentation","HighWeightVectors","HighWeightVectorQ","AllHighWeightVectors"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`AlgebraRelations`",{"Relations","CheckRelations"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`RMatrix`",{"RMatrix","CheckRMatrixOppositeCommutes"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`RepresentationTensors`",{"RepresentationTensor","Domain","Codomain","DomainBasis","CodomainBasis","Algebra","IdentityMap","ZeroTensorQ","CheckRepresentationTensor","RepresentationTensorErrors","QuantumTrace","Distributor","Associator","InverseAssociator","BraidingMap","InverseBraidingMap","NormalisedBraidingMap","InverseNormalisedBraidingMap","DecompositionMap","InverseDecompositionMap","PermuteDirectSummands","DirectSumProjectionMap","DirectSumInclusionMap"}];


(* ::Input::Initialization:: *)
DeclarePackage["QuantumGroups`Braiding`",{"BraidingData","CheckBraidingData","BR","LoadAllBraidingDataFromWiki","PackageBraidingData","WriteBraidingDataToWiki"}];


(* ::Input::Initialization:: *)
Print[
"Loading QuantumGroups` version 2.0\n",
"Read more at http://katlas.math.toronto.edu/wiki/QuantumGroups"
]


(* ::Input::Initialization:: *)
BeginPackage["QuantumGroups`"];


(* ::Input::Initialization:: *)
QuantumGroupsDirectory::usage="QuantumGroupsDirectory[] should hopefully return the location the QuantumGroups` package was loaded from.";
QuantumGroupsDataDirectory::usage="QuantumGroupsDataDirectory[] specifies were the QuantumGroups` package should look for, and save, precomputed data.";


(* ::Input::Initialization:: *)
{A,B,C,D,E,F,G};


(* ::Input::Initialization:: *)
A1=Subscript[A, 1];A2=Subscript[A, 2];A3=Subscript[A, 3];A4=Subscript[A, 4];A5=Subscript[A, 5];A6=Subscript[A, 6];A7=Subscript[A, 7];A8=Subscript[A, 8];A9=Subscript[A, 9];A10=Subscript[A, 10];A11=Subscript[A, 11];A12=Subscript[A, 12];B2=Subscript[B, 2];B3=Subscript[B, 3];B4=Subscript[B, 4];B5=Subscript[B, 5];B6=Subscript[B, 6];B7=Subscript[B, 7];B8=Subscript[B, 8];C3=Subscript[C, 3];C4=Subscript[C, 4];C5=Subscript[C, 5];C6=Subscript[C, 6];C7=Subscript[C, 7];C8=Subscript[C, 8];D4=Subscript[D, 4];D5=Subscript[D, 5];D6=Subscript[D, 6];D7=Subscript[D, 7];D8=Subscript[D, 8];E6=Subscript[E, 6];E7=Subscript[E, 7];E8=Subscript[E, 8];F4=Subscript[F, 4];G2=Subscript[G, 2];


(* ::Input::Initialization:: *)
{Irrep,\[DoubleStruckCapitalC],\[Beta]};


(* ::Input::Initialization:: *)
SetAttributes[DirectSum,{Flat,OneIdentity}]


(* ::Input::Initialization:: *)
CircleTimes/:Power[V_,CircleTimes[n_]]:=TensorPower[V,n]


(* ::Input::Initialization:: *)
CirclePlus=DirectSum;


(* ::Input::Initialization:: *)
CircleTimes[x:Except[_Integer]]:=x


(* ::Input::Initialization:: *)
CircleTimes[a__,b_,c_]:=CircleTimes[CircleTimes[a,b],c]


(* ::Input::Initialization:: *)
TensorPower[_,0]:=CircleTimes[]
TensorPower[x_,n_?NaturalQ]:=Fold[CircleTimes,x,Table[x,{n-1}]]


(* ::Input::Initialization:: *)
{TensorPower,DirectSum};


(* ::Input::Initialization:: *)
QuantumGroups::loading="Loading precomputed data in `1`."


(* ::Input::Initialization:: *)
qInteger::usage="qInteger[n][q] computes the quantum integer n with the variable q.";
{qFactorial};
qNumberQ::usage="qNumberQ[x] tests if x is a rational function in q. It (fakes) does so simply by replacing q with 3.14159, and testing if the resulting expression is a number.";


(* ::Input::Initialization:: *)
UnsortedUnion::usage="UnsortedUnion[list] a list of all the unique elements in list, in the order that they first appear.";


(* ::Input::Initialization:: *)
NaturalQ::usage="NaturalNumberQ[n] tests if n is a non-negative integer.";


(* ::Input::Initialization:: *)
If[$VersionNumber<6,
UnitVector::usage="UnitVector[n,i] returns the i-th n-dimensional unit vector, if i is an integer between 1 and n, and the n-dimensional zero vector otherwise.";
]


(* ::Input::Initialization:: *)
If[$VersionNumber>=6.,
Unprotect[IdentityMatrix];
IdentityMatrix[0]={};
Protect[IdentityMatrix];
]


(* ::Input::Initialization:: *)
ZeroVector::usage="ZeroVector[n] returns the n-dimensional 0 vector.";


(* ::Input::Initialization:: *)
UnitVectorQ::usage="UnitVectorQ[v] tests if v is a unit coordinate vector.";


(* ::Input::Initialization:: *)
ZeroVectorQ::usage="ZeroVectorQ[v] tests if v is the zero vector.";


(* ::Input::Initialization:: *)
AdjointRepresentation[Subscript[A, n_]]:=Irrep[Subscript[A, n]][UnitVector[n,1]+UnitVector[n,n]]
AdjointRepresentation[G2]=Irrep[G2][UnitVector[2,2]];
AdjointRepresentation[F4]=Irrep[F4][UnitVector[4,1]];
AdjointRepresentation[E6]=Irrep[E6][UnitVector[6,2]];
AdjointRepresentation[E7]=Irrep[E7][UnitVector[7,1]];
AdjointRepresentation[E8]=Irrep[E8][UnitVector[8,8]];


(* ::Input::Initialization:: *)
Begin["`Private`"];


(* ::Input::Initialization:: *)
QuantumGroupsDirectory[]:=QuantumGroupsDirectory[]=DirectoryName[$InputFileName]


(* ::Input::Initialization:: *)
(* might be dangerous if QuantumGroupsDirectory[] is somehow incorrect! *)
If[!MemberQ[$Path,QuantumGroupsDirectory[]],AppendTo[$Path,QuantumGroupsDirectory[]]]


(* ::Input::Initialization:: *)
If[StringTake[QuantumGroupsDirectory[],-7]=="package",
QuantumGroupsDataDirectory[]:=StringDrop[QuantumGroupsDirectory[],-7]<>"data";
Print["Found precomputed data in ",QuantumGroupsDataDirectory[]];
If[!MemberQ[$Path,QuantumGroupsDataDirectory[]],AppendTo[$Path,QuantumGroupsDataDirectory[]]],
Print["Remember to set QuantumGroupsDataDirectory[] to the appropriate path, if you've downloaded precomputed data."]
];


(* ::Input::Initialization:: *)
qInteger[n_Integer][q_]:=Sum[q^k,{k,-n+1,n-1,2}]


(* ::Input::Initialization:: *)
qFactorial[n_Integer][q_]:=Expand[Times@@Table[qInteger[i][q],{i,1,n}]]


(* ::Input::Initialization:: *)
qNumberQ[x_]:=NumberQ[x/.Global`q->3.14159]


(* ::Input::Initialization:: *)
UnsortedUnion[x_]:=Module[{f},f[y_]:=(f[y]=Sequence[];y);f/@x]


(* ::Input::Initialization:: *)
NaturalQ[n_]:=NonNegative[n]&&IntegerQ[n]


(* ::Input::Initialization:: *)
ZeroVector[n_]:=Table[0,{n}]


(* ::Input::Initialization:: *)
If[$VersionNumber<6,
(UnitVector[n_,i_Integer]/;(1<=i<=n):=Module[{z=Table[0,{n}]},z[[i]]=1;z]);
(UnitVector[n_,i_Integer]:=Table[0,{n}]),
Unprotect[UnitVector];
(UnitVector[n_,i_Integer]/;(i<1\[Or]i>n):=(Message[UnitVector::nokun,n,i];ZeroVector[n]));
Protect[UnitVector];
]


(* ::Input::Initialization:: *)
UnitVectorQ[v_?VectorQ]:=Complement[v,{0,1}]=={}\[And]Count[v,1]==1


(* ::Input::Initialization:: *)
ZeroVectorQ[v_?VectorQ]:=Union[v]==={0}\[Or]v=={}


(* ::Input::Initialization:: *)
End[];


(* ::Input::Initialization:: *)
<<QuantumGroups`Utilities`Debugging`
<<QuantumGroups`Utilities`DataPackage`


(* ::Input::Initialization:: *)
EndPackage[];
