CLASS zcl_state_of_tic_tac_toe DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES player_type TYPE c LENGTH 1.
    "! E.g., ( ( `XOO` ) ( ` X ` ) ( `  X` ) )
    TYPES board_type TYPE TABLE OF string INITIAL SIZE 3.

    CONSTANTS: BEGIN OF player_enum,
                 one TYPE player_type VALUE 'X',
                 two TYPE player_type VALUE 'O',
               END OF player_enum.

    CONSTANTS: BEGIN OF state_enum,
                 ongoing_game TYPE string VALUE `Ongoing game`,
                 draw         TYPE string VALUE `Draw`,
                 win          TYPE string VALUE `Win`,
               END OF state_enum.

    "! @parameter state | Possible values are enumerated in state_enum
    "! @raising cx_parameter_invalid | Board is invalid
    METHODS get_state
      IMPORTING board        TYPE board_type
      RETURNING VALUE(state) TYPE string
      RAISING   cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_state_of_tic_tac_toe IMPLEMENTATION.

  METHOD get_state.
    " add solution here

    data(horizontal_row_1) = board[ 1 ].
    data(horizontal_row_2) = board[ 2 ].
    data(horizontal_row_3) = board[ 3 ].

    data(vertical_row_1) = horizontal_row_1+0(1) && horizontal_row_2+0(1) && horizontal_row_3+0(1).
    data(vertical_row_2) = horizontal_row_1+1(1) && horizontal_row_2+1(1) && horizontal_row_3+1(1).
    data(vertical_row_3) = horizontal_row_1+2(1) && horizontal_row_2+2(1) && horizontal_row_3+2(1).

    data(diagonal_1) = horizontal_row_1+0(1) && horizontal_row_2+1(1) && horizontal_row_3+2(1).
    data(diagonal_2) = horizontal_row_1+2(1) && horizontal_row_2+1(1) && horizontal_row_3+0(1).

    data(all_rows) = horizontal_row_1 && horizontal_row_2 && horizontal_row_3.

    data(quantity_X) = count( val = all_rows sub = 'X' ).
    data(quantity_O) = count( val = all_rows sub = 'O' ).



    data horizontal_rows_table type table of string.

    horizontal_rows_table = VALUE #( ( horizontal_row_1 )
                                     ( horizontal_row_2 )
                                     ( horizontal_row_3 ) ).

    data vertical_rows_table type table of string.

    vertical_rows_table = VALUE #( ( vertical_row_1 )
                                     ( vertical_row_2 )
                                     ( vertical_row_3 ) ).

    if quantity_x = 0 or
       quantity_o > quantity_x or
       quantity_x > 1 and quantity_o = 0.
       raise EXCEPTION type cx_parameter_invalid.
       return.
    else.
        if diagonal_1 CO 'X' or diagonal_1 CO 'O' or
           diagonal_2 CO 'X' or diagonal_2 CO 'O'.
                state = state_enum-win.
                return.
        endif.

        data(horizontal_index) = 1.
        loop at horizontal_rows_table ASSIGNING FIELD-SYMBOL(<horizontal_row_pointer>).
            if <horizontal_row_pointer> CO 'X' or <horizontal_row_pointer> CO 'O' and <horizontal_row_pointer> NA ` `.
               delete horizontal_rows_table INDEX horizontal_index.
               loop at horizontal_rows_table ASSIGNING FIELD-SYMBOL(<h_internal_row_pointer>).
                    if <h_internal_row_pointer> CO 'X' or <h_internal_row_pointer> CO 'O' and <h_internal_row_pointer> NA ` `.
                        raise EXCEPTION type cx_parameter_invalid.
                        return.
                    else.
                        state = state_enum-win.
                        return.
                    endif.
               endloop.
            endif.
            horizontal_index = horizontal_index + 1.
        endloop.

        data(vertical_index) = 1.
        loop at vertical_rows_table ASSIGNING FIELD-SYMBOL(<vertical_row_pointer>).
            if <vertical_row_pointer> CO 'X' or <vertical_row_pointer> CO 'O' and <vertical_row_pointer> NA ` `.
               delete vertical_rows_table INDEX vertical_index.
               loop at vertical_rows_table ASSIGNING FIELD-SYMBOL(<v_internal_row_pointer>).
                    if <v_internal_row_pointer> CO 'X' or <v_internal_row_pointer> CO 'O' and <v_internal_row_pointer> NA ` `.
                        raise EXCEPTION type cx_parameter_invalid.
                        return.
                    else.
                        state = state_enum-win.
                        return.
                    endif.
               endloop.
            endif.

            vertical_index = vertical_index + 1.

        endloop.

        if quantity_x >= quantity_o.
            if all_rows NA ` `.
                state = state_enum-draw.
                return.
            else.
                state = state_enum-ongoing_game.
                return.
            endif.
        endif.



    endif.



  ENDMETHOD.

ENDCLASS.

