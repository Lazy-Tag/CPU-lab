.data
D:     .space 4000        # ���ڴ洢D������ڴ�ռ�
a: 2
b: 3

.text
.globl main

main:
    # ��ȡa��b��ֵ
    lw $s0, a           # ��a��ֵ���ص�$s0
    lw $s1, b           # ��b��ֵ���ص�$s1
    
    # ��ʼ��i��j
    li $t0, 0           # i = 0
    li $t1, 0           # j = 0

outer_loop:
    # ���ѭ���������� i < a
    bge $t0, $s0, exit   # ���i >= a���˳�ѭ��
    
    # ����jΪ0
    li $t1, 0           # j = 0
    
inner_loop:
    # ���ѭ���������� j < b
    bge $t1, $s1, inner_loop_end  # ���j >= b�������ڲ�ѭ��
    
    # ���� D[4 * j] = i + j
    add $t2, $t0, $t1    # $t2 = i + j
    sll $t3, $t1, 2      # $t3 = 4 * j
    add $t3, $s2, $t3    # $t3 = &D[4 * j]
    sw $t2, 0($t3)       # D[4 * j] = i + j
    
    # ����j
    addi $t1, $t1, 1     # j++
    j inner_loop
    
inner_loop_end:
    # ����i
    addi $t0, $t0, 1     # i++
    j outer_loop

exit:
    # �����˳�
    li $v0, 10
    syscall
