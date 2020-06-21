PORTA = $6001
PORTB = $6000
DDRA = $6003    ; Data direction register
DDRB = $6002

E   = %10000000 ; Write data/Send instruction
RW  = %01000000 ; 
RS  = %00100000

  .org $8000

reset:
  lda #%11111111    ; Set all pins on port B to output
  sta DDRB

  lda #%11100000    ; Set top 3 pins on port A to output
  sta DDRA

  lda #%00111000   ; Set 8-bit mode; 2-line display; 5x8 font
  jsr initialize_LCD
  
  lda #%00001110   ; Display on; Cursor on; Blink off
  jsr initialize_LCD

  lda #%00000110   ; Increment and shift cursor; don't shift display
  jsr initialize_LCD

  lda #"H"   
  jsr send_LCD
  lda #"E"   
  jsr send_LCD
  lda #"L"   
  jsr send_LCD
  lda #"L"   
  jsr send_LCD
  lda #"O"   
  jsr send_LCD
  lda #" "   
  jsr send_LCD
  lda #"C"   
  jsr send_LCD
  lda #"H"   
  jsr send_LCD
  lda #"R"   
  jsr send_LCD
  lda #"I"   
  jsr send_LCD
  lda #"S"   
  jsr send_LCD
  jmp loop

send_LCD:
  sta PORTB
  lda #RS              
  sta PORTA
  lda #(RS |E)  ; Set E bit to send instruction
  sta PORTA
  lda #RS       ; Clear RS/RW/E bits
  sta PORTA
  rts

initialize_LCD:
  sta PORTB
  lda #0            ;  Clear RS/RW/E bits
  sta PORTA
  lda #E            ; Set E bit to send instruction
  sta PORTA
  lda #0            ;  Clear RS/RW/E bits
  sta PORTA
  rts

loop:
  jmp loop

  .org $fffc
  .word reset
  .word $0000