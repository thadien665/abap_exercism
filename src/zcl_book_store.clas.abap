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

  data: quan_1 type i,
        quan_2 type i,
        quan_3 type i,
        quan_4 type i,
        quan_5 type i,
        max_quan type i.

  data summ_table type table of p.



  loop at basket ASSIGNING FIELD-SYMBOL(<a>).
    if <a> = 1.
        quan_1 = quan_1 + 1.
    elseif <a> = 2.
        quan_2 = quan_2 + 1.
    elseif <a> = 3.
        quan_3 = quan_3 + 1.
    elseif <a> = 4.
        quan_4 = quan_4 + 1.
    elseif <a> = 5.
        quan_5 = quan_5 + 1.
    endif.
  endloop.
    UNASSIGN <a>.
  max_quan = nmax( val1 = quan_1 val2 = quan_2 val3 = quan_3 val4 = quan_4 val5 = quan_5 ).

  data temp_table type table of string.
    data temp type string.
    data ind type i.
  loop at basket ASSIGNING <a>.
    temp = <a>.
    if lines( temp_table ) = 0.
        append temp to temp_table.
        CONTINUE.
    else.
        loop at temp_table ASSIGNING FIELD-SYMBOL(<existing_row>).
            ind = sy-tabix.
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
         ENDLOOP.
    endif.
  ENDLOOP.
  UNASSIGN <a>.
  data summ type p LENGTH 3 DECIMALS 2.
  loop at temp_table ASSIGNING FIELD-SYMBOL(<b>).
    case strlen( <b> ).
        when 5.
            summ = summ + '30'.
        when 4.
            summ = summ + '25,6'.
        when 3.
            summ = summ + '21,6'.
        when 2.
            summ = summ + '15,2'.
        when 1.
            summ = summ + '8'.
    ENDCASE.
  endloop.
  append summ to summ_table.
  clear summ.
  clear temp_table.





  sort summ_table DESCENDING.
  total = summ_table[ 1 ].






  ENDMETHOD.

ENDCLASS.

