# atoi 함수
C 'stdlib.h'에서 지원하는 문자 변환 함수이다.
* <strong>atoi</strong>: Ascii TO Integer라는 뜻으로, 문자를 정수로 변환 후 반환한다. 변환할 수 없다면 0을 반환한다.<br>
* <strong>atol</strong>: Ascii TO Long라는 뜻으로, 문자를 큰 정수로 변환 후 반환한다. 변환할 수 없다면 0을 반환한다.<br>
* <strong>atof</strong>: Ascii TO Float라는 뜻으로, 문자를 실수로 변환 후 반환한다. 변환할 수 없다면 0을 반환한다.<br>
<br>
사용 방법은 다음과 같다.
<br>

```cpp
char[] str1 = "123";
cout << atoi(str1) << endl; //123

char* str2 = "123.456";
cout << atof(str2) << endl; //123.456

char[] str3 = "string";
cout << atoi(str3) << endl; //0 (변환 불가)

char* str4 = "string1234"
cout << atoi(str4) << endl; //0 (변환 불가)

string str5 = "4321";
cout << atoi(str2) << endl; //error!
```
## string에서의 사용
위 코드를 보면 알 수 잇듯이 문자열이 char*, char[]인 경우에만 사용할 수 있기 때문에 string에서는 문제가 생긴다. 그 때 필요한 것이 <strong>stoi</strong>이다.<br>
* <strong>stoi</strong>: String TO Integer<br>
* <strong>stol</strong>: String TO Long<br>
* <strong>stod</strong>: String TO Double<br>
