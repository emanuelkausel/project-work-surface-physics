(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.4' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     28273,        697]
NotebookOptionsPosition[     28397,        682]
NotebookOutlinePosition[     28741,        697]
CellTagsIndexPosition[     28698,        694]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"r", "=", "0.00002"}], " ", ";"}], " ", 
   RowBox[{"(*", 
    RowBox[{"tube", " ", "radius"}], "*)"}], ";", " ", 
   RowBox[{"d", "=", 
    RowBox[{"2", "*", "r"}]}], ";"}], "  ", 
  RowBox[{"(*", 
   RowBox[{"tube", " ", "diameter"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"l", "=", "0.0001"}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{"tube", " ", "length"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"k", "=", 
    RowBox[{"6.626070", "*", 
     RowBox[{"10", "^", 
      RowBox[{"(", 
       RowBox[{"-", "34"}], ")"}]}]}]}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{"Boltzmann", " ", "Constant"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"T", "=", 
    RowBox[{"273.15", "+", "25"}]}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{"room", " ", "temperature"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"rho", "=", "997"}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{"water", " ", "density"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"NA", "=", 
    RowBox[{"6.02214086", "\[Times]", 
     RowBox[{"10", "^", "23"}]}]}], " ", ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{"Avogadro", " ", "Constant"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"my", "=", "0.00089"}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{"water", " ", "dynamic", " ", "viscosity"}], 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"m", "=", 
    RowBox[{"0.018015", "/", "NA"}]}], " ", ";"}], 
  RowBox[{"(*", 
   RowBox[{
   "mass", " ", "of", " ", "a", " ", "single", " ", "water", " ", 
    "molecule"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"pv", "=", "3168.5747474290"}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{
   "vapour", " ", "pressure", " ", "water", " ", "at", " ", "room", " ", 
    "temperature"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"va", "=", 
    RowBox[{"Sqrt", "[", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"8", "*", "k", "*", "T"}], ")"}], "/", 
      RowBox[{"(", 
       RowBox[{"Pi", "*", "m"}], ")"}]}], "]"}]}], " ", ";"}], 
  RowBox[{"(*", 
   RowBox[{
   "average", " ", "velocity", " ", "of", " ", "water", " ", "molecule", " ", 
    "in", " ", "gas"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"A", "=", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"8", "*", "my", "*", "m", "*", "pv", "*", "va"}], ")"}], "/", 
     RowBox[{"(", 
      RowBox[{"d", "*", "d", "*", "rho", "*", "k", "*", "T"}], ")"}]}]}], 
   ";"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"p0", "[", "h_", "]"}], ":=", 
   RowBox[{
    RowBox[{"2", "pv"}], "+", 
    RowBox[{"2", "A", "*", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"14", "l"}], "+", 
        RowBox[{"4", 
         RowBox[{"l", "/", "d"}], "*", "h"}], "-", 
        RowBox[{"14", "h"}], "-", 
        RowBox[{
         RowBox[{"4", "/", "d"}], "*", "h", "*", "h"}]}], ")"}], "/", 
      RowBox[{"(", 
       RowBox[{"14", "+", 
        RowBox[{
         RowBox[{"18", "/", "d"}], "*", "h"}], "+", 
        RowBox[{
         RowBox[{
          RowBox[{"3", "/", "d"}], "/", "d"}], "*", "h", "*", "h"}]}], 
       ")"}]}]}]}]}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Solve", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"p", "\[Equal]", 
      RowBox[{
       RowBox[{"2", "pv"}], "+", 
       RowBox[{"2", "A", "*", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"14", "l"}], "+", 
           RowBox[{"4", 
            RowBox[{"l", "/", "d"}], "*", "h"}], "-", 
           RowBox[{"14", "h"}], "-", 
           RowBox[{
            RowBox[{"4", "/", "d"}], "*", "h", "*", "h"}]}], ")"}], "/", 
         RowBox[{"(", 
          RowBox[{"14", "+", 
           RowBox[{
            RowBox[{"18", "/", "d"}], "*", "h"}], "+", 
           RowBox[{
            RowBox[{
             RowBox[{"3", "/", "d"}], "/", "d"}], "*", "h", "*", "h"}]}], 
          ")"}]}]}]}]}], "&&", " ", 
     RowBox[{"0", "<", "h", "<", "l"}]}], ",", "h", ",", "Reals"}], "]"}], 
  " ", 
  RowBox[{"(*", 
   RowBox[{"Find", " ", "the", " ", "inverse", " ", "function", " ", "h", 
    RowBox[{"(", "p", ")"}]}], "*)"}]}], "\[IndentingNewLine]"}], "Input",
 CellChangeTimes->CompressedData["
1:eJwdzV1MUgEAxXEIyATTymWjuRSXbjFrZjAXkgmKOEat2HCMWlmO3LJBaMLg
gRm5SBdaPVQbrIdkUssxoU/awj5sOaAmbEbMNbEP55pT2yrYHbDuuQ9nv52n
P++sQaXbQKPR9pODns7zEknVimSk/1cLzBxabYcTiUIF9ZddGlgwxzgDP3Mr
uuGLer4BJqXhPugrbrRC3eFeGwwksgNw3Zu8CtlatgP+HDZdh6KE1gvHi2UT
8Pm2QT+033MFqU65MATrHLIPkLkUi8AHy4o4PFHt+gKJtOA7zDL3/obxvHqz
lLSMvnM7rB8UcOGP1bwQatzTYpg6mmuGzuomGVxPEpQ1rP4j0DhkUMOxrpQe
NjtHLTA3M26D4TL+TXg/SbigoYI+Br+J+ryQy8hRpsVTj2BlVaEPvt/R9ATq
O4qCsNNOROGx/NZZyCGK5qA6EshCKb2V3kL6tSFFOcNJs6BmYJID+V2XSiAv
HqAcNqtEcNIol1LuKZFDz7t4B7w1/ewkVP5d1MGFkSETDPXuMsNGxr8rkB17
7ICCHoUTqura7sBPB7v9MtJzs+YgVFpvv4ER98co5Ltf5+BLRqygjfQAf0EI
PYFKESSOt0rgvN1K+fCu5yLUGkqNcNO1UhOU+29YYGY+moJbnoYWYfkF4RJU
6MOU6ss1KzDF20dpYWbWYPCV+A/01a7l4cbTp+hyUhbHyoU25ShlbUOPr510
99spP/wPFxpcSA==
  "]],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Solve", "::", "ratnz"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Solve was unable to solve the system with inexact \
coefficients. The answer was obtained by solving a corresponding exact system \
and numericizing the result. \\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", \
ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/Solve\\\", ButtonNote -> \
\\\"Solve::ratnz\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{{3.7760677795888405`*^9, 3.7760677922948575`*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"h", "\[Rule]", 
    RowBox[{"ConditionalExpression", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        FractionBox[
         RowBox[{"2.976521450372251`*^-18", " ", 
          RowBox[{"(", 
           RowBox[{"6.448688918248039`*^23", "+", 
            RowBox[{"4.3052133887351567`*^18", " ", "p"}]}], ")"}]}], 
         RowBox[{"9.9356962061`*^10", "+", 
          RowBox[{"106788.`", " ", "p"}]}]]}], "+", 
       RowBox[{"2.6727504668333677`*^-31", " ", 
        SqrtBox[
         FractionBox[
          RowBox[{"2.0064548328946743`*^75", "+", 
           RowBox[{"1.6807374641226172`*^69", " ", "p"}], "+", 
           RowBox[{"1.1068025670117018`*^63", " ", 
            SuperscriptBox["p", "2"]}]}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"9.9356962061`*^10", "+", 
             RowBox[{"106788.`", " ", "p"}]}], ")"}], "2"]]]}]}], ",", 
      RowBox[{
      "6337.149494857981`", "<", "p", "<", "1.7627440066778434`*^6"}]}], 
     "]"}]}], "}"}], "}"}]], "Output",
 CellChangeTimes->{{3.776067779594836*^9, 3.7760677923008413`*^9}}]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"h", "[", "p_", "]"}], ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", 
      FractionBox[
       RowBox[{"2.976521450372251`*^-18", " ", 
        RowBox[{"(", 
         RowBox[{"6.448688918248039`*^23", "+", 
          RowBox[{"4.3052133887351567`*^18", " ", "p"}]}], ")"}]}], 
       RowBox[{"9.9356962061`*^10", "+", 
        RowBox[{"106788.`", " ", "p"}]}]]}], "+", 
     RowBox[{"2.6727504668333677`*^-31", " ", 
      SqrtBox[
       FractionBox[
        RowBox[{"2.0064548328946743`*^75", "+", 
         RowBox[{"1.6807374641226172`*^69", " ", "p"}], "+", 
         RowBox[{"1.1068025670117018`*^63", " ", 
          SuperscriptBox["p", "2"]}]}], 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"9.9356962061`*^10", "+", 
           RowBox[{"106788.`", " ", "p"}]}], ")"}], "2"]]]}]}], ")"}]}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"z", "[", "p_", "]"}], ":=", 
  RowBox[{"l", "-", 
   RowBox[{"h", "[", "p", "]"}], " ", 
   RowBox[{"(*", 
    RowBox[{"z", "-", 
     RowBox[{
     "coordinate", " ", "of", " ", "the", " ", "liquidlevel", " ", "inside", 
      " ", "the", " ", "tube"}]}], "*)"}]}]}]}], "Input",
 CellChangeTimes->{{3.776067820623063*^9, 3.7760678512132187`*^9}, {
  3.776068117081871*^9, 3.7760681687606435`*^9}, {3.7760682025262685`*^9, 
  3.776068275923931*^9}}],

Cell[BoxData[
 RowBox[{"\[IndentingNewLine]", "\n"}]], "Input",
 CellChangeTimes->{{3.776067858141656*^9, 3.776067914566736*^9}, {
   3.77606794639454*^9, 3.7760679729195814`*^9}, {3.7760680574454594`*^9, 
   3.776068084966836*^9}, {3.776068146393482*^9, 3.776068158333541*^9}, {
   3.776068590105933*^9, 3.7760686087259583`*^9}, {3.7760686519259324`*^9, 
   3.776068726828715*^9}, {3.776068843192648*^9, 3.7760688440368776`*^9}, {
   3.776068874616517*^9, 3.776068881772146*^9}, {3.776068968578795*^9, 
   3.7760690255535817`*^9}, {3.776069131207447*^9, 3.776069145229992*^9}, {
   3.7760691928879695`*^9, 3.776069329353609*^9}, {3.7760695697282376`*^9, 
   3.7760695938529625`*^9}, {3.77606962622885*^9, 3.776069677859436*^9}, {
   3.7760697166890554`*^9, 3.7760697308327847`*^9}, {3.7760701818278894`*^9, 
   3.776070220373214*^9}, {3.776070305297512*^9, 3.7760703083522544`*^9}, 
   3.7760717185080466`*^9}],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"z", "[", 
       RowBox[{"100", "p"}], "]"}], "*", 
      RowBox[{"10", "^", "6"}]}], ")"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "0", ",", "100"}], "}"}], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<initial pressure [mbar]\>\"", ",", 
      "\"\<liquid level [\[Mu]m]\>\""}], "}"}]}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"z", "[", 
       RowBox[{"100", "p"}], "]"}], "*", 
      RowBox[{"10", "^", "6"}]}], ")"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "0", ",", "1000"}], "}"}], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<initial pressure [mbar]\>\"", ",", 
      "\"\<liquid level [\[Mu]m]\>\""}], "}"}]}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"z", "[", 
       RowBox[{"100000", "p"}], "]"}], "*", 
      RowBox[{"10", "^", "6"}]}], ")"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "0", ",", "10"}], "}"}], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<initial pressure [bar]\>\"", ",", "\"\<liquid level [\[Mu]m]\>\""}],
      "}"}]}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"line1", "=", 
   RowBox[{"Line", "[", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"17.627440066778434", ",", "0"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"17.627440066778434", ",", 
        RowBox[{"l", "*", 
         RowBox[{"10", "^", "6"}]}]}], "}"}]}], "}"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"z", "[", 
        RowBox[{"100000", "p"}], "]"}], "*", 
       RowBox[{"10", "^", "6"}]}], ")"}], ",", 
     RowBox[{"l", "*", 
      RowBox[{"10", "^", "6"}]}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "0", ",", "22"}], "}"}], ",", 
   RowBox[{"PlotStyle", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"Automatic", ",", 
      RowBox[{"Directive", "[", "lineStyle", "]"}]}], "}"}]}], ",", 
   RowBox[{"Epilog", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Directive", "[", "lineStyle", "]"}], ",", "line1"}], "}"}]}], 
   ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<initial pressure [bar]\>\"", ",", "\"\<liquid level [\[Mu]m]\>\""}],
      "}"}]}]}], "]"}]}], "Input",
 CellChangeTimes->{{3.7760702341233177`*^9, 3.776070288581585*^9}, {
  3.776070407639206*^9, 3.776070465305402*^9}, {3.7760705105373144`*^9, 
  3.776070571865157*^9}, {3.7760712831945653`*^9, 3.776071332288031*^9}, {
  3.7760713864293475`*^9, 3.7760714771206665`*^9}, {3.776071544721204*^9, 
  3.7760715666620855`*^9}, {3.7760716023308535`*^9, 3.776071649245089*^9}, {
  3.776071726410409*^9, 3.7760719183790045`*^9}, {3.776071989832984*^9, 
  3.7760720664543867`*^9}, {3.7760721547034793`*^9, 3.7760721586982656`*^9}, {
  3.7760722046801667`*^9, 3.77607223840301*^9}}],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
     1.], LineBox[CompressedData["
1:eJwVxX081HccAHBPUwk9SehhRYXtVoq8Dsv3gwtNFyfyVa7sUndFISxikkwP
Ky61Wq+buwpdskaeXln4zkVSmZvHul0h9+uIOCePdd3WH+/XexUnOnC/no6O
DvN/n7fO1uQJV9S52zM7Zw92qYlPrHjOYZ4IGXuVdPE71ITVS8u24xWjeRVF
Yuc2Ndl5bYRlyCOoePYsv/S/1QSPBziOc1vQ013+IssGNQnN080f4nYj1Yc1
qb6larJrJjSsnzuC1vVRZuLzaiJbk0l/w9Wiq8KfbnE91KQgWfeTPns+nB8z
yPcXjhKTMlGx2N8CmDkOeZaGo+Q37496G0xWQolq7fvRGBURctL7zH1Wg8eF
e4bxwhGy+YYyooluB99slZ0iMcPkcdYtgcEJGgwaNheN2r8jsgPf5xRgBzh6
En/pNTBIREv22hYzN0Lv0oJlPrVviUw0Z4kmygnqF/YVuR4fIPuqbEI28Jxh
wCXBS+7XT3KToyAylA6heaU2l22UhLmYkzEQ7wptL7nAeE0RP2i02B71LQh8
GW3XKhWEeL6YNXnBHVxsB+uGY/uIesJY2hoIYMOSC8IcXxPa4v2M3G0e8E9l
jj3XqJesEi16c3a3J0QPpbSM8btJzeh08UHsBe3/5j3cSn9JzEqcxZGHGBAe
vWh37V0ZeSgxios5tgXq4tua2OufEyuhOZd31Bv63cvXLpN3EBqVeCY93Qc0
2rR2o5A2Qr1f2Jqd5gtXa75InaeRkgnMUImStsI5bb3jrj3NRGL3zK319HcA
UW6JFnsfk011PxdPnvKDiM6mwp6Kh2Rfw40A9Ms2qHLN5fADa8jb5f6Pzt5g
wrV8lv3zg2XEAjlFNAq2g7cy94g8NJ/oPoteb1vkD/1OF7PO1TPIY37sgs1B
AXDy0lenOWE3UTX1wzhXGgDeXU09VcGlKCvGVmUTwoInEldeklc1KuseS33R
zgLjiXUd/RIJqsyIXL2SHQghYlO2WWMjMjHVssPlgZDxtNFQmPAM8T1e6VqH
7gD63d9dTTOlSHWHVx3fswPml06bVuu1ofwp07l1e4KgqfJPWWFQB9qUEh4j
VAZBZEoSfaqrC40VapDmcDDMTOc8cvOXIYPqyrzgwWDYb8y+KBXI0Zj+0hUo
biek357JKLfsRpscBDRr9U5wtWN7JlX2oDxDbkHmkRBI7xwuXCrrRSMLXzml
jIeAbFEWjW3eh7L1Y3FkHAYX9VXzoM0KxNB7dyc3AQPtfK4s0VOBpnQOalqO
YYjgUIJcHwUK/xR+0ykFQ1Sjm7mSpUAbpwOGNBkYVCX6b5MOKFDnsEMa/wqG
i090TUXZCrRCphJXVGG4fqjBR9mrQK3Po2aUDzAk7DUvn6tUoNNd/dusajHE
SQuXOwwpkKq9ZzRVgmHI4df+xAkFkrRI3XyfYnBbdYltNJdCBxpKWmRyDPf5
+vU0JwpZ1dOsTboxhDB+NGC5UKhFcjse9WJYcNnFM8GdQvS/rlvmUxgcFx+v
qPGlkNED/r7DwxhKpVbJ29kUqq0yrhSpMMSLCwuOcigUd//M7FY1hpSvk5uv
cCkkr0i76zyJQb7ljVl3LIX45R+1vGkMBj0nnPSPUWhLWWKg4AOGC+vDWLYp
FJq59z6/WYNB5pwc6XeSQn+UxExqtRiYU/L06EwK/QeG13EP
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"initial pressure [mbar]\"", TraditionalForm], 
    FormBox["\"liquid level [\[Mu]m]\"", TraditionalForm]},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  ImageSize->{402., Automatic},
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotRange->{{0, 100}, {-1.1777143807601738`, 0.6726605945511978}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{{3.7760705414528446`*^9, 3.7760705509414253`*^9}, {
   3.7760712987427945`*^9, 3.7760713352501965`*^9}, {3.7760713986824045`*^9, 
   3.7760714084524193`*^9}, {3.7760714450718937`*^9, 3.776071480198946*^9}, 
   3.776071572954136*^9, 3.7760716194992023`*^9, 3.7760716506554337`*^9, {
   3.7760717778213882`*^9, 3.776071838274949*^9}, 3.7760718723444114`*^9, 
   3.776071919279535*^9, {3.776072022990366*^9, 3.7760720374790726`*^9}, 
   3.776072068463822*^9, 3.776072209146082*^9, 3.7760722394401956`*^9}],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
     1.], LineBox[CompressedData["
1:eJwVxX08lAcAB3DlvbzcVd7uKCKJPCdqtta5H+lqIhUaTWlyUslR3hLyFse4
JymKyl2zS1LpZdhGp6HGIk7FqGSadPjgvOTitO2P7+drFsjdzVmopKTk8Z//
H5LNubODp5yiolLLpZ0ycatIw9JV2MEKthuaCKqTiZ9rxfsZCftZvllB5b2l
MnGneMOEsnCClbA+KfzlSZnY79ISyAXK6KJrbGmiy8Q0teSBCcFS0HbWGTcE
jIvjNlV/NS4wR40+9Z1x26i4rNOrf1TggCtGCrp04oP4bHeywjXSFdqtbe37
8rvFHcUZRbkHd+DbuRt7aUmlYrbvb5sTKN54oG9CEb3rYH0zG3j5la8fGuuK
nxzYM8AiM80ezrL3Q+fFc5eNw2MsJ6NtfYHPvsdAE5PbY/qRda5OPt0aFgSu
iFtRa6dg8V5/MU7rC0ZIaMlAZcgCtKs/9d/EOwxvn2sWBsdVUHN9uJy5MBSO
RJamt6s60gozKI+5YXhU1b3ARHURPD1qZdTMcDimdMzaz2uB4MU/q6iPgKee
7XlFnS4qm94H/Wp4AkLtzOLafVTcWk9JyzgUCYUFtZqQLEH03sQLDcVR4FhU
7x+wWYbB9IsBobJo9B1slNOEerAOm6GnEbHgNm6/2TKrD31/lVy1MydRcEEz
816EISJOtJDuL+LQ3jUrn39jhKtbXiUt1I2HO1tWZm9PR+TyAmvzgwng9Gvm
OQmMQbtX8Pi+IBHFPwdWHJo0AYPrM6zedRppL/N9grACMZcCOP3nk6B4cCU5
wssUYt+qljj7ZAg7r82NyU3hT+ec2/o6GbcNv9bi3zJDxfFx+nRaCjLu028u
3rcSx64LrvqbpaI17Ijx7OeVSOz9KWGmORVr7TbEvb5jjpnJFh/3w2lY3DNj
ud3LAmuKn8uSVc6go1By4KnMAnfc1w0Pl59BwiepyKB4Fa52VrzRdUvH/Wp3
ignLEn2cdNuQyXTMO1h9aB6yRE57YlRsXgbYfr13t2evxli7T8oRBg8x0/mp
01ZWKH2RMpTbxUP/thSFmcQKTZUSj4joTMQoeuUe3DVwKorVSjfLAm9r9uBf
htY4ukxBxjdlocYhyy3joTWUjpZo2QT/gOaPnoOBvjaQNgj/0aFkIy/ciRoz
bwPm3KOqstvZuHPqrrTt4lps/aNuh5VbDgqm16w6xbCFqEDPpUeWg+9qHll8
KbHFMdccgn2Wjz+jh6Y5hwm0upTqqebxcfxTCE89lICdc/1c/QU+wkRTWjfC
CEwy5c3ORXxU9TBHh04QiHPkHGKK+LCKyzOMSCTAs2YK1tfwoRQunI/NI1BC
GaGaD/KxZ7CSdrqWgJquhrxPykfJ3406K+oIhGibvxWM8DG3cnTq4e8EbBb5
3V4+wceprtwr808I3FNudKPN89HQbLY7QUJAPH05lbqMREzALztj3xMwnao6
0qZPIt0tP9pASiBlQrKLNCIhUc0jK4cJsMc0TLVXkHDyHCmcHCfw9ENkjYY1
idoewiB8jgAxSP74ZC0J5Y9LX+p8JnB2oCwrnUEiS0Tn3VrAgFf/W1+VDSRG
zM83StUYeNA3y6p3JFF4TXVXpiYD+m/1V6dsJOFiUPRstRYDsW/W6TgzSazr
9nZ+rMNA9yv3qc8sEo2bHURBVAb+Bb4xS5k=
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"initial pressure [mbar]\"", TraditionalForm], 
    FormBox["\"liquid level [\[Mu]m]\"", TraditionalForm]},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  ImageSize->{402., Automatic},
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotRange->{{0, 1000}, {-1.177714036827948, 15.53397101760664}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{{3.7760705414528446`*^9, 3.7760705509414253`*^9}, {
   3.7760712987427945`*^9, 3.7760713352501965`*^9}, {3.7760713986824045`*^9, 
   3.7760714084524193`*^9}, {3.7760714450718937`*^9, 3.776071480198946*^9}, 
   3.776071572954136*^9, 3.7760716194992023`*^9, 3.7760716506554337`*^9, {
   3.7760717778213882`*^9, 3.776071838274949*^9}, 3.7760718723444114`*^9, 
   3.776071919279535*^9, {3.776072022990366*^9, 3.7760720374790726`*^9}, 
   3.776072068463822*^9, 3.776072209146082*^9, 3.7760722394861574`*^9}],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
     1.], LineBox[CompressedData["
1:eJwVx3k4lAkAx3HTMBUz1RAxYWa8KiFlS0nl/cky5J55W4VqBuOKSIdKt1LO
2nRsCVvpXlpHPXSYWWolM55K6klazxaNNGmYEDm2/eP7fJ4vPzxRKJ2go6Pj
96P/LdgbznCMzHLtYAnYqld9ssIQtUswL5bML7599y91r+y1X2Yyj7eTpAWc
OPSY1itLEaydosfLIEMLpKcr1/TIPB8ibJB7loyVbpJzJqpkJQcXpWm418ns
BvG6wq6nsn8lpSafudVkenbXdEFSB5katFH8idtALrmf3H7Sn47JQ/kN8Q6t
5KRqHWfOPlNsrt2XrU5+T159T9VtfmMFh+K8Z5WlH0m/xfqLRllz0ekfY97u
rCFXOU7wsEudjzOcdIsLYi15Yy2351n+T1iaXHWLrhggW+7sa/M45YS6V/mB
iXOGSaMW7mVXsTMcs8dcTb1HSWXmVIPadhcIPri0LwjWwfqi74P6O1dANe+O
x1c1DQzzsl18JYnUkYyF93fRwbbymfPHODCR3RVL2epBX06z1VivhJ5ST2Dw
gIHo4JOF1vbu+N5UEn9i8yQsETKMS1x/RmdwqZmlpT5Eum25bW4ecDu6KeFx
iQG6QpZoW2w9cWqsarL7Bhau2t8b3m4pQKh5nW+bdgr4D4fM6ocEYMrt1Far
p+ERwzSM2e4FqdPF/rX2bISG7p09o8obKXt3CHn9bBT/eXppdeoqHO7Oa25q
MoT84K35VV4+8LWdeo15zgi8LJadjOaLnJLFcl/JdNh4PniRVOaLJ6JLI1uX
GiMs81JYX6wf5MrEbHu6CVzSLZyuTfNHedwBKN6awK5yjHlZ5g9LH9J5U+UM
tCxo1O2RBsB9PCytaLcpfK4ZPhCOBCDypayvarUZRvWKW+EXCNcDB29LeBxI
60/1tZ8MxInE3ntMFQc3khrzzV4H4t3+yx+KamaCnmISMs4LwidpdWTtEXNE
DVrq2oQHQZNgOFEpscDAddFo/ZUglHo3jkTNs0T0p20mzM4gfIhZsJjeb4mU
1wrRNp4QnJuteUeUXBwvjNtuvUGINHHyRaUPD+xjjNIpvwkxOGKW41PNQ/C6
OgX7hRA2986cfWLNRwD/0rL1LBGcIh4FsDP4eFSRw0xwE0F+3thU0c/HHn6N
SewOEWzkxpn+oVb4O/qfio03RPDTU1s8r7FCm+fZVLSKoHnTUddgS6DVqbei
lUkh8XyOUcYxAqwE88kqFwoKmvWXVb8SyFVzZ5Uvo2AbffcJM4/A0cIYuz3L
KXQ4qg4cP03AWvVywNCVwpp6aM4UEJhGP5Sxwo3Cyj6t4spNAkMTGBdyBRRM
vELSH9YTcDaovMWjKGwp0UjSGwjojNVyPv74p4ZHVng1EhgM3J9UtppC1tuK
r41NBBwMjdrcginobGFFNLcQCKzWVkhCKHQXyMl37wmo3bfFFogpCOjBM4s7
CfB8e/ZHSigUx3wekKoImP3inWYXTmHDQk7px24Cz93KvaojKLx4vMW8t5fA
F+PrL5ujKDg66H8r1xJIb8ryOBdNITfv9+at/QTiLeKKxDEUvNcrM799I1C6
fPb0z7EUrtRFRN0dJlAWpz+/Io6C7txht90jBMTdA4t2bqQgyT1u4TpGYKyr
ZxYZT6FGO3tofJzAsrx+ml4Chf8A1I8eKQ==
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"initial pressure [bar]\"", TraditionalForm], 
    FormBox["\"liquid level [\[Mu]m]\"", TraditionalForm]},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  ImageSize->{402., Automatic},
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotRange->{{0, 10}, {-1.1777105975060005`, 81.70343064290948}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{{3.7760705414528446`*^9, 3.7760705509414253`*^9}, {
   3.7760712987427945`*^9, 3.7760713352501965`*^9}, {3.7760713986824045`*^9, 
   3.7760714084524193`*^9}, {3.7760714450718937`*^9, 3.776071480198946*^9}, 
   3.776071572954136*^9, 3.7760716194992023`*^9, 3.7760716506554337`*^9, {
   3.7760717778213882`*^9, 3.776071838274949*^9}, 3.7760718723444114`*^9, 
   3.776071919279535*^9, {3.776072022990366*^9, 3.7760720374790726`*^9}, 
   3.776072068463822*^9, 3.776072209146082*^9, 3.776072239532984*^9}],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
     1.], LineBox[CompressedData["
1:eJwV0Hk01AkAB3BHlNJTaEdME+MYR+P+hQ6/b1ZEkXHO/ESyWCXZ6IWw5Uir
UyZvqYeYSiiRsUTtpGMiJm9smyOK1EstO+hyZmf/+L7v+/z3fV+D8DjfSCUF
BQUvef5vt1Ml+nsNip0b+re7vOmeFKVZO7D4ghQyKud2yNOucZGzLOJtoOAU
uTF9IlejaExU/Gz2gaPgEtkcbEEqnn8n8nZ2v20mqCJHeivS39uKRSZfR82Y
gmZStVlc78f+SGp2iSIZgnby7TEqIFlPFUtQkUkXvCRntBf3c5bq4pTF44HK
jlFyUZ8F/c3ydUiTTSpII76QH81xYCHMHhftZTvYmCNzj11z2qKxAfM5ZIlp
jyJc+R2xxrdIlGdqbaj1UcE9d5YwztkFCZ615UVaatCpLk7pK3XFhOrW+JlH
6tDZk3Rc0uqG+qh4WZTeCth1qktSBNuQac06lzG9EjpdGYdGj3rCe2HoaG+D
Fqp/mt8dRt+ByVZaSXTsKjSw/rwRlu8FVvLtcrNtNNwqPJHQoLkTPEs/RRPl
1biUcEwp0coH9KdcV/9hXbwYclXp7vZBY1hvfVMTHXXRX/7dE88BZ2530q54
BoIWDPbdn+Zgs8hYs4Clj6Tzyzh/Z/pCmlGcu1bVAJZ3IyjLeV/cvNOmjG8G
WCS2KGQm++FrrO3ZuWEmelbZTkn/8cM9I0bLi/uGyHOhl6lx/CHxvjviUWME
w27D518b/RGcMtDYd84YNw5dVBvXDkCg8abLi2NMsGKRo45wXwAKXbxSJVwW
xmIm15g/DEBw+JBC7XpTbA1paq5fGYjIL6wjbJYZEpSvrBWHB6Jf5cZSNy1z
DBznM7OrAyHVqfsxVWYOk+VOprMTgdAo2X9w+ysLFJqffP3aIQjtrAp3x3vr
kJyk0UQeDsJntiHR8jsbhc16Da9qghBZvpM2nGUJYs7Pt2ssCAGGC6XMcCtU
fdOoDDLiwj2nJnfe1BrZTxiv1EK4YCoJrkwVWOOMbNnm3nNc1DnZP2pRtYF6
vvu8WMTFh0pGaHeaDUw6CwofT3ARWuTZMTtqg8oleZkVDB4S2zqF+yNtYcPv
t0r14sFN+Ol61UtbVPHirtcn8xCgzzs47WGHUpV1g6mlPCwR04T8FjsUR18b
obXzMDNKa99kYw8yJm4Hf5yHsq4/xuqK7aFd9qRKT5uCbKL6ZOIqAtlaO2mh
ThRS8kZmPbIIbP82RJ+lKLQ+6/vLMZtAG4PdcjaYgvYySRXrNwL51b4+zF0U
qjNrg1VOE1j7wNnKI4TCm0NHmu/zCUTl/TCev5uCZ5B6ioOAQPDNknSLCAq6
dOsZowcEQstuKbnHUviZy+zSekSAfufJ0h65hRe0K5XEBPRbt36PPkDBe/k0
b7CNwOBEVvnJOAoZ31vuXJISiGCdUJYcpPBh0C9Zc4iAxnv/d16HKaxf48ZR
HCYgtu24OiB3Bs/RbPwtAbPUMU5sIgV6F71XMkKANuQcezqJgs/Dd4454wQ+
CfJq2o5QKFroXpE0Kd+b3/mMm0Lh48anI1GfCdis7ul5L3eWsLrAdYqA4pld
NSppFKTjl3+xm5H/8Xww7YLcDDZ/G3OOgDRki4PhrxRi9h7XX/mdQB0no79W
7sariVMLCwR0e8pjcZTCfwChKn8=
      "]]}, 
    {RGBColor[1, 0, 0], Thickness[Large], Opacity[1.], 
     Dashing[{Small, Small}], LineBox[CompressedData["
1:eJxTTMoPSmViYGAwAWIQ7dY9XyFTcZ4dAxhEOghd2p8qt/i0PYzP4bCyWWbx
bTi/W/vo3VVn3sD5te8/MVxM+QrnzzJ576Pr8AfO/9tpP1/jBqMDjL+8Wdhq
YwArnF/stXH5XGFOOP8jm2vRryM8cP7WtKL3adICcH6zgXp/009BON/v/8P6
m9uF4fxPJ8TnZ+SKwvnqlZuWa3qIw/mResGMasyScL7MqQiXkMdScP6OhJtb
d+2SgfMD/8RXxBTJwfm2+1WFZqgrwPkXm+ZNkGdThPPX7jzJ7PAdwf+Wa9T3
57ESnL9XRe7gtQPKcP5Zvz0vPDeowPnR1Xd33OpXhfPDVG0WsGerwfkznXxr
zkaoI9QnPWTYaKYB56d+Va/SVdeE8++wruFyE9ZCuFdis3PNewSff35Oofc9
bTj/tPpKd4u9OnD+F11l04PTdRHmL/cXf9yiB+eHKv9fqJSkD+e7d26Y8FfD
AM5XYlq85McMBH+zpcmRg2yGcP7LVXJx12sR/Li5Xmd+v0Hwy0+e35KTagTn
u235vGL1bQQ/VCGy8KenMZzPcUx8y+SDCP6vN+KnbQxN4PxFl7a93TwPwX//
cV1XuagpnF896cVvzxYEX0rG4JfKIQR/x9LyH///I/gAAHzX+w==
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"initial pressure [bar]\"", TraditionalForm], 
    FormBox["\"liquid level [\[Mu]m]\"", TraditionalForm]},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Epilog->{
    Directive[{
      Thickness[Large], 
      RGBColor[1, 0, 0], 
      Dashing[{Small, Small}]}], 
    LineBox[{{17.627440066778433`, 0}, {17.627440066778433`, 100.}}]},
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  ImageSize->{402., Automatic},
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotRange->{{0, 22}, {-1.1777060117436073`, 105.98830739394216`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{{3.7760705414528446`*^9, 3.7760705509414253`*^9}, {
   3.7760712987427945`*^9, 3.7760713352501965`*^9}, {3.7760713986824045`*^9, 
   3.7760714084524193`*^9}, {3.7760714450718937`*^9, 3.776071480198946*^9}, 
   3.776071572954136*^9, 3.7760716194992023`*^9, 3.7760716506554337`*^9, {
   3.7760717778213882`*^9, 3.776071838274949*^9}, 3.7760718723444114`*^9, 
   3.776071919279535*^9, {3.776072022990366*^9, 3.7760720374790726`*^9}, 
   3.776072068463822*^9, 3.776072209146082*^9, 3.776072239570916*^9}]
}, Open  ]],

Cell[BoxData[""], "Input",
 CellChangeTimes->{{3.7760705269063854`*^9, 3.7760705269323063`*^9}}],

Cell[BoxData[""], "Input",
 CellChangeTimes->{{3.7760705015879965`*^9, 3.7760705052717533`*^9}}]
},
WindowSize->{1536, 781},
WindowMargins->{{-8, Automatic}, {Automatic, -8}},
FrontEndVersion->"10.4 for Microsoft Windows (64-bit) (April 11, 2016)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 5208, 153, 368, "Input"],
Cell[6697, 190, 551, 11, 21, "Message"],
Cell[7251, 203, 1143, 29, 77, "Output"]
}, Open  ]],
Cell[8409, 235, 1397, 37, 216, "Input"],
Cell[9809, 274, 911, 13, 72, "Input"],
Cell[CellGroupData[{
Cell[10745, 291, 3219, 94, 238, "Input"],
Cell[13967, 387, 3322, 65, 195, "Output"],
Cell[17292, 454, 3308, 65, 195, "Output"],
Cell[20603, 521, 3305, 65, 206, "Output"],
Cell[23911, 588, 4272, 85, 239, "Output"]
}, Open  ]],
Cell[28198, 676, 96, 1, 31, InheritFromParent],
Cell[28297, 679, 96, 1, 31, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature DvpIUgEpWNT@mCKkvGtwSAXd *)
