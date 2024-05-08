CLASS zcl_anagram_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS anagram
      IMPORTING
        input         TYPE string
        candidates    TYPE string_table
      RETURNING
        VALUE(result) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_anagram_v02 IMPLEMENTATION.
  METHOD anagram.
* add solution here
    data c type c.
    data ind type i value 0.
    data count_1 type i.
    data count_2 type i.
    data input_small type string.
    data cand_small type string.

    loop at candidates assigning FIELD-SYMBOL(<a>).
        ind = 0.
        while ind <> strlen( <a> ).
        input_small = to_lower( input ).
        cand_small = to_lower( <a> ).
        c = input_small+ind(1).
        count_1 = count( val = input_small sub = c ).
        count_2 = count( val = cand_small sub = c ).
        if count_1 = count_2.
            ind = ind + 1.
            if ( ind - 1 ) = strlen( <a> ).
                append <a> to result.
            endif.
        else.
            exit.
        endif.
        endwhile.

    endloop.
  ENDMETHOD.

ENDCLASS.

