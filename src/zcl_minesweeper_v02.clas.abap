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
    data a_t type string.
    data ind type i value 0.
    data row type string.

    loop at input ASSIGNING FIELD-SYMBOL(<a>).
        ind = 0.
        while ind < strlen( <a> ).
            if <a>+ind(1) <> '*'.
                if ind = 0.
                    a = count_any_of( val = <a> sub = '*' off = ind len = 2 ).
                        if line_exists( input[ sy-tabix - 1 ] ).
                            a = a + count_any_of( val = input[ sy-tabix - 1 ] sub = '*' off = ind len = 2 ).
                        endif.
                        if line_exists( input[ sy-tabix + 1 ] ).
                            a = a + count_any_of( val = input[ sy-tabix + 1 ] sub = '*' off = ind len = 2 ).
                        endif.
                    if a <> 0.
                        row = row && a.
                    else.
                        row = |{ row } |.
                    endif.
                    ind = ind + 1.

                elseif ind = strlen( <a> ) or ind = strlen( <a> ) - 1.
                    a = count_any_of( val = <a> sub = '*' off = ind - 1 len = 2 ).
                        if line_exists( input[ sy-tabix - 1 ] ).
                            a = a + count_any_of( val = input[ sy-tabix - 1 ] sub = '*' off = ind - 1 len = 2 ).
                        endif.
                        if line_exists( input[ sy-tabix + 1 ] ).
                            a = a + count_any_of( val = input[ sy-tabix + 1 ] sub = '*' off = ind - 1 len = 2 ).
                        endif.
                    if a <> 0.
                        row = row && a.
                    else.
                        row = |{ row } |.
                    endif.
                    ind = ind + 1.
                else.
                    a = count_any_of( val = <a> sub = '*' off = ind - 1 len = 3 ).
                        if line_exists( input[ sy-tabix - 1 ] ).
                            a = a + count_any_of( val = input[ sy-tabix - 1 ] sub = '*' off = ind - 1 len = 3 ).
                        endif.
                        if line_exists( input[ sy-tabix + 1 ] ).
                            a = a + count_any_of( val = input[ sy-tabix + 1 ] sub = '*' off = ind - 1 len = 3 ).
                        endif.
                    if a <> 0.
                        row = row && a.
                    else.
                        row = |{ row } |.
                    endif.
                    ind = ind + 1.
                endif.
            else.
                row = row && '*'.
                ind = ind + 1.
                CONTINUE.
            endif.
        ENDWHILE.
        append row to result.
        clear row.
    endloop.
  ENDMETHOD.
ENDCLASS.
