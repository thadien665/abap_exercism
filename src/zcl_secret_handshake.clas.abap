CLASS zcl_secret_handshake DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_commands
      IMPORTING code            TYPE i
      RETURNING VALUE(commands) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_secret_handshake IMPLEMENTATION.

  METHOD get_commands.
    " add solution here

    data binary type string.
    data qont type i.

    qont = code.

    if qont = 0.
        exit.
    endif.

    while qont NE 0.
        if qont mod 2 = 0.
           binary = 0 && binary.
        else.
           binary = 1 && binary.
        endif.
        qont = qont div 2.
    endwhile.

    data(ind) = strlen( binary ) - 1.

    if binary+ind(1) = 1 and ind > 0.
        append 'wink' to commands.
        ind = ind - 1.
    elseif binary+ind(1) = 1 and ind = 0.
        append 'wink' to commands.
        exit.
    elseif ind > 0.
        ind = ind - 1.
    elseif ind = 0.
        exit.
    endif.


    if binary+ind(1) = 1 and ind > 0.
        append 'double blink' to commands.
        ind = ind - 1.
    elseif binary+ind(1) = 1 and ind = 0.
        append 'double blink' to commands.
        exit.
    elseif ind > 0.
        ind = ind - 1.
    elseif ind = 0.
        exit.
    endif.

    if binary+ind(1) = 1 and ind > 0.
        append 'close your eyes' to commands.
        ind = ind - 1.
    elseif binary+ind(1) = 1 and ind = 0.
        append 'close your eyes' to commands.
        exit.
    elseif ind > 0.
        ind = ind - 1.
    elseif ind = 0.
        exit.
    endif.

    if binary+ind(1) = 1 and ind > 0.
        append 'jump' to commands.
        ind = ind - 1.
    elseif binary+ind(1) = 1 and ind = 0.
        append 'jump' to commands.
        exit.
    elseif ind > 0.
        ind = ind - 1.
    elseif ind = 0.
        exit.
    endif.

    if binary+ind(1) = 1.
        data temp_table type string_table.
        data ind_2 type i value 1.
        while ind_2 < lines( commands ) + 1.
            insert commands[ ind_2 ] into temp_table index 1.
            ind_2 = ind_2 + 1.
        endwhile.
        commands = temp_table.
    endif.

  ENDMETHOD.

ENDCLASS.

