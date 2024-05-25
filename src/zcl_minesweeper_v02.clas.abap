CLASS zcl_minesweeper_v02 DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS annotate
        IMPORTING
          !input        TYPE string_table
        RETURNING
          VALUE(result) TYPE string_table.

ENDCLASS.



CLASS ZCL_MINESWEEPER_V02 IMPLEMENTATION.


  METHOD annotate.
    " add solution here

    data a type i.
    data ind type i value 0.
    data row type string.
    data row_p type string.
    data row_n type string.
    data b type i value 0.

    loop at input ASSIGNING FIELD-SYMBOL(<a>).
        ind = 0.
        while ind < strlen( <a> ).
            if <a>+ind(1) <> '*'.
                if line_exists( input[ sy-tabix - 1 ] ).
                    row_p = input[ sy-tabix - 1 ].
                    b = 0.
                    while b < strlen( input[ sy-tabix - 1 ] ).
*                        if b not BETWEEN ind - 1 and ind + 1.
                         if b < ind - 1 or b > ind + 1.
                            b = b + 1.
                            continue.
                        else.
                            if row_p+b(1) = '*'.
                                a = a + 1.
                                b = b + 1.
                            else.
                                b = b + 1.
                                continue.
                            endif.
                        endif.
                    endwhile.
                endif.
                if line_exists( input[ sy-tabix + 1 ] ).
                    row_n = input[ sy-tabix + 1 ].
                    b = 0.
                    while b < strlen( input[ sy-tabix + 1 ] ).
*                        if b not BETWEEN ind - 1 and ind + 1.
                         if b < ind - 1 or b > ind + 1.
                            b = b + 1.
                            continue.
                        else.
                            if row_n+b(1) = '*'.
                                a = a + 1.
                                b = b + 1.
                            else.
                                b = b + 1.
                                continue.
                            endif.

                        endif.
                    endwhile.
                endif.
                   b = 0.
                    while b < strlen( input[ sy-tabix ] ).
*                        if b not BETWEEN ind - 1 and ind + 1.
                        if b < ind - 1 or b > ind + 1.
                            b = b + 1.
                            continue.
                        else.
                            if <a>+b(1) = '*'.
                                a = a + 1.
                                b = b + 1.
                            else.
                                b = b + 1.
                                continue.
                            endif.
                        endif.
                   endwhile.
            else.
                row = row && '*'.
                ind = ind + 1.
                CONTINUE.
            endif.
              if a <> 0.
                 row = row && a.
              else.
                 row = |{ row } |.
              endif.
              ind = ind + 1.
              clear a.
        endwhile.
        append row to result.
        clear row.
    endloop.
  ENDMETHOD.
ENDCLASS.
