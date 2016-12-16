; File to boot the kernal

; Exports a label (global = public). Because `start` will be
; the entry point of the kernel, it needs to be public
global start

; .text = The default section for executable code
section .text

; Specifies that the following lines are 32-bit instructions.
; Its needed because the CPU is still in protected mode when
; GRUB starts the kernel. Long mode = 64 bit instructions
bits 32

start:

  ; print `OK` to screen
  ; Moves the 32 bit constant `0x2f4b2f4f` to the memory at
  ; address `b8000`
  mov dword [0xb8000], 0x2f4b2f4f

  ; The halt instruction and causes the CPU to stop
  hlt
