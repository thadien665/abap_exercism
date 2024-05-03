CLASS zcl_atbash_cipher DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS decode
      IMPORTING
        cipher_text TYPE string
      RETURNING
        VALUE(plain_text)  TYPE string .
    METHODS encode
      IMPORTING
        plain_text        TYPE string
      RETURNING
        VALUE(cipher_text) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_atbash_cipher IMPLEMENTATION.

  METHOD decode.
* todo
data index type i value 0.
 data(input) = to_lower( cipher_text ).
 do strlen( input ) times.
    case input+index(1).
    when 'a'.
    plain_text = insert( val = plain_text sub = 'z' off = strlen( plain_text ) ).
    index = index + 1.
    when 'b'.
    plain_text = insert( val = plain_text sub = 'y' off = strlen( plain_text ) ).
    index = index + 1.
    when 'c'.
    plain_text = insert( val = plain_text sub = 'x' off = strlen( plain_text ) ).
    index = index + 1.
    when 'd'.
    plain_text = insert( val = plain_text sub = 'w' off = strlen( plain_text ) ).
    index = index + 1.
    when 'e'.
    plain_text = insert( val = plain_text sub = 'v'  off = strlen( plain_text ) ).
    index = index + 1.
    when 'f'.
    plain_text = insert( val = plain_text sub = 'u' off = strlen( plain_text ) ).
    index = index + 1.
    when 'g'.
    plain_text = insert( val = plain_text sub = 't' off = strlen( plain_text ) ).
    index = index + 1.
    when 'h'.
    plain_text = insert( val = plain_text sub = 's' off = strlen( plain_text ) ).
    index = index + 1.
    when 'i'.
    plain_text = insert( val = plain_text sub = 'r' off = strlen( plain_text ) ).
    index = index + 1.
    when 'j'.
    plain_text = insert( val = plain_text sub = 'q' off = strlen( plain_text ) ).
    index = index + 1.
    when 'k'.
    plain_text = insert( val = plain_text sub = 'p' off = strlen( plain_text ) ).
    index = index + 1.
    when 'l'.
    plain_text = insert( val = plain_text sub = 'o' off = strlen( plain_text ) ).
    index = index + 1.
    when 'm'.
    plain_text = insert( val = plain_text sub = 'n' off = strlen( plain_text ) ).
    index = index + 1.
    when 'n'.
    plain_text = insert( val = plain_text sub = 'm' off = strlen( plain_text ) ).
    index = index + 1.
    when 'o'.
    plain_text = insert( val = plain_text sub = 'l' off = strlen( plain_text ) ).
    index = index + 1.
    when 'p'.
    plain_text = insert( val = plain_text sub = 'k' off = strlen( plain_text ) ).
    index = index + 1.
    when 'q'.
    plain_text = insert( val = plain_text sub = 'j' off = strlen( plain_text ) ).
    index = index + 1.
    when 'r'.
    plain_text = insert( val = plain_text sub = 'i' off = strlen( plain_text ) ).
    index = index + 1.
    when 's'.
    plain_text = insert( val = plain_text sub = 'h' off = strlen( plain_text ) ).
    index = index + 1.
    when 't'.
    plain_text = insert( val = plain_text sub = 'g' off = strlen( plain_text ) ).
    index = index + 1.
    when 'u'.
    plain_text = insert( val = plain_text sub = 'f' off = strlen( plain_text ) ).
    index = index + 1.
    when 'v'.
    plain_text = insert( val = plain_text sub = 'e' off = strlen( plain_text ) ).
    index = index + 1.
    when 'w'.
    plain_text = insert( val = plain_text sub = 'd' off = strlen( plain_text ) ).
    index = index + 1.
    when 'x'.
    plain_text = insert( val = plain_text sub = 'c' off = strlen( plain_text ) ).
    index = index + 1.
    when 'y'.
    plain_text = insert( val = plain_text sub = 'b' off = strlen( plain_text ) ).
    index = index + 1.
    when 'z'.
    plain_text = insert( val = plain_text sub = 'a' off = strlen( plain_text ) ).
    index = index + 1.
    when '1'.
    plain_text = insert( val = plain_text sub = '1' off = strlen( plain_text ) ).
    index = index + 1.
    when '2'.
    plain_text = insert( val = plain_text sub = '2' off = strlen( plain_text ) ).
    index = index + 1.
    when '3'.
    plain_text = insert( val = plain_text sub = '3' off = strlen( plain_text ) ).
    index = index + 1.
    when '4'.
    plain_text = insert( val = plain_text sub = '4' off = strlen( plain_text ) ).
    index = index + 1.
    when '5'.
    plain_text = insert( val = plain_text sub = '5' off = strlen( plain_text ) ).
    index = index + 1.
    when '6'.
    plain_text = insert( val = plain_text sub = '6' off = strlen( plain_text ) ).
    index = index + 1.
    when '7'.
    plain_text = insert( val = plain_text sub = '7' off = strlen( plain_text ) ).
    index = index + 1.
    when '8'.
    plain_text = insert( val = plain_text sub = '8' off = strlen( plain_text ) ).
    index = index + 1.
    when '9'.
    plain_text = insert( val = plain_text sub = '9' off = strlen( plain_text ) ).
    index = index + 1.
    when '0'.
    plain_text = insert( val = plain_text sub = '0' off = strlen( plain_text ) ).
    index = index + 1.
    when others.
    index = index + 1.
 endcase.
