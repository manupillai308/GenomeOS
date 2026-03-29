.section .fsimg, "a"
.global fs_start
.global fs_end

fs_start:
    .incbin "os.img"
fs_end:
