.data
	menu: .asciiz "\n===== MENU =====\n1. Nhap mang\n2. Xuat mang\n3. Liet ke cac so nguyen to\n4. Liet ke cac so hoan thien\n5. Dem so luong so chinh phuong\n6. Tinh tong cac so doi xung\n7. Tim gia tri lon nhat\n8. Sap xep mang tang dan\n9. Thoat \n=====================\nChon: "
	nhapn: .asciiz "Nhap so luong phan tu: "
	tb1:.asciiz "a["
	tb2: .asciiz "] = "
	xuat: .asciiz "Mang: "
	xuatcacsonguyento: .asciiz "Cac so nguyen to la: "
	xuatcacsohoanthien: .asciiz "Cac so hoan thien la: "
	xuatcacsochinhphuong: .asciiz "So so chinh phuong la: "
	xuatsodoixung: .asciiz "Tong cac so doi xung la: "
	findmaxnumber: .asciiz "So lon nhat trong mang la: "
	no: .asciiz "Khong co"
	choose: .word 0
	n: .word 0
	array: .space 400
.text
	.globl main
	li	$s7, 0 #size mang
	j 	nhap
main:
	#xuat menu
	li 	$v0, 4
	la 	$a0, menu
	syscall
	
	#Nhap lua chon
	li 	$v0, 5
	syscall
	sw 	$v0,choose
	lw 	$s2, choose
	
	
	
	beq 	$s2, 1, nhap
	beq 	$s7, 0, main
	beq 	$s2, 2, _xuat
	beq 	$s2, 3, nguyento
	beq 	$s2, 4, hoanthien
	beq 	$s2, 5, chinhphuong
	beq 	$s2, 6, doixung
	beq 	$s2, 7, max
	beq 	$s2, 8, sort
	beq 	$s2, 9, EXIT
	j 	EXIT

nhap:
	#xuat thong bao
	li 	$v0, 4
	la 	$a0, nhapn
	syscall

	#nhap n
	li 	$v0, 5
	syscall

	sw 	$v0,n
	
	#load n vao $s0
	lw 	$s0, n
	addi	$s7,$s0,0
	# $s1 la dia chi mang
	la 	$s1, array
	#int i = 0
	li 	$t0, 0

	jal 	LapNhap
	jr 	$ra
_xuat:
	# $s1 la dia chi mang
	la 	$s1, array
	#int i = 0
	li 	$t0, 0

	li 	$v0, 4
	la 	$a0, xuat
	syscall

	jal 	LapXuat
	jr 	$ra
	
	
LapNhap:
	#xuat 'a[i]'
	li 	$v0, 4
	la 	$a0, tb1
	syscall
	
	li 	$v0, 1
	move 	$a0, $t0
	syscall

	li 	$v0, 4
	la 	$a0, tb2
	syscall

	#nhap a[i]
	li 	$v0, 5
	syscall

	#Luu a[i]
	sw 	$v0,($s1)

	#tang dia chi
	addi 	$s1,$s1,4
	
	#tang i
	addi 	$t0,$t0,1
	
	#i < n
	blt 	$t0, $s0, LapNhap
	jal 	main
LapXuat:
	#xuat a[i]
	li 	$v0, 1
	lw 	$a0, ($s1)
	syscall

	li 	$v0, 11
	la 	$a0, ' '
	syscall

	#tang dia chi
	addi 	$s1,$s1,4
	
	#tang i
	addi 	$t0,$t0,1
	
	#i < n
	blt	$t0, $s0, LapXuat
	jal 	main
nguyento:
	# $s1 la dia chi mang
	la 	$s1, array
	#int i = 0
	li 	$t0, 0

	li 	$v0, 4
	la 	$a0, xuatcacsonguyento
	syscall
	li 	$s6,0
	SoNguyenTo:
		lw 	$t1, ($s1)
		beq	$t1, 2, XuatSoNguyenTo
		beq	$t1, 1, TangDiaChiSoNguyenTo
		add	$t2, $zero, 2
		LoopPrime:
			div 	$t1, $t2
			mfhi 	$t3
			beq 	$t3, 0, TangDiaChiSoNguyenTo
			add	$t2, $t2, 1
			bne 	$t2, $t1, LoopPrime
	XuatSoNguyenTo:
		li 	$v0, 1
		move 	$a0, $t1
		syscall
		
		addi	$s6,$s6,1

		li 	$v0, 11
		la 	$a0, ' '
		syscall
	TangDiaChiSoNguyenTo:
		#tang dia chi
		addi 	$s1,$s1,4
	
		#tang i
		addi 	$t0,$t0,1
	
		#i < n
		blt	$t0, $s0, SoNguyenTo
	beq	$s6, 0, khongco
	jal 	main
