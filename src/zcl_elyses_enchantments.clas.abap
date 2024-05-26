CLASS zcl_elyses_enchantments DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_stack TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    "! Get card at position
    METHODS get_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
      RETURNING VALUE(result) TYPE i.

    "! Replace card at position
    METHODS set_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
                replacement   TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "Add card to stack
    METHODS insert_item_at_top
      IMPORTING stack         TYPE ty_stack
                new_card      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove card at position
    METHODS remove_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove top card (last row)
    METHODS remove_item_from_top
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE ty_stack.

    "! Add card to bottom of stack (first row)
    METHODS insert_item_at_bottom
      IMPORTING stack         TYPE ty_stack
                new_card      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove bottom card (delete first row)
    METHODS remove_item_from_bottom
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE ty_stack.

    "! Count cards
    METHODS get_size_of_stack
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_elyses_enchantments IMPLEMENTATION.

  METHOD get_item.
    "Implement solution here
    result = stack[ position ].
  ENDMETHOD.


  METHOD set_item.
    "Implement solution here
    data(new_stack) = stack.
    new_stack[ position ] = replacement.
    result = new_stack.
  ENDMETHOD.


  METHOD insert_item_at_top.
    "Implement solution here
    data(new_stack) = stack.
    append new_card to new_stack.
    result = new_stack.
  ENDMETHOD.


  METHOD get_size_of_stack.
    "Implement solution here
    result = lines( stack ).
  ENDMETHOD.


  METHOD insert_item_at_bottom.
    "Implement solution here
    data(new_stack) = stack.
    insert new_card into new_stack index 1.
    result = new_stack.
  ENDMETHOD.


  METHOD remove_item.
    "Implement solution here
    data(new_stack) = stack.
    delete new_stack index position.
    result = new_stack.

  ENDMETHOD.


  METHOD remove_item_from_bottom.
    "Implement solution here
    data(new_stack) = stack.
    delete new_stack index 1.
    result = new_stack.
  ENDMETHOD.


  METHOD remove_item_from_top.
    "Implement solution here
    data(new_stack) = stack.
    delete new_stack index lines( new_stack ).
    result = new_stack.
  ENDMETHOD.

ENDCLASS.

