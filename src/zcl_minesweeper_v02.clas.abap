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

    data counter type i.
    data ind type i value 0.
    data row type string.
    data row_previous type string.
    data row_next type string.
    data second_pointer_index type i value 0.
    data tab_index type i value 1.

    loop at input ASSIGNING FIELD-SYMBOL(<input_row>).
        ind = 0.

        while ind < strlen( <input_row> ).
            if <input_row>+ind(1) <> '*'.
                if line_exists( input[ tab_index - 1 ] ).
                    row_previous = input[ tab_index - 1 ].
                    second_pointer_index = 0.

                    while second_pointer_index < strlen( input[ tab_index - 1 ] ).
                         if second_pointer_index < ind - 1 or second_pointer_index > ind + 1.
                            second_pointer_index = second_pointer_index + 1.
                            continue.
                        else.
                            if row_previous+second_pointer_index(1) = '*'.
                                counter = counter + 1.
                                second_pointer_index = second_pointer_index + 1.
                            else.
                                second_pointer_index = second_pointer_index + 1.
                                continue.
                            endif.
                        endif.
                    endwhile.
                endif.

                if line_exists( input[ tab_index + 1 ] ).
                    row_next = input[ tab_index + 1 ].
                    second_pointer_index = 0.

                    while second_pointer_index < strlen( input[ tab_index + 1 ] ).
                         if second_pointer_index < ind - 1 or second_pointer_index > ind + 1.
                            second_pointer_index = second_pointer_index + 1.
                            continue.
                        else.
                            if row_next+second_pointer_index(1) = '*'.
                                counter = counter + 1.
                                second_pointer_index = second_pointer_index + 1.
                            else.
                                second_pointer_index = second_pointer_index + 1.
                                continue.
                            endif.

                        endif.
                    endwhile.

                endif.
                   second_pointer_index = 0.

                    while second_pointer_index < strlen( input[ tab_index ] ).
                        if second_pointer_index < ind - 1 or second_pointer_index > ind + 1.
                            second_pointer_index = second_pointer_index + 1.
                            continue.
                        else.
                            if <input_row>+second_pointer_index(1) = '*'.
                                counter = counter + 1.
                                second_pointer_index = second_pointer_index + 1.
                            else.
                                second_pointer_index = second_pointer_index + 1.
                                continue.
                            endif.
                        endif.
                   endwhile.

            else.
                row = row && '*'.
                ind = ind + 1.
                CONTINUE.
            endif.

              if counter <> 0.
                 row = row && counter.
              else.
                 row = |{ row } |.
              endif.

              ind = ind + 1.
              clear counter.
        endwhile.

        append row to result.
        clear row.
        tab_index = tab_index + 1.

    endloop.
  ENDMETHOD.
ENDCLASS.
