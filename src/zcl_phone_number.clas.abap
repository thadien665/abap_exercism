CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_phone_number IMPLEMENTATION.

  METHOD clean.
" add your code here
  data c type c.
  data test type string.
  test = number.
  data ind type i value 0.

    REPLACE all OCCURRENCES OF ` ` in test with ''.

    while ind <> strlen( test ) and test CN '0123456789'.
        c = test+ind(1).
            if c CO '0123456789'.
                ind = ind + 1.
                continue.
            else.
                test = replace( val = test sub = c with = '' ).
                ind = ind + 1.
            endif.
    endwhile.

    if strlen( test ) = 11.
        if test+0(1) = 1.
            test = shift_left( val = test places = 1 ).
        else.
            raise EXCEPTION type cx_parameter_invalid.
        endif.
    endif.

    if strlen( test ) = 10.
        if test+0(1) CO '23456789' and test+3(1) CO '23456789'.
            result = test.
        else.
            raise EXCEPTION type cx_parameter_invalid.
        endif.
    elseif strlen( test ) < 10 or strlen( test ) > 11.
        raise EXCEPTION type cx_parameter_invalid.
    endif.

  ENDMETHOD.
ENDCLASS.

