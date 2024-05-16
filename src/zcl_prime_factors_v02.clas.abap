CLASS zcl_prime_factors_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS factors
      IMPORTING
        input         TYPE int8
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_prime_factors_v02 IMPLEMENTATION.
  METHOD factors.
    " add solution here

    data prime_nums type table of i.

    append 2 to prime_nums.

    data p_num type i.
    data number type i value 3.
    data rest type i.

    rest = input.
    while rest <> 1.
        loop at prime_nums ASSIGNING FIELD-SYMBOL(<a>).
            if rest mod <a> = 0.
                append <a> to result.
                rest = rest / <a>.
                exit.
            else.
               if sy-tabix <> lines( prime_nums ).
                    continue.
               else.
               loop at prime_nums ASSIGNING FIELD-SYMBOL(<b>).
                      if number mod <b> <> 0.
                          if sy-tabix <> lines( prime_nums ).
                              CONTINUE.
                          else.
                          append number to prime_nums.
                          number = number + 1.
                          exit.
                          ENDIF.
                      else.
                          number = number + 1.
                          continue.
                      endif.
                endloop.
                endif.
            endif.
        endloop.
    ENDWHILE.

  ENDMETHOD.


ENDCLASS.





*
* if number mod <a> <> 0.
*                    if sy-tabix = lines( prime_nums ).
*                        append number to prime_nums.
*                    else.
*                        CONTINUE.
*                    endif.
*                else.
*                    continue.
*
*                endif.
