;; extends 

(("del" @keyword) (#set! conceal "D"))
(("import" @include) (#set! conceal "i"))
(("while" @repeat) (#set! conceal "W"))
(("class" @keyword) (#set! conceal "c"))
(("assert" @keyword) (#set! conceal "?"))
(("global" @keyword) (#set! conceal "G"))
(("def" @keyword.function) (#set! conceal "f"))
(("break" @keyword) (#set! conceal "B"))
(("else" @conditional) (#set! conceal "e"))
((call function: (identifier) @function.builtin (#eq? @function.builtin "print")) (#set! conceal "p"))
(("or" @keyword.operator) (#set! conceal "|"))
(("and" @keyword.operator) (#set! conceal "&"))
(("for" @repeat) (#set! conceal "F"))
(("elif" @conditional) (#set! conceal "e"))
(("with" @keyword) (#set! conceal "w"))
(("if" @conditional) (#set! conceal "?"))
((yield ("from") @keyword) (#set! conceal "F"))
((import_from_statement ("from") @include) (#set! conceal "f"))
(("lambda" @include) (#set! conceal "λ"))
(("not" @keyword.operator) (#set! conceal "!"))
(("continue" @keyword) (#set! conceal "C"))
(("pass" @keyword) (#set! conceal "P"))
(("return" @keyword) (#set! conceal "R"))
(("yield" @keyword) (#set! conceal "Y"))
