CLASS zcl_isogram_v02 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS is_isogram
      IMPORTING
        VALUE(phrase)        TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram_v02 IMPLEMENTATION.

  METHOD is_isogram.
    " add solution here
    data test type string.
    data ind type i value 0.
    data char type c.

    test = to_lower( phrase ).

    if phrase is not initial.
        while ind < strlen( phrase ).
        char = test+ind(1).
         if count_any_of( val = test sub = char ) > 1.
            exit.
         elseif ind <= strlen( phrase ) and  count_any_of( val = test sub = char ) = 1.
            result = 'X'.
            exit.
         else.
            ind = ind + 1.
         endif.
        endwhile.
    else.
        result = 'X'.
    endif.
  ENDMETHOD.

ENDCLASS.

