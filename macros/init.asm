.data
init: .asciz "Escreva uma letra: "
.macro INIT()
    PRINT(init)
    GET_INPUT_CHAR()
    ALPHABET_MAPPING(s0)
    NEW_LINE()
    PRINT(init)
    GET_INPUT_CHAR()
    ALPHABET_MAPPING(s0)
    NEW_LINE()
    PRINT(init)
    GET_INPUT_CHAR()
    ALPHABET_MAPPING(s0)
    NEW_LINE()
    SET_NEW_CELL()
    SET_NEW_CELL()
.end_macro