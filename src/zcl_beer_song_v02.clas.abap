CLASS zcl_beer_song_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS recite
      IMPORTING
        !initial_bottles_count TYPE i
        !take_down_count       TYPE i
      RETURNING
        VALUE(result)          TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_beer_song_v02 IMPLEMENTATION.

  METHOD recite.
    " add solution here
    data(quantity) = initial_bottles_count.
    data(paste) = take_down_count.

    do paste times.
            if quantity between 3 and 99.
                if paste = 1.
                    append |{ quantity } { 'bottles of beer on the wall,' } { quantity } { 'bottles of beer.' }| to result.
                    append |{ 'Take one down and pass it around,' } { quantity - 1 } { 'bottles of beer on the wall.' }| to result.
                else.
                    append |{ quantity } { 'bottles of beer on the wall,' } { quantity } { 'bottles of beer.' }| to result.
                    append |{ 'Take one down and pass it around,' } { quantity - 1 } { 'bottles of beer on the wall.' }| to result.
                    append || to result.
                    quantity = quantity - 1.
                    paste = paste - 1.
                endif.

            elseif quantity = 2.
                if paste = 1.
                    append |{ '2 bottles of beer on the wall, 2 bottles of beer.' }| to result.
                    append |{ 'Take one down and pass it around, 1 bottle of beer on the wall.' }| to result.
                else.
                    append |{ '2 bottles of beer on the wall, 2 bottles of beer.' }| to result.
                    append |{ 'Take one down and pass it around, 1 bottle of beer on the wall.' }| to result.
                    append || to result.
                    quantity = quantity - 1.
                    paste = paste - 1.
                endif.
            elseif quantity = 1.
                if paste = 1.
                    append |{ '1 bottle of beer on the wall, 1 bottle of beer.' }| to result.
                    append |{ 'Take it down and pass it around, no more bottles of beer on the wall.' }| to result.
                else.
                    append |{ '1 bottle of beer on the wall, 1 bottle of beer.' }| to result.
                    append |{ 'Take it down and pass it around, no more bottles of beer on the wall.' }| to result.
                    append || to result.
                    quantity = quantity - 1.
                    paste = paste - 1.
                endif.
            else.
                    append |{ 'No more bottles of beer on the wall, no more bottles of beer.' }| to result.
                    append |{ 'Go to the store and buy some more, 99 bottles of beer on the wall.' }| to result.
            endif.
     enddo.

  ENDMETHOD.

ENDCLASS.

