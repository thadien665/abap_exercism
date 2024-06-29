CLASS zcl_triangle_V02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      is_equilateral
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_isosceles
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_scalene
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_valid
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_triangle_V02 IMPLEMENTATION.

  METHOD is_equilateral.
    "Implement solution

    if is_valid( side_a = side_a side_b = side_b side_c = side_c ) = abap_true.
         data(a) = 1.
    else.
        raise EXCEPTION type cx_parameter_invalid.
    endif.

    if side_a = side_b and side_b = side_c.
        result = abap_true.
    else.
        result = abap_false.
    endif.

  ENDMETHOD.

  METHOD is_isosceles.
    "Implement solution

    if is_valid( side_a = side_a side_b = side_b side_c = side_c ) = abap_true.
         data(a) = 1.
    else.
        raise EXCEPTION type cx_parameter_invalid.
    endif.

    if side_a = side_b or
       side_b = side_c or
       side_c = side_a.
    result = abap_true.
    else.
        result = abap_false.
    endif.

  ENDMETHOD.

  METHOD is_scalene.
    "Implement solution

    if is_valid( side_a = side_a side_b = side_b side_c = side_c ) = abap_true.
        data(a) = 1.
    else.
        raise EXCEPTION type cx_parameter_invalid.
    endif.

    if side_a NE side_b and side_b NE side_c and side_c NE side_a.
        result = abap_true.
    else.
        result = abap_false.
    endif.

  ENDMETHOD.

  method is_valid.

    if side_a + side_b >= side_c and
       side_a + side_c >= side_b and
       side_c + side_b >= side_a and
       side_a NE '0.0' and
       side_b NE '0.0' and
       side_c NE '0.0'.
       result = abap_true.
    else.
        raise EXCEPTION type cx_parameter_invalid.
    endif.

  endmethod.

ENDCLASS.

