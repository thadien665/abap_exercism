CLASS zcl_word_count DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF return_structure,
        word  TYPE string,
        count TYPE i,
      END OF return_structure,
      return_table TYPE STANDARD TABLE OF return_structure WITH KEY word.
    METHODS count_words
      IMPORTING
        !phrase       TYPE string
      RETURNING
        VALUE(result) TYPE return_table .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_word_count IMPLEMENTATION.

  METHOD count_words.
    "Add solution here

   data temp_table type table of string.
   data ind type i value 0.
   data ind_2 type i value 0.
   data temp type string.

   data(temp_phrase) = to_lower( phrase ).
   data(alpha) = 'abcdefghijklmnoprestuqvwxyz1234567890'.

   REPLACE ALL OCCURRENCES OF '\n' in temp_phrase with ` `.
   REPLACE ALL OCCURRENCES OF ',' in temp_phrase with ` `.
   REPLACE ALL OCCURRENCES OF '.' in temp_phrase with ` `.

   split temp_phrase at space into table temp_table.

   loop at temp_table ASSIGNING FIELD-SYMBOL(<a>).
        ind_2 = 0.
        if <a> CO ` `.
            DELETE temp_table index sy-tabix.
        else.
            if <a> CN alpha.
                while ind_2 < strlen( <a> ).
                    if <a>+ind_2(1) CN alpha.
                       data(k) = temp_table[ sy-tabix ].
                       replace section offset ind_2 LENGTH 1 of k with ''.
                       temp_table[ sy-tabix ] = k.
                    else.
                       ind_2 = ind_2 + 1.
                       CONTINUE.
                    endif.
                ENDWHILE.
            endif.
        endif.
   endloop.

   loop at temp_table ASSIGNING FIELD-SYMBOL(<b>).
        if <b> CO ''.
            delete temp_table index sy-tabix.
        else.
            CONTINUE.
        endif.
   endloop.

   loop at temp_table ASSIGNING FIELD-SYMBOL(<c>).
        if lines( result ) = 0.
           append value #( word = <c> count = 1 ) to result.
        else.
            loop at result ASSIGNING FIELD-SYMBOL(<d>).
                if <c> = <d>-word.
                   <d>-count = <d>-count + 1.
                   exit.
                elseif sy-tabix < lines( result ).
                    continue.
                else.
                    append value #( word = <c> count = 1 ) to result.
                    exit.
                endif.
            endloop.

        endif.
   endloop.

  ENDMETHOD.
ENDCLASS.

