CLASS zcl_clock DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.

  PRIVATE SECTION.

* add solution here
    data clock type utclong.
    data wynik type utclong.

ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.

  METHOD add.
* add solution here
        clock = utclong_add( val = clock minutes = !minutes ).
  ENDMETHOD.


  METHOD constructor.
* add solution here

    data(wynik) = utclong_current(  ).
    wynik = '2000-01-01 00:00:00.0000000'.
    wynik = utclong_add( val = wynik hours = !hours minutes = !minutes ).
    clock = wynik.

  ENDMETHOD.


  METHOD get.
* add solution here
    data final type string.
    final = clock.
    result = final+11(5).
  ENDMETHOD.


  METHOD sub.
* add solution here
       clock = utclong_add( val = clock minutes = ( !minutes * -1 ) ).
  ENDMETHOD.
ENDCLASS.

