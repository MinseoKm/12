# 테이블 뷰 컨트롤러(Table View Controller)

**테이블 뷰 컨트롤러(Table View Controller)란 데이터를 목록 형태로 보여 주기 위한 가장 좋은 방법입니다. 대표적인 앱으로 알람, 메일, 연락처 등이 있습니다.**
***

```
var items = ["책 구매","철수와 약속","스터디 준비하기"]
var itemsImageFile = ["cart.png","clock.png","pencil.png"]
```
외부 변수인 items의 내용을 각각 "책 구매","철수와 약속","스터디 준비하기"로 지정합니다.
외부 변수인 이미지의 파일은 각각 "cart.png","clock.png","pencil.png"로 지정합니다.

```
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
```
테이블 안에 섹션이 한 개이므로 numberOfSections의 리턴 값을 1로 합니다.
섹션당 열의 개수는 Items의 개수이므로 tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 함수의 리턴 값을 items.count로 합니다.

```
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
``` 
셀의 텍스트 레이블에 앞에서 선언한 items을 대입합니다. 그 내용은 "책 구매","철수와 약속","스터디 준비하기"입니다.
셀의 이미지 뷰에 앞에서 선언한 itemsImageFile("cart.png","clock.png","pencil.png")을 대입합니다.

```
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
```
선택한 셸을 삭제하는 코드
    
```
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
```
이동할 아이템의 위치를 itemToMove에 저장합니다.
이동할 아이템의 이미지를 itemImageToMove에 저장합니다.
이동할 아이템을 삭제합니다. 이때 삭제한 아이템 뒤의 인덱스가 재정렬됩니다.
이동할 아이템의 이미지를 삭제합니다. 이때 삭제한 아이템 이미지 뒤의 아이템 이미지들의 인덱스가 재정렬됩니다.
삭제된 아이템을 아동할 위치로 삽입헙니다. 또한 삽입한 아이템 뒤의 아이템들의 인덱스가 재정렬됩니다.
삭제된 아이템의 이미지를 이동할 위치로 삽입합니다. 또한 삽입한 아이템 이미지 뒤의 아이템 이미지들의 인덱스가 재정렬됩니다.
        
```
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
```
items에 텍스트 필드의 택스트 값을 추가합니다.
itemsImageFile에는 무조건 'clock.png'파일을 추가합니다.
텍스트 필드의 내용을 지웁니다.
루트 뷰 컨트롤러, 즉 테이블 뷰로 돌아갑니다.

```
override func viewWillAppear(_ animated: Bool) {
    tvListView.reloadData()
}
```
tvListView.reloadData 함수를 추가하여 테이블 뷰를 다시 불러옵니다. 다시 말해 추가된 내용을 목록으로 불러들입니다.


```  
    var receiveItem = ""
    lblItem.text = receiveItem
    func receiveItem(_ item: String){
        receiveItem = item
    }
```
Main View에서 받을 텍스트를 위해 변수 receive item를 선언합니다.
뷰가 노출 될 때마다 이 내용을 레이블의 텍스트로 표시합니다.
Main View에서 변수를 받기 위한 함수를 추가합니다.    

