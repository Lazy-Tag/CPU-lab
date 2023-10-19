# MIPS������ʹ�õ��Ʒ�ʽ����쳲���������
.data
input_prompt:   .asciiz "Input an positive integer: "
output_prompt:  .asciiz "F(n): "

.text
.globl main

main:
    # ��ʾ�û�����
    li $v0, 4
    la $a0, input_prompt
    syscall

    # ���û���ȡ����n
    li $v0, 5
    syscall
    move $t0, $v0  # ��n�洢��$t0�Ĵ�����

    # ���������� (n = 0 �� n = 1)
    li $t1, 1       # ��ʼ�� F(0)
    li $t2, 1       # ��ʼ�� F(1)

    beqz $t0, result  # ��� n = 0����� F(0) = 1 ���˳�
    beq $t0, $t2, result  # ��� n = 1����� F(1) = 1 ���˳�

    # ʹ��ѭ������쳲�������
    li $t3, 1       # ��ʼ��ѭ��������

fib_loop:
    # ���� F(n) = F(n-1) + F(n-2)
    add $t3, $t3, 1  # ����ѭ��������
    add $t4, $t1, $t2  # ���� F(n-1) + F(n-2)
    move $t1, $t2  # ���� F(n-2)
    move $t2, $t4  # ���� F(n-1)

    # ����Ƿ�ﵽ n
    beq $t3, $t0, result

    # ����ѭ��
    j fib_loop

result:
    # ������
    li $v0, 4
    la $a0, output_prompt
    syscall

    li $v0, 1
    move $a0, $t2  # �� F(n) ���ص� $a0
    syscall

    # �˳�����
    li $v0, 10
    syscall
