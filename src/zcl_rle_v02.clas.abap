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

    DATA ind TYPE i VALUE 0.
    DATA ind_2 TYPE i VALUE 1.
    DATA c TYPE c.
    DATA c_2 TYPE c.
    DATA number TYPE i VALUE 1.

    WHILE ind_2 <= strlen( input ).
      IF ind_2 <= strlen( input ) AND ind < strlen( input ).
        IF ind_2 = strlen( input ) AND c = c_2 AND c = ' '.
          result = |{ result }{ number } |.
        ENDIF.
        c = input+ind(1).
        IF ind + 1 <> strlen( input ).
          c_2 = input+ind_2(1).
        ELSE.
          c_2 = ''.
        ENDIF.
        IF c = c_2.
          number = number + 1.
          ind = ind + 1.
          ind_2 = ind_2 + 1.
        ELSEIF c = ' ' AND c_2 <> ' '.
          IF number <> 1.
            result = |{ result }{ number } |.
          ELSE.
            result = |{ result } |.
          ENDIF.
          number = 1.
          ind = ind + 1.
          ind_2 = ind_2 + 1.
          CONTINUE.
        ELSE.
          IF number > 1.
            result = |{ result }{ number }{ c }|.
          ELSEIF number = 1.
            result = |{ result }{ c }|.
          ENDIF.
          ind = ind + 1.
          ind_2 = ind_2 + 1.
          number = 1.
        ENDIF.

      ELSE.
        CONTINUE.
      ENDIF.
    ENDWHILE.
  ENDMETHOD.


  METHOD decode.

    data ind type i value 0.
    data c type c.
    data number type string.

    while ind <= strlen( input ).
        if ind = strlen( input ).
            exit.
            else.
                c = input+ind(1).
                 if c CO '123456789'.
                    number = number && c.
                    ind = ind + 1.
                    CONTINUE.
                 else.
                    if number = ''.
                        if c = ''.
                            do 1 times.
                                result = |{ result } |.
                            ENDDO.
                        else.
                            do 1 times.
                                result = |{ result }{ c }|.
                            enddo.
                        endif.
                    else.
                        if c = ''.
                            do number times.
                                result = |{ result } |.
                            ENDDO.
                        else.
                            do number times.
                                result = |{ result }{ c }|.
                            enddo.
                        endif.
                    endif.
                    ind = ind + 1.
                    clear number.
                 endif.
        endif.


    ENDWHILE.

  ENDMETHOD.

ENDCLASS.

