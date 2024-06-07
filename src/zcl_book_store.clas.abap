CLASS zcl_book_store DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "! ID of book to buy from 1 to 5
    TYPES book_id TYPE i.

    TYPES basket_type TYPE SORTED TABLE OF book_id
      WITH NON-UNIQUE KEY table_line.

    TYPES total TYPE p LENGTH 3 DECIMALS 2.

    METHODS calculate_total
      IMPORTING basket       TYPE basket_type
      RETURNING VALUE(total) TYPE total.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_book_store IMPLEMENTATION.

  METHOD calculate_total.
    " add solution here


  data summ_table type table of p.


    data temp_table type table of string.
    data temp type string.
    data ind type i.

    data max_rows type table of i.
    append 11 to max_rows.
    append 8 to max_rows.

    data: quantity_1 type i,
          quantity_5 type i.

    loop at basket ASSIGNING FIELD-SYMBOL(<c>).
        case <c>.
            when 1.
                quantity_1 = quantity_1 + 1.
            when 5.
                quantity_5 = quantity_5 + 1.
        ENDCASE.
    endloop.

    data basket_p type table of book_id.

    basket_p = basket.

    if quantity_5 > quantity_1.
        sort basket_p DESCENDING.
    endif.


    loop at max_rows ASSIGNING FIELD-SYMBOL(<max_stack>).
      loop at basket_p ASSIGNING FIELD-SYMBOL(<a>).
        temp = <a>.
        if lines( temp_table ) = 0.
            append temp to temp_table.
            CONTINUE.
        else.
            loop at temp_table ASSIGNING FIELD-SYMBOL(<existing_row>).
                ind = sy-tabix.
                    if strlen( <existing_row> ) < <max_stack>.
                        if <existing_row> CS temp.
                            if ind = lines( temp_table ).
                                append temp to temp_table.
                                exit.
                            else.
                                CONTINUE.
                            endif.
                        else.
                            temp_table[ ind ] = temp_table[ ind ] && temp.
                            exit.
                        endif.
                     else.
                        continue.
                     endif.
             ENDLOOP.
        endif.
      ENDLOOP.





      data summ type p LENGTH 3 DECIMALS 2.
      loop at temp_table ASSIGNING FIELD-SYMBOL(<b>).
        case strlen( <b> ).
            when 10.
                summ = summ + '30'.
            when 8.
                summ = summ + '25.6'.
            when 6.
                summ = summ + '21.6'.
            when 4.
                summ = summ + '15.2'.
            when 2.
                summ = summ + '8'.
        ENDCASE.
      endloop.
      append summ to summ_table.
      clear summ.
      clear temp_table.


      loop at basket_p ASSIGNING <a>.
        temp = <a>.
        if lines( temp_table ) = 0.
            append temp to temp_table.
            CONTINUE.
        else.
            loop at temp_table ASSIGNING <existing_row>.
                ind = sy-tabix.
                    if temp NE basket_p[ 1 ].
                      if  ind NE lines( temp_table ).
                           if strlen( <existing_row> ) > strlen( temp_table[ ind + 1 ] ).
                                CONTINUE.
                           else.
                               if <existing_row> CS temp.
                                  CONTINUE.
                               else.
                                  temp_table[ ind ] = temp_table[ ind ] && temp.
                                  exit.
                               endif.
                           endif.
                      else.
                          temp_table[ ind ] = temp_table[ ind ] && temp.
                          exit.
                       endif.
                    else.
                       append temp to temp_table.
                       exit.
                    endif.
             ENDLOOP.
        endif.
      ENDLOOP.

  endloop.




  sort summ_table DESCENDING.
  total = summ_table[ 1 ].






  ENDMETHOD.

ENDCLASS.