hoanthien:
	# $s1 la dia chi mang
	la 	$s1, array
	#int i = 0
	li 	$t0, 0

	li 	$v0, 4
	la 	$a0, xuatcacsohoanthien
	syscall
	li 	$s6,0
	SoHoanThien:
		lw 	$t1, ($s1)
		li	$s4, 1
		li	$s3, 0
		LoopPerfect:
			beq	$s4, $t1, XuatSoHoanThien
			div 	$t1, $s4
			mfhi 	$t3
			bne 	$t3, 0, tangi
			add	$s3,$s3,$s4
	tangi:
		addi	$s4,$s4,1
		j LoopPerfect
	XuatSoHoanThien:
		beq 	$t1,$s3,xuathoanthien
		j	TangDiaChiSoHoanThien
		xuathoanthien:
			li 	$v0, 1
			move 	$a0, $t1
			syscall
			
			addi	$s6,$s6,1

			li 	$v0, 11
			la 	$a0, ' '
			syscall
	TangDiaChiSoHoanThien:
		#tang dia chi
		addi 	$s1,$s1,4
	
		#tang i
		addi 	$t0,$t0,1
	
		#i < n
		blt	$t0, $s0, SoHoanThien
	beq	$s6, 0, khongco
	jal 	main
chinhphuong:
	# $s1 la dia chi mang
	la 	$s1, array
	#int i = 0
	li 	$t0, 0

	li 	$v0, 4
	la 	$a0, xuatcacsochinhphuong
	syscall
	li	$s3, 0
	SoChinhPhuong:
		lw 	$t1, ($s1)
		addi	$t2, $zero, 0
		LoopSquare:
			mult	$t2, $t2
			mflo	$t3
			beq	$t3, $t1, DemSoChinhPhuong
			addi	$t2, $t2, 1
			blt 	$t3, $t1, LoopSquare
			j 	TangDiaChiSoChinhPhuong
	DemSoChinhPhuong:
		addi	$s3,$s3,1
	TangDiaChiSoChinhPhuong:
		#tang dia chi
		addi 	$s1,$s1,4
	
		#tang i
		addi 	$t0,$t0,1
	
		#i < n
		blt	$t0, $s0, SoChinhPhuong

		li 	$v0, 1
		move 	$a0, $s3
		syscall
	jal 	main
doixung:
	# $s1 la dia chi mang
	la 	$s1, array
	#int i = 0
	li 	$t0, 0

	li 	$v0, 4
	la 	$a0, xuatsodoixung
	syscall
	li	$s4, 0
	li	$t5, 10
	SoDoiXung:
		lw 	$t1, ($s1)
		addi	$t2, $t1, 0
		li	$s3, 0
		LoopDoiXung:
			div	$t2, $t5
			mflo	$t3 #phan nguyen
			mfhi	$t4 #phan du
			
			#s3 = s3 * 10 + t4
			mult	$s3, $t5
			mflo	$s3
			add	$s3,$s3,$t4
			beq	$t3,0,sosanhdoixung
			#cap nhat t2
			addi	$t2,$t3,0
			j	LoopDoiXung
	sosanhdoixung:
		bne	$t1, $s3, TangDiaChiSoDoiXung
		add	$s4,$s4,$t1
	TangDiaChiSoDoiXung:
		#tang dia chi
		addi 	$s1,$s1,4
	
		#tang i
		addi 	$t0,$t0,1
	
		#i < n
		blt	$t0, $s0, SoDoiXung

		li 	$v0, 1
		move 	$a0, $s4
		syscall

	jal 	main
max:
	# $s1 la dia chi mang
	la 	$s1, array
	#int i = 0
	li 	$t0, 0

	li 	$v0, 4
	la 	$a0, findmaxnumber
	syscall
	li	$s4, -100
	FindMax:
		lw 	$t1, ($s1)
		slt	$t2, $s4, $t1
		bne	$t2,1,TangDiaChimMax
		add	$s4, $t1, 0
	TangDiaChimMax:
		#tang dia chi
		addi 	$s1,$s1,4
	
		#tang i
		addi 	$t0,$t0,1
	
		#i < n
		blt	$t0, $s0, FindMax

		li 	$v0, 1
		move 	$a0, $s4
		syscall

	jal 	main
sort:
	# $s1 la dia chi mang
	la 	$s1, array
	#int i = 0
	li 	$t0, 0
	
	sub	$s5,$s0,1
	li	$t0, 0 # int i = 0
	li	$t1, 1 #int j = i
	li	$s3, 4
	Sort:
		la 	$s2, array
		#tang dia chi
		mult	$s3, $t1
		mflo	$t2
		add 	$s2,$s2,$t2
	
		lw	$t3, ($s1)
		LoopSort:
			lw	$t4, ($s2)
			slt	$t5, $t4, $t3
			beq	$t5, 0, TangDiaSort2
		swap:
			sw	$t3, ($s2)
			sw	$t4, ($s1)
	TangDiaSort2:
		#tang dia chi
		addi 	$s2,$s2,4
	
		#tang j
		addi 	$t1,$t1,1
	
		#j < n
		blt	$t1, $s0, Sort
	TangDiaSort1:
		#tang dia chi
		addi 	$s1,$s1,4
	
		#tang i
		addi 	$t0,$t0,1
		addi	$t1,$t0,1
		#i < n
		blt	$t0, $s5, Sort
		

		# $s1 la dia chi mang
		la 	$s1, array
		#int i = 0
		li 	$t0, 0

		li 	$v0, 4
		la 	$a0, xuat
		syscall

		jal 	LapXuat
khongco:
	li 	$v0, 4
	la 	$a0, no
	syscall
	jal main
EXIT:
	li 	$v0,10
	syscall