enddo.
  ENDMETHOD.

  METHOD encode.
* todo

 data index type i value 0.
 data(input) = to_lower( plain_text ).
 do strlen( input ) times.
    case input+index(1).
    when 'a'.
    cipher_text = insert( val = cipher_text sub = 'z' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'b'.
    cipher_text = insert( val = cipher_text sub = 'y' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'c'.
    cipher_text = insert( val = cipher_text sub = 'x' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'd'.
    cipher_text = insert( val = cipher_text sub = 'w' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'e'.
    cipher_text = insert( val = cipher_text sub = 'v'  off = strlen( cipher_text ) ).
    index = index + 1.
    when 'f'.
    cipher_text = insert( val = cipher_text sub = 'u' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'g'.
    cipher_text = insert( val = cipher_text sub = 't' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'h'.
    cipher_text = insert( val = cipher_text sub = 's' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'i'.
    cipher_text = insert( val = cipher_text sub = 'r' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'j'.
    cipher_text = insert( val = cipher_text sub = 'q' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'k'.
    cipher_text = insert( val = cipher_text sub = 'p' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'l'.
    cipher_text = insert( val = cipher_text sub = 'o' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'm'.
    cipher_text = insert( val = cipher_text sub = 'n' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'n'.
    cipher_text = insert( val = cipher_text sub = 'm' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'o'.
    cipher_text = insert( val = cipher_text sub = 'l' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'p'.
    cipher_text = insert( val = cipher_text sub = 'k' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'q'.
    cipher_text = insert( val = cipher_text sub = 'j' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'r'.
    cipher_text = insert( val = cipher_text sub = 'i' off = strlen( cipher_text ) ).
    index = index + 1.
    when 's'.
    cipher_text = insert( val = cipher_text sub = 'h' off = strlen( cipher_text ) ).
    index = index + 1.
    when 't'.
    cipher_text = insert( val = cipher_text sub = 'g' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'u'.
    cipher_text = insert( val = cipher_text sub = 'f' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'v'.
    cipher_text = insert( val = cipher_text sub = 'e' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'w'.
    cipher_text = insert( val = cipher_text sub = 'd' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'x'.
    cipher_text = insert( val = cipher_text sub = 'c' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'y'.
    cipher_text = insert( val = cipher_text sub = 'b' off = strlen( cipher_text ) ).
    index = index + 1.
    when 'z'.
    cipher_text = insert( val = cipher_text sub = 'a' off = strlen( cipher_text ) ).
    index = index + 1.
    when '1'.
    cipher_text = insert( val = cipher_text sub = '1' off = strlen( cipher_text ) ).
    index = index + 1.
    when '2'.
    cipher_text = insert( val = cipher_text sub = '2' off = strlen( cipher_text ) ).
    index = index + 1.
    when '3'.
    cipher_text = insert( val = cipher_text sub = '3' off = strlen( cipher_text ) ).
    index = index + 1.
    when '4'.
    cipher_text = insert( val = cipher_text sub = '4' off = strlen( cipher_text ) ).
    index = index + 1.
    when '5'.
    cipher_text = insert( val = cipher_text sub = '5' off = strlen( cipher_text ) ).
    index = index + 1.
    when '6'.
    cipher_text = insert( val = cipher_text sub = '6' off = strlen( cipher_text ) ).
    index = index + 1.
    when '7'.
    cipher_text = insert( val = cipher_text sub = '7' off = strlen( cipher_text ) ).
    index = index + 1.
    when '8'.
    cipher_text = insert( val = cipher_text sub = '8' off = strlen( cipher_text ) ).
    index = index + 1.
    when '9'.
    cipher_text = insert( val = cipher_text sub = '9' off = strlen( cipher_text ) ).
    index = index + 1.
    when '0'.
    cipher_text = insert( val = cipher_text sub = '0' off = strlen( cipher_text ) ).
    index = index + 1.
    when others.
    index = index + 1.
 endcase.

 enddo.

    data index_out type i value 5.
    data blank type string value ` `.
        do strlen( cipher_text ) div 5 times.
            if index_out < strlen( cipher_text ).
                if index_out = 5.
                    cipher_text = insert( val = cipher_text sub = blank off = index_out ).
                    index_out = index_out + 6.
                else.
                    cipher_text = insert( val = cipher_text sub = blank off = index_out ).
                    index_out = index_out + 6.
                endif.
             else. exit. endif.
        enddo.
*    data blank type c length 9999.
*    OVERLAY cipher_text with blank ONLY '%'.
      ENDMETHOD.
ENDCLASS.

