PORTA = $6001
PORTB = $6000
DDRA = $6003    ; Data direction register
DDRB = $6002

E   = %10000000
RW  = %01000000
RS  = %00100000

  .org $8000

reset:
  lda #%11111111    ; Set all pins on port B to output
  sta DDRB

  lda #%11100000    ; Set top 3 pins on port A to output
  sta DDRA

  lda #%00111000   ; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB

  lda #0            ;  Clear RS/RW/E bits
  sta PORTA

  lda #E            ; Set E bit to send instruction
  sta PORTA

  lda #0            ;  Clear RS/RW/E bits
  sta PORTA
  
  lda #%00001110   ; Display on; Cursor on; Blink off
  sta PORTB

  lda #0            ;  Clear RS/RW/E bits
  sta PORTA

  lda #E            ; Set E bit to send instruction
  sta PORTA

  lda #0            ;  Clear RS/RW/E bits
  sta PORTA

  lda #%00000110   ; Increment and shift cursor; don't shift display
  sta PORTB

  lda #0            ;  Clear RS/RW/E bits
  sta PORTA

  lda #E            ; Set E bit to send instruction
  sta PORTA

  lda #0            ;  Clear RS/RW/E bits
  sta PORTA

  lda #"H"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA

  lda #"E"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #"L"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #"L"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #"O"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #" "   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #"C"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #"H"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #"R"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #"I"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA
  lda #"S"   
  sta PORTB
  lda #RS            ;  
  sta PORTA
  lda #(RS |E)            ; Set E bit to send instruction
  sta PORTA
  lda #RS            ;  Clear RS/RW/E bits
  sta PORTA

loop:
  jmp loop

  .org $fffc
  .word reset
  .word $0000