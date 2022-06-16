import UIKit

// 앱 시작 시 기본적으로 나타낼 목록
var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {
    
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    //뷰가 노출 될 때마다 리스트의 데이털를 다시 불러옴
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() // 추가된 내용을 목록으로 불러오는 것
    }
    
    // MARK: - Table view data source
    // 테이블 안의 섹션 개수를 1로 설정함
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1 // 보통 테이블 안의 섹션이 한개이므로 numberOfSection의 리턴 값을 1로 한다.
    }
    
    // 섹션당 열의 개수를 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return items.count // 섹션당 열의 개수는 Item의 개수 이므로
    }
    
    // item와 itemsImageFile의 값을 셀에 삽입함
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row] //셀의 텍스트에 item 대입
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row]) //셀의 이미지 뷰에 앞에서 선언한 imagefile 대입
        
        return cell
    }
    
    
  
    // 목록 삭제 함수
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
       
            // item와 itemsImageFile에서 해당 리스트를 삭제함
            items.remove(at:  (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
    
    //삭제 시 "Delete" 대신 "삭제"로 표시
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    
    // 테이블 목록 이동 가능(목록 순서 바꾸기 )
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row] // 이동할 아이템의 위치
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row] // 이동할 아이템의 이미지
        items.remove(at: (fromIndexPath as NSIndexPath).row) // 이동할 아이템 삭제 -> 뒤의 아이템 인덱스 재정렬
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row) // 이동할 아이템 이미지 삭제 -> 아이템 이미지 인덱스 재정렬
        items.insert(itemToMove, at: (to as NSIndexPath).row) // 삭제된 아이템을 이동할 위치로 삽입
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row) // 삭제된 아이템의 이미지를 이동한 위치로 삽입
    }
    
    

   
    
    
    
    // 세그웨이를 이용하여 뷰를 이동하는 함수 입니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TableViewCell의 indexPath 구하는 부분 추가 됨
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }
    
    
}
