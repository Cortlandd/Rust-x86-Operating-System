; Note: Using intel x86 assembly
; Header will be written to a section named .multiboot_header
section .multiboot_header

; label(s) that mark a memory location.
; Used to calculate header length more easily
header_start:

  ; dd = `define double` (32 bit)
  ; Outputs the specified 32 bit constant
  dd 0xe85250d6                ; magic number (multiboot 2)
  dd 0                         ; architecture 0 (protected mode i386)
  dd header_end - header_start ; header length

  ; checksum
  ; A simple hack to avoid a compiler warning
  dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

  ; Optional multiboot tags here

  ; required end tag
  ; dw = `define word` (16 bit)
  ; Outputs the specified 16 bit constant
  dw 0  ; type
  dw 0  ; flags
  dd 8  ; size

; label(s) that mark a memory location.
; Used to calculate header length more easily
header_end:
