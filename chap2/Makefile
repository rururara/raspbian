# 使用方法　
# $ make (file_name).img
# 上記を打ち込み,カレントディレクトリに.elf.img.oが作成されていれば成功
# 作ったファイルは
# $ make clean
# で削除できる

# 定義
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
LDFLAGS = -m armelf -no-undefined
OBJCOPY = arm-none-eabi-objcopy
OBJ1 = 23.o
OBJ2 = uzu.o
OBJ3 = smp.o
OBJ4 = count.o disp.o
OBJ5 = test.o disp.o

# 生成規則
.PHONY: all clean
all: 23.img uzu.img smp.img count.img test.img

23.img: $(OBJ1)
	$(LD) $(LDFLAGS) $+ -o 23.elf
	$(OBJCOPY) $+ -O binary $@

uzu.img: $(OBJ2)
	$(LD) $(LDFLAGS) $+ -o uzu.elf
	$(OBJCOPY) $+ -O binary $@

smp.img: $(OBJ3)
	$(LD) $(LDFLAGS) $+ -o smp.elf
	$(OBJCOPY) $+ -O binary $@

count.img: $(OBJ4)
	$(LD) $(LDFLAGS) $+ -o count.elf
	$(OBJCOPY) count.elf -O binary $@


test.img: $(OBJ5)
	$(LD) $(LDFLAGS) $+ -o test.elf
	$(OBJCOPY) test.elf -O binary $@
# カレントディレクトリの掃除
clean:
	rm -f *.o *~ *.elf *.img