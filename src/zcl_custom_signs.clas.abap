CLASS zcl_custom_signs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    "! Build a sign that includes both of the parameters.
    METHODS build_sign IMPORTING occasion      TYPE string
                                 name          TYPE string
                       RETURNING VALUE(result) TYPE string.

    "! Build a birthday sign that conditionally formats the return string.
    METHODS build_birthday_sign IMPORTING age           TYPE i
                                RETURNING VALUE(result) TYPE string.

    "! Build a graduation sign that includes multiple lines
    METHODS graduation_for IMPORTING name          TYPE string
                                     year          TYPE i
                           RETURNING VALUE(result) TYPE string.

    "! Determine cost based on each character of sign parameter that builds
    "! the template string that includes the currency parameter.
    METHODS cost_of IMPORTING sign          TYPE string
                              currency      TYPE string
                    RETURNING VALUE(result) TYPE string.

ENDCLASS.



CLASS zcl_custom_signs IMPLEMENTATION.


  METHOD build_sign.
    "Implement solution here
    result = |Happy { occasion } { name }!|.
  ENDMETHOD.


  METHOD build_birthday_sign.
    "Implement solution here
    if age >= 50.
        result = |Happy Birthday! What a mature fellow you are.|.
    else.
        result = |Happy Birthday! What a young fellow you are.|.
    endif.
  ENDMETHOD.


  METHOD graduation_for.
    "Implement solution here
    result = |Congratulations { name }!\nClass of { year }|.
  ENDMETHOD.


  METHOD cost_of.
    "Implement solution here
    result = |Your sign costs { 20 + 2 * strlen( sign ) }.00 { currency }.|.
  ENDMETHOD.


ENDCLASS.

