.data
N:     .word 1000010      # ����NΪ1000010
n:     .word 0            # ��ʼ��nΪ0
a:     .space 4040     # Ϊa����4040�ֽ��ڴ棬���ڴ洢N��32λ����

.text
.globl main

main:
    # ��ȡn��ֵ
    li $v0, 5            # ��ȡ������ϵͳ���ô���
    la $a0, n            # �洢n�ĵ�ַ
    syscall
    move $t1, $v0            # $t1 = n

    # ��ȡa�����ֵ
    la $a1, 0            # �洢a�ĵ�ַ
    li $t0, 0            # $t0 = 0 (ѭ��������)

read_loop:
    beq $t0, $t1, check_result  # ���ѭ���������ﵽn����ת�������
    li $v0, 5            # ��ȡ������ϵͳ���ô���
    syscall
    sw $v0, a($a1)       # �洢��ȡ��������a����
    addi $a1, $a1, 4     # �ƶ���a�������һ��λ��
    addi $t0, $t0, 1     # ѭ����������1
    j read_loop

check_result:
    li $t0, 0            # ����ѭ��������
    li $t2, 0            # $t2 = 0 (����i)
    
check_loop:
    bge $t2, $t1, print_result  # ���i >= n����ת����ӡ���
    
    sll $t4, $t2, 2
    lw $t3, a($t4)       # $t3 = a[i]
    add $t5, $t2	, $t3    # $t4 = i + a[i]
    bge $t5, $t1, set_n_and_reset_i  # ���i + a[i] >= n����ת������n������i

    addi $t2, $t2, 1     # i++
    j check_loop

set_n_and_reset_i:
    move $t1, $t2        # n = i
    li $t2, -1            # ����iΪ0
    j check_loop

print_result:
    beqz $t1, true_result   # ���nΪ0����ת��true_result
    li $v0, 4              # ��ӡ�ַ�����ϵͳ���ô���
    la $a0, false_str      # ����false_str�ĵ�ַ
    syscall
    j exit

true_result:
    li $v0, 4              # ��ӡ�ַ�����ϵͳ���ô���
    la $a0, true_str       # ����true_str�ĵ�ַ
    syscall

exit:
    li $v0, 10             # �˳������ϵͳ���ô���
    syscall

.data
true_str:   .asciiz "true\n"   # �ַ��� "true\n"
false_str:  .asciiz "false\n"  # �ַ��� "false\n"
