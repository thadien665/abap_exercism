CLASS zcl_crypto_square_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS encode IMPORTING plain_text         TYPE string
                   RETURNING VALUE(crypto_text) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crypto_square_v02 IMPLEMENTATION.
  METHOD encode.
    "Implement Solution

    data letters type string value 'abcdefghijklmnoprstquvwxyz1234567890'.
    data ind type i value 0.
    data b type string.
    data corrected_new_text type string.
    data(new_text) = to_lower( plain_text ).


    while ind NE strlen( new_text ).
        if new_text+ind(1) CA letters.
            corrected_new_text = corrected_new_text && new_text+ind(1).
        endif.
        if ind NE strlen( new_text ).
            ind = ind + 1.
        endif.
    endwhile.

    data number_of_letters type p LENGTH 2 DECIMALS 2.
    data(quantity_of_letters) = strlen( corrected_new_text ).
    number_of_letters = sqrt( quantity_of_letters ).

    data(c_lowest) = ipow( base = floor( number_of_letters ) exp = 2 ).
    data(c_highest) = ipow( base = ceil( number_of_letters ) exp = 2 ).
    data(c_mid) = ceil( number_of_letters ) * floor( number_of_letters ).

    data c_final type i.
    data r_final type i.

    if abs( c_lowest - quantity_of_letters ) > abs( c_mid - quantity_of_letters ).
       if abs( c_highest - quantity_of_letters ) > abs( c_mid - quantity_of_letters ).
            c_final = ceil( number_of_letters ).
            r_final = floor( number_of_letters ).
       elseif
          abs( c_highest - quantity_of_letters ) < abs( c_mid - quantity_of_letters ).
            c_final = sqrt( c_highest ).
            r_final = c_final.
       endif.
    elseif abs( c_lowest - quantity_of_letters ) <= abs( c_mid - quantity_of_letters ) and
           abs( c_lowest - quantity_of_letters ) < abs( c_highest - quantity_of_letters ).
                c_final = sqrt( c_lowest ).
                r_final = c_final.
    elseif c_lowest = c_highest.
        c_final = sqrt( c_highest ).
        r_final = c_final.
    endif.

    ind = 0.
    data temporary_row type string.
    data temporary_table type table of string.

    do r_final times.
        do c_final times.
                if ind < quantity_of_letters.
                    temporary_row = temporary_row && corrected_new_text+ind(1).
                else.
                    temporary_row = temporary_row && ` `.
                endif.
                ind = ind + 1.
        enddo.
        append temporary_row to temporary_table.
        data(lenght) = strlen( temporary_row ).
        clear temporary_row.
    enddo.

    ind = 0.
    data row type i value 1.
    data position type string.
    do c_final times.
        do r_final times.
            position = temporary_table[ row ].
            crypto_text = crypto_text && position+ind(1).
            row = row + 1.
        enddo.
        if strlen( crypto_text ) = ( c_final * r_final + c_final - 1 ).
            return.
        else.
        crypto_text = crypto_text && ` `.
        ind = ind + 1.
        row = 1.
        endif.
    enddo.

  ENDMETHOD.
ENDCLASS.
