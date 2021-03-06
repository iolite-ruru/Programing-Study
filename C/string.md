# string
C++ STL에서 지원하는 문자열 클래스. <strong>#include'string'</strong>을 통해서 사용할 수 있다.<br>
C에서의 문자열과 C++에서의 문자열의 차이에 집중하며 공부하자. <b>string</b>과 <b>char*</b>, <b>char[]</b> 의 차이에 주의해야한다.<br>
```cpp
#include <string>

void main(){
  string str1 = "문자열 1";
  string str2("문자열 2");
  string str3(str1);
}
```
<br>

## string 클래스의 멤버 함수

### 기본
* <strong>str.length()</strong>: 문자열의 길이 반환 
* <strong>str.size()</strong>: 문자열의 사이즈 반환
* <strong>str.capacity()</strong>: 문자열의 메모리 사이즈 반환
* <strong>str.at(index)</strong>: index 위치에 있는 문자 반환. index 값이 옳지 않다면 예외 발생
* <strong>str.operator(index)</strong>: at()에 비해서 속도가 빠르지만, 예외를 발생시키지 않음
* <strong>str.front()</strong>: 맨 앞의 값 반환
* <strong>str.back()</strong>: 맨 뒤의 값 반환
* <strong>str.begin()</strong>: 문자열 시작 인덱스 참조 (반복자)
* <strong>str.end()</strong>: 문자열의 마지막 인덱스+1 참조 (반복자)
* <strong>str.compare(param)</strong>: 자기자신과 매개변수를 비교해서 같으면 0을 반환. 문자열이 같지 않다면, 아스키코드를 기준으로 1, -1을 반환
* <strong>str.substr(index, cnt)</strong>: index부터 cnt개를 반환
* <strong>str.find(sub, index)</strong>: index부터 sub를 찾은 후 위치하는 인덱스 반환. 찾는 값이 없다면 string::npos를 반환
<br>

### 추가, 삭제
* <strong>str.append(sub)</strong>: 맨 뒤에 sub를 추가함
* <strong>str.append(index, sub)</strong>: index의 앞에 sub를 추가함
* <strong>str.replace(start, end, sub)</strong>: start ~ end-1을 sub로 대체함
* <strong>str.erase(start, end)</strong>: start ~ end-1의 문자열을 삭제함
* <strong>str.clear()</strong>: 문자열을 모두 비움. 이 때, capacity는 변하지 않음
* <strong>str.empty()</strong>: 문자열이 비었는지 확인 후 bool값을 반환
<br>

### 변형
* <strong>str.to_string(param)</strong>: 숫자형인 param을 string 형태로 반환
* <strong>str.substr(start, end, sub)</strong>: start ~ end-1의 까지를 sub로 대체함

