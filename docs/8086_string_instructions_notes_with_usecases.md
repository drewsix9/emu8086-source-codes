# 8086 String Instructions – Quick Notes

## Mental Model
- `LODSB/LODSW`: Load from `DS:SI` → `AL/AX`, then `SI += 1/2` if `DF=0` (`CLD`), or decrements if `DF=1` (`STD`).
- `STOSB/STOSW`: Store `AL/AX` → `ES:DI`, then advance `DI`.
- `MOVSB/MOVSW`: Copy from `DS:SI` → `ES:DI`, then advance both.
- `SCASB/SCASW`: Compare `AL/AX` with `ES:DI` memory, set flags, advance `DI`.
- `CMPSB/CMPSW`: Compare `DS:SI` vs `ES:DI`, set flags, advance both.
- `REP/REPE/REPNE`: Repeat while `CX != 0` (and for `E/NE`, also while ZF condition holds/fails).
- Always set direction flag:
  - `CLD` → forward (increment SI/DI)
  - `STD` → backward (decrement SI/DI)

---

## Common Use Cases

### `LODSB/LODSW`
- Iterate through an array, one byte/word at a time.
- Sum all elements in an array.
- Load input strings/arrays for processing.

### `STOSB/STOSW`
- Initialize memory (e.g., fill with zeros or a specific value).
- Write characters/words into an output buffer.
- Implement `memset`‑like functionality.

### `MOVSB/MOVSW`
- Copy one array/buffer into another.
- Implement `memcpy` or string copy.
- Shift data blocks in memory.

### `SCASB/SCASW`
- Search for a character/word in a buffer.
- Implement `strchr` or `memchr`.
- Detect terminators (like 0 in C strings).

### `CMPSB/CMPSW`
- Compare two strings or arrays.
- Implement `strcmp` or `memcmp`.
- Detect mismatches between two data blocks.

### `REP/REPE/REPNE`
- Combine with the above string instructions for efficiency:
  - `REP MOVSB`: fast buffer copy.
  - `REP STOSB`: fast buffer initialization.
  - `REPNE SCASB`: find character in string.
  - `REPE CMPSB`: compare until mismatch.

---

## Examples

### 1. Sum an Array of Words
```asm
org 100h
arr dw 5,4,3,2,1

start:
    cld
    lea si, arr
    mov cx, 5
    xor dx, dx          ; DX = sum
.sum_loop:
    lodsw               ; AX = [SI], SI += 2
    add dx, ax
    loop .sum_loop

    mov ah, 4Ch
    int 21h
```

---

### 2. Copy N Bytes (`REP MOVSB`)
```asm
org 100h
src db 'HELLO',0
dst db 6 dup(?)

start:
    cld
    lea si, src
    lea di, dst
    mov cx, 6
    rep movsb

    mov ah, 4Ch
    int 21h
```

---

### 3. Fill Memory with Zero (`REP STOSB`)
```asm
org 100h
buf db 32 dup(?)

start:
    cld
    lea di, buf
    mov cx, 32
    xor ax, ax          ; AL = 0
    rep stosb

    mov ah, 4Ch
    int 21h
```

---

### 4. Find a Byte in a Buffer (`SCASB`)
```asm
org 100h
hay db 'A','B','C','D','E'
target db 'C'

start:
    cld
    mov ax, ds
    mov es, ax
    lea di, hay
    mov cx, 5
    mov al, [target]
    repne scasb

    ; Found: ZF=1, DI = just past match
    ; Not found: ZF=0, CX=0

    mov ah, 4Ch
    int 21h
```

---

### 5. String Length (`strlen`) with `SCASB`
```asm
org 100h
s db 'hello',0

start:
    cld
    mov ax, ds
    mov es, ax
    lea di, s
    mov cx, 0FFFFh
    xor al, al
    repne scasb

    ; Length = DI - offset s - 1
    mov ax, di
    sub ax, offset s
    dec ax

    mov ah, 4Ch
    int 21h
```

---

### 6. Max of Array of Words (`LODSW + CMP`)
```asm
org 100h
arr dw 12,7,99,5,42

start:
    cld
    lea si, arr
    mov cx, 5
    lodsw
    mov dx, ax          ; DX = current max
    dec cx
.next:
    lodsw
    cmp ax, dx
    jbe .skip
    mov dx, ax
.skip:
    loop .next

    ; DX = max
    mov ah, 4Ch
    int 21h
```

---

## Common Pitfalls
- ❌ Using `AX` in memory addressing (`[si+2*ax]`) → not allowed.
- ❌ Forgetting `CLD`/`STD` → wrong direction of index movement.
- ⚠️ `SCASx` reads from `ES:DI`, not `DS:DI` → ensure `ES = DS`.
- ⚠️ `REP` stops only when `CX == 0` (and ZF condition if `REPE/REPNE`).  
  If it breaks early, `CX` ≠ 0 → tells you where it stopped.
