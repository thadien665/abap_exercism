CLASS zcl_nth_prime_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS prime
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_nth_prime_v02 IMPLEMENTATION.
  METHOD prime.
    " add solution here
    types: begin of numbers,
           n_number type i,
           value type i,
           end of numbers.
    data numbers_table type standard table of numbers.

    data L type i value 2.
    data ind type i.

    if input = 0.
        raise EXCEPTION type cx_parameter_invalid.
    elseif input = 1.
        result = L.
    elseif input > 1.
        APPEND value #( n_number = 1 value = L ) to numbers_table.
        while input <> lines( numbers_table ).
            L = L + 1.
            loop at numbers_table ASSIGNING FIELD-SYMBOL(<a>).
                if L mod <a>-value = 0.
                    exit.
                elseif L mod <a>-value <> 0.
                    if sy-tabix = lines( numbers_table ).
                        APPEND value #( n_number = lines( numbers_table ) + 1 value = L ) to numbers_table.
                    else.
                        CONTINUE.
                    endif.
                exit.
                endif.
            endloop.
        ENDWHILE.
        result = numbers_table[ lines( numbers_table ) ]-value.
    endif.

  ENDMETHOD.


ENDCLASS.

