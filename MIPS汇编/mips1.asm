.data
error_message: .asciiz "Illegal Input\n" # �Ƿ�����
volume_message: .asciiz "Volume: "        # �����
surface_area_message: .asciiz "Surface Area: " # �������

.text
.globl main
main:
    # ��ʼ����ֵ
    li $v0, 0                # $v0 = 0����ʼ��$v0�������룩
    
    # ���볤��
    li $v0, 5                # ��ȡ������$a0
    syscall
    move $a1, $v0

input_width:
    # ������
    li $v0, 5                # ��ȡ������$a1
    syscall
    move $a2, $v0

input_height:
    # ����߶�
    li $v0, 5                # ��ȡ������$a2
    syscall
    move $a3, $v0

calculate:
    bltz $a1, illegal
    bltz $a2, illegal
    bltz $a3, illegal
    
    # ��������ͱ����
    mul $t0, $a1, $a2        # $t0 = �� * ��
    mul $t1, $t0, $a3        # $t1 = (�� * ��) * ��

    # ��� = �� * �� * ��
    move $a0, $t1
    li $v0, 1                # ��ӡ���
    syscall
    
    # ��ӡ�����ַ�
    li $v0, 11
    li $a0, 10               # �����ַ���ASCII��ֵ
    syscall

    # ����� = 2 * (�� * �� + �� * �� + �� * ��)
    li $t2, 2
    mul $t3, $a1, $a2        # $t3 = �� * ��
    mul $t4, $a2, $a3        # $t4 = �� * ��
    mul $t5, $a3, $a1        # $t5 = �� * ��
    add $t6, $t3, $t4        # $t6 = �� * �� + �� * ��
    add $t7, $t6, $t5        # $t7 = �� * �� + �� * �� + �� * ��
    mul $t8, $t7, $t2        # $t8 = 2 * (�� * �� + �� * �� + �� * ��)

    # ��ӡ�����
    move $a0, $t8
    li $v0, 1
    syscall
    j exit
    
illegal:
    la $a0, error_message    # ��ӡ"�Ƿ�����"���˳�
    li $v0, 4
    syscall
    j main

exit:
    li $v0, 10               # �˳�����
    syscall
