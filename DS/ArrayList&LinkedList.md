# Array List
일반 배열은 생성 시에 배열의 크기를 정해줘야하지만, Array list는 데이터의 삽입에 따라서 **크기가 유동적**으로 결정된다. 기본적인 동작은 배열과 같다.

인덱스 값을 통한 참조가 가능하며, 삭제를 위해서는 모든 데이터의 재배치가 필요하다.

### 시간복잡도
삽입, 삭제에 대한 시간복잡도는 O(n)이며, 검색에 대한 시간 복잡도는 O(1)이다.

<br><hr><br>

# Linked List
연결리스트. 노드로 이루어져 있으며, 배열에 비해서 유동적인 자료구조이다.

노드는 실제 데이터 값과, 다음 노드에 대한 주소값을 가진다.

정방향 혹은 역방향으로 **순차적 접근**을 하기 때문에 검색 속도가 느리다.

삽입 또는 삭제 시, 노드가 참고하는 주소값만 변경하면 되기 때문에 속도가 빠르다.

```c
struct node{
  int data;
  struct node* next;
}
```

### 시간복잡도
삽입, 삭제에 대한 시간복잡도는 O(1)이며, 검색에 대한 시간 복잡도는 O(n)이다.

