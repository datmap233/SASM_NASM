.data
	tb1: .asciiz "Nhap a: "
	tb2: .asciiz "Nhap b: "
	tb3: .asciiz "Tong la: "
	tb4: .asciiz "Hieu la: "
	tb5: .asciiz "Tich la: "
	tb6: .asciiz "Thuong la: "
	
.text
	#Xuat tb1
	li $v0,4
	la $a0,tb1
	syscall

	#Nhap a luu vao s0
	li $v0,5
	syscall

	#Gan $s0 = $v0
	move $s0,$v0 


	#Xuat tb2
	li $v0,4
	la $a0,tb2
	syscall

	#Nhap b luu vao s1
	li $v0,5
	syscall

	#Gan $s1 = $v0
	move $s1,$v0 

	#Tinh tong luu vao $s2
	add $s2,$s0,$s1 #s2 = s0 + s1
	
	#Xuat tb3
	li $v0,4
	la $a0,tb3
	syscall
	
	#xuat s2
	li $v0,1
	move $a0,$s2
	syscall

	
	
	
	