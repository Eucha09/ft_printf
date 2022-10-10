# ft_printf

printf 함수를 직접 구현

## Mandatory part

기존 printf를 재구현.   
프로토타입 : int ft_printf(const char *, ...);   
기본 서식 지정자 구현 : cspdiuxX%   
makefile을 통해 ft_printf함수가 포함된 라이브러리 생성

**구현한 서식 지정자**
- %c : 단일 문자 (character) 한 개를 출력
- %s : 문자열 (string) 을 출력
- %p : void * 형식의 포인터 인자를 16진수로 출력
- %d : 10진수 정수를 출력
- %i : 10진수 정수를 출력(%d와 동일)
- %u : 부호 없는 10진수 정수를 출력
- %x : 소문자를 사용하여 정수를 16진수로 출력
- %X : 대문자를 사용하여 정수를 16진수로 출력
- %% : 퍼센트 기호 (%) 를 출력

<details>
<summary>files</summary>
<div markdown="1">       

- Libft/*
- srcs/
	- ft_printf.c
	- ft_put_data.c
	- ft_put_char_format.c
	- ft_put_hex_format.c
	- ft_put_int_format.c
	- ft_put_pointer_format.c
	- ft_put_str_format.c
	- ft_put_uint_format.c
	- ft_put_utils.c
	- ft_utils1.c
	- ft_utils2.c
- includes/
	- ft_printf.h
- Makefile

</div>
</details>

## Bonus part

서식 지정자에서 다양한 플래그들과 옵션(너비, 정밀도)들 구현.   
아래 형식 태그에 맞게 다양하게 서식 지정자 조합 가능.

**형식 태그**
```
%[플래그(flag)][폭(width)][.정밀도(precision)]서식지정자
```

**구현한 플래그(flag)**
- \- : 왼쪽 정렬 (기본값은 오른쪽 정렬이다)
- \+ : 양수일 때는 + 부호, 음수일때는 - 부호 출력
- (공백) : 양수일 때는 앞에 공백 출력, 음수일때는 - 부호 출력
- \# : 진법에 맞게 숫자 앞에 0, 0x, 0X룰 출력
- 0 : 출력하는 폭의 남는 공간을 0으로 채워넣는다.

<details>
<summary>files</summary>
<div markdown="1">       

- Libft/*
- srcs_bonus/
	- ft_printf_bonus.c
	- ft_put_data_bonus.c
	- ft_put_char_format_bonus.c
	- ft_put_hex_format_bonus.c
	- ft_put_int_format_bonus.c
	- ft_put_pointer_format_bonus.c
	- ft_put_str_format_bonus.c
	- ft_put_uint_format_bonus.c
	- ft_put_utils_bonus.c
	- ft_utils1_bonus.c
	- ft_utils2_bonus.c
- includes/
	- ft_printf_bonus.h
- Makefile

</div>
</details>

## Example of execution

기존 printf 함수와 사용법 동일.

```c
#include <stdio.h>
#include "ft_printf_bonus.h"

int main()
{
	printf("%4d\n", 144);	//%d의 출력 넓이를 4로 지정, 남는 공간을 공백으로 채움
	ft_printf("%4d\n", 144);
	printf("%5d\n", 144);	//%d의 출력 넓이를 5로 지정, 남는 공간을 공백으로 채움
	ft_printf("%5d\n", 144);
	printf("\n");
	
	printf("%04d\n", 144);	//%d의 출력 넓이를 4로 지정, 남는 공간에 공백이 아닌 0으로 채움
	ft_printf("%04d\n", 144);
	printf("%05d\n", 144);	//%d의 출력 넓이를 5로 지정, 남는 공간에 공백이 아닌 0으로 채움
	ft_printf("%05d\n", 144);
	printf("\n");

	printf("% d\n", 144);	//양수일 때는 부호를 표시하지 않고 공백으로 표시
	ft_printf("% d\n", 144);
	printf("% d\n", -144);	//음수일 때는 부호를 표시
	ft_printf("% d\n", -144);
	printf("\n");

	printf("%+d\n", 144);	//양수일 때는 +부호를 표시
	ft_printf("%+d\n", 144);
	printf("%+d\n", -144);	//음수일 때는 -부호를 표시
	ft_printf("%+d\n", -144);
	printf("\n");

	printf("%#x\n", 15);	//16진수 소문자 출력, 앞에 0x를 표시함
	ft_printf("%#x\n", 15);
	printf("%#X\n", 0xa1);	//16진수 대문자 출력, 앞에 0X를 표시함
	ft_printf("%#X\n", 0xa1);
	printf("\n");

	printf("%5c\n", 'S');	//출력 넓이를 5로 지정, 남는 공간을 공백으로 채움
	ft_printf("%5c\n", 'S');
	printf("%5s\n", "Test");	//출력 넓이를 5로 지정, 남는 공간을 공백으로 채움
	ft_printf("%5s\n", "Test");

	return 0;
}
```
**실행 결과**
```
 144
 144
  144
  144

0144
0144
00144
00144

 144
 144
-144
-144

+144
+144
-144
-144

0xf
0xf
0XA1
0XA1

    S
    S
 Test
 Test
```