# 달팽이 배열
n x n 크기의 2차원 배열에 1부터 n²까지의 수를 시계 방향으로 담는 것이다. 달팽이의 껍질처럼 생겨 달팽이 배열이라고 부른다. <br>
물론 행과 열의 크기가 다른 경우도 존재한다. <br>

## Code with C
```c
int row = 0, col = -1, num = 1;
int forward = N; //몇 칸 전진할 것인지
int sign = 1; //1 또는 -1을 가짐
int arr[N][N];

while(forward != 0){
  for(int i=0; i<forward; i++){
    col += sign;
    arr[row][col] = num++;
  }
			
  forward--;
  if(forward == 0) break;
  
  for(int i=0; i<forward; i++){
    row += sign;
    arr[row][col] = num++;
  }
  sign *= -1; //부호를 바꿈
}
```

```c
for(int i=1; i<=rows; i++){
  for(int j=1; j<=columns; j++){
    vec[i-1][j-1] = (i-1) * columns + j; //****
  }
}
```
### 추가할 부분
달팽이 배열의 응용(기존의 달팽이 배열을 (반)시계 방향으로 한 칸씩 이동 시키는 방법 <br>
