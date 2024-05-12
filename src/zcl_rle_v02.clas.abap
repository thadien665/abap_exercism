CLASS zcl_rle_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS encode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

    METHODS decode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

ENDCLASS.


CLASS zcl_rle_v02 IMPLEMENTATION.

  METHOD encode.
    "Add solution here

    data ind type i value 0.
    data ind_2 type i value 1.
    data c type c.
    data c_2 type c.
    data number type i value 1.

    while ind <= strlen( input ).
    if ind_2 <= strlen( input ) and ind < strlen( input ).
        c = input+ind(1).
        if ind + 1 <> strlen( input ).
        c_2 = input+ind_2(1).
        else. c_2 = ''.
        endif.
        if c = c_2.
            number = number + 1.
            ind = ind + 1.
            ind_2 = ind_2 + 1.
        elseif c = ' ' and c_2 <> ' '.
            if number <> 1.
                result = |{ result }{ number } |.
            else.
                result = |{ result } |.
            endif.
            number = 1.
            ind = ind + 1.
            ind_2 = ind_2 + 1.
            CONTINUE.
        else.
            if number > 1.
                result = |{ result }{ number }{ c }|.
            elseif number = 1.
                result = |{ result }{ c }|.
            endif.
            ind = ind + 1.
            ind_2 = ind_2 + 1.
            number = 1.
        endif.
    else.
        CONTINUE.
    endif.
    ENDWHILE.
  ENDMETHOD.


  METHOD decode.

    "Add solution here

  ENDMETHOD.

ENDCLASS.

