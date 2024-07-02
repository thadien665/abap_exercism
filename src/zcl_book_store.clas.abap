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

    types: begin of counter_struct,
           book_id type i,
           quantity type i,
           end of counter_struct.

    data counter_table_p type table of counter_struct.

    counter_table_p = value #( ( book_id = 1 )
                             ( book_id = 2 )
                             ( book_id = 3 )
                             ( book_id = 4 )
                             ( book_id = 5 ) ).

    loop at basket ASSIGNING FIELD-SYMBOL(<pointer_a>).
        counter_table_p[ book_id = <pointer_a> ]-quantity += 1.
    endloop.

    sort counter_table_p by quantity DESCENDING.

    data counter_table type table of counter_struct.
    data max_stack type i value 5.
    data sets_table type table of string.
    data current_id_txt type string.
    data index type i value 1.
    data index_out type i value 1.

    types summ type p LENGTH 3 DECIMALS 1.
    data summ_total type summ.
    data summ_table type table of summ.

    do 5 times.
    counter_table = counter_table_p.
    loop at counter_table ASSIGNING field-SYMBOL(<pointer_counter>).
        index_out = sy-tabix.
        do <pointer_counter>-quantity times.
            if <pointer_counter>-quantity <= 0.
                CONTINUE.
            endif.
            if lines( sets_table ) = 0.
                append <pointer_counter>-book_id to sets_table.
                counter_table[ index_out ]-quantity -= 1.
                CONTINUE.
            endif.
            loop at sets_table ASSIGNING FIELD-SYMBOL(<pointer_set>).
                if <pointer_counter>-quantity = 0.
                    exit.
                endif.
                current_id_txt = <pointer_counter>-book_id.
                if sets_table[ sy-tabix ] NS current_id_txt and strlen( sets_table[ sy-tabix ] ) < 2 * max_stack.
                    sets_table[ sy-tabix ] = sets_table[ sy-tabix ] && current_id_txt.
                    counter_table[ index_out ]-quantity -= 1.
                elseif sy-tabix = lines( sets_table ).
                    append <pointer_counter>-book_id to sets_table.
                    counter_table[ index_out ]-quantity -= 1.
                    CONTINUE.
*                elseif sy-tabix = lines( sets_table ) and sets_table[ sy-tabix ] CA current_id_txt.
*
                else.

                    CONTINUE.
                endif.
            endloop.
         enddo.
    endloop.

    loop at sets_table ASSIGNING FIELD-SYMBOL(<pointer_summ>).
        case strlen( <pointer_summ> ) / 2.
            when 5.
                summ_total += '30'.
            when 4.
                summ_total += '25.6'.
            when 3.
                summ_total += '21.6'.
            when 2.
                summ_total += '15.2'.
            when 1.
                summ_total += '8'.
        endcase.
    endloop.

    append summ_total to summ_table.
    clear summ_total.
    clear sets_table.

    max_stack -= 1.

    enddo.

    sort summ_table ASCENDING.

    total = summ_table[ 1 ].

  ENDMETHOD.

ENDCLASS.

