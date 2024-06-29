CLASS zcl_affine_cipher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF key,
             a TYPE i,
             b TYPE i,
           END OF key.

    types integertab type STANDARD TABLE OF i with empty key.

    METHODS:
      encode IMPORTING phrase        TYPE string
                       key           TYPE key
             RETURNING VALUE(cipher) TYPE string
             RAISING   cx_parameter_invalid,
      decode IMPORTING cipher        TYPE string
                       key           TYPE key
             RETURNING VALUE(phrase) TYPE string
             RAISING   cx_parameter_invalid,
      get_prime_numbers
             IMPORTING m             TYPE i
             RETURNING value(prime_numbers) type integertab,
      check_coprime
             importing x type i
                       dividers type integertab
             RETURNING VALUE(result) type i
             RAISING   cx_parameter_invalid.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_affine_cipher IMPLEMENTATION.
  METHOD encode.
    "Implement solution

    data m type i value 26.

    data(prime_numbers_m) = get_prime_numbers( m = m ).

    data(prime_numbers_a) = get_prime_numbers( m = key-a ).

    data(check_coprime_m) = check_coprime( dividers = prime_numbers_m x = key-a ).
    data(check_coprime_a) = check_coprime( dividers = prime_numbers_a x = m ).

    data index_of_phrase type i value 0.
    data alphabet type string value 'abcdefghijklmnopqrstuvwxyz'.
    data special_letters type string value ',./_-!@#$%^&*()+=[{]}\|:;?'.
    data index_of_letter type i value 0.
    data temporary_index type i value 0.
    data new_index type i value 0.

    data lower_phrase type string.

    while index_of_letter NE strlen( phrase ).
        if phrase+index_of_letter(1) CA special_letters or phrase+index_of_letter(1) = ` `.
            index_of_letter = index_of_letter + 1.
            continue.
        else.
            lower_phrase = lower_phrase && to_lower( phrase+index_of_letter(1) ).
            index_of_letter = index_of_letter + 1.
        endif.
    ENDWHILE.

    do strlen( lower_phrase ) + 1 div 5 times.
        do 5 times.
        if lower_phrase+index_of_phrase(1) CA alphabet.
               if alphabet CA lower_phrase+index_of_phrase(1).
                    index_of_letter = sy-fdpos.
               endif.
               new_index = ( key-a * index_of_letter + key-b ) mod m.
               cipher = cipher && alphabet+new_index(1).
               temporary_index = 0.
               new_index = 0.

        elseif lower_phrase+index_of_phrase(1) CA '0123456789'.
            cipher = cipher && lower_phrase+index_of_phrase(1).
            index_of_phrase = index_of_phrase + 1.
            continue.
        else.
            index_of_phrase = index_of_phrase + 1.
            CONTINUE.
        endif.
        index_of_phrase = index_of_phrase + 1.
        if index_of_phrase >= strlen( lower_phrase ).
            return.
        endif.
        enddo.
        cipher = cipher && ` `.
    enddo.


  ENDMETHOD.

  METHOD decode.
    "Implement solution

    data alphabet_lenght type i VALUE 26.
    data m type i value 26.

    data(prime_numbers_m) = get_prime_numbers( m = alphabet_lenght ).

    data(prime_numbers_a) = get_prime_numbers( m = key-a ).

    data(check_coprime_m) = check_coprime( dividers = prime_numbers_m x = key-a ).
    data(check_coprime_a) = check_coprime( dividers = prime_numbers_a x = m ).

    data mmi type i value 0.

    while ( key-a * mmi ) mod m NE 1.
        mmi = mmi + 1.
    endwhile.

    data index_of_letter type i value 0.
    data alphabet type string value 'abcdefghijklmnopqrstuvwxyz'.
    data new_index type i value 0.
    data temporary_index type i value 0.

    while index_of_letter NE strlen( cipher ).
        if cipher+index_of_letter(1) CA alphabet.
            if alphabet CA cipher+index_of_letter(1).
                    temporary_index = sy-fdpos.
               endif.
            data(a_1) = temporary_index - key-b.
            new_index =  ( mmi * a_1 ) mod m .
            phrase = phrase && alphabet+new_index(1).
            index_of_letter = index_of_letter + 1.
            new_index = 0.
            temporary_index = 0.
            CONTINUE.
        elseif cipher+index_of_letter(1) CA '0123456789'.
            phrase = phrase && cipher+index_of_letter(1).
            index_of_letter = index_of_letter + 1.
            CONTINUE.
        else.
            index_of_letter = index_of_letter + 1.
            CONTINUE.
        endif.
        if index_of_letter >= strlen( cipher ).
            return.
        endif.
    endwhile.

  ENDMETHOD.

  method get_prime_numbers.
        data divider type i value 2.
        data prime_table_m type table of i.

        while divider NE ( m / 2 ) + 1.
        if m mod divider = 0.
            loop at prime_table_m ASSIGNING FIELD-SYMBOL(<pointer>).
                if divider mod <pointer> = 0.
                    CONTINUE.
                else.
                    exit.
                endif.
            endloop.
            append divider to prime_table_m.
        endif.
        divider = divider + 1.
    endwhile.

    prime_numbers = prime_table_m.

  endmethod.

  method check_coprime.
        loop at dividers ASSIGNING FIELD-SYMBOL(<pointer_a>).
            if x mod <pointer_a> = 0.
                result = 0.
                RAISE EXCEPTION TYPE cx_parameter_invalid.
            else.
                CONTINUE.
            endif.
        endloop.
        result = 1.
  endmethod.

ENDCLASS.

