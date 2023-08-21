local M = {}

local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta


local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe

function M.retrieve(is_math)
  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    wordTrig = false,
    condition = pipe({ is_math }),
    show_condition = is_math,
  }) --[[@as function]]

  return {

  -- Chemistry
  ls.parser.parse_snippet({ trig = "chemabove", name = "chemabove" }, "\\chemabove{$1}{$2}$0"),
  ls.parser.parse_snippet({ trig = "chemname", name = "chemname" }, "\\chemname{\\chemfig{$1}}{$2}$0"),
  ls.parser.parse_snippet({ trig = "oplus", name = "oplus" }, "\\oplus"),
  ls.parser.parse_snippet({ trig = "ominus", name = "ominus" }, "\\ominus"),
  ls.parser.parse_snippet({ trig = "lone-pair", name = "lone-pair" }, "\\charge{${1:angle}=\\:}{${2:atom}}$0"),
  ls.parser.parse_snippet({ trig = "radical", name = "free radical" }, "\\charge{90=\\.}{${1:atom}}$0"),
  ls.parser.parse_snippet({ trig = "mechanism-arrow", name = "mechanism arrow" }, "\\chemmove{\\draw(${1:Initial_node}).. controls +(${3:Initial_angle}:5mm) and +(${4:Final_angle}:5mm).. (${2:Final_node});}$0"),
  ls.parser.parse_snippet({ trig = "reaction-scheme", name = "reaction scheme" }, "\\schemestart[][west]\n$0\n\\schemestop"),
  ls.parser.parse_snippet({ trig = "dqd", name = "dollar-quad-dollar" }, "$\\quad$ "),



  -- Chemfig figures

 -- Common
  ls.parser.parse_snippet({ trig = "ethene", name = "ethene stretched" }, "C(-[3]H)(-[5]H)=C(-[1]H)(-[7]H)"),
  ls.parser.parse_snippet({ trig = "tert-alkyl", name = "tertiary alkyl" }, "C(-[4]R)(-[2]R)(-[6]R)-"),
  ls.parser.parse_snippet({ trig = "ketone", name = "ketone" }, "C(=[2]O)-"),
  ls.parser.parse_snippet({ trig = "carboxy-group", name = "Carboxy Group" }, "C(=[2]O)-"),
  ls.parser.parse_snippet({ trig = "aldehyde", name = "aldehyde" }, "C(=[2]O)-H"),
  ls.parser.parse_snippet({ trig = "aldehyde-reversed", name = "aldehyde reversed" }, "H-C(=[2]O)-"),
  ls.parser.parse_snippet({ trig = "carboxylic-acid", name = "carboxylic-acid" }, "C(=[2]O)-OH"),
  ls.parser.parse_snippet({ trig = "carboxylic-acid-reversed", name = "carboxylic-acid-reversed" }, "HO-C(=[2]O)-"),
 -- Benzene Derivatives
  s({ trig = "benzene", name = "benzene" }, c(1, {fmta("*6(-=-=<>-=)<>", {i(1), i(2)}), fmta("**6(----<>--)<>", {i(1), i(2)})})),
  ls.parser.parse_snippet({ trig = "naphthalene", name = "naphthalene" }, "*6(-=(*6(-=-=--))-=-=)"),
 -- ls.parser.parse_snippet({ trig = "toluene", name = "toluene" }, "*6(-=-=(-CH_3)-=)$0"),
  ls.parser.parse_snippet({ trig = "benzaldehyde", name = "benzaldehyde" }, "*6(-=-=(-CHO)-=)$0"),
  ls.parser.parse_snippet({ trig = "aniline", name = "aniline" }, "*6(-=-=(-NH_2)-=)$0"),
  ls.parser.parse_snippet({ trig = "nitrobenzene", name = "aniline" }, "*6(-=-=(-NO_2)-=)$0"),

-- Cyclic Compounds
  ls.parser.parse_snippet({ trig = "cyclopropane", name = "cyclopropane" }, "*3(---)"),
  ls.parser.parse_snippet({ trig = "cyclobutane", name = "cyclobutane" }, "*4(----)"),
  ls.parser.parse_snippet({ trig = "cyclopentane", name = "cyclopentane" }, "*5(-----)"),
  ls.parser.parse_snippet({ trig = "cyclohexane", name = "cyclohexane" }, "*6(------)"),


  }
end

return M
