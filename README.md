import UIKit



// 앱 시작 시 기본적으로 나타낼 목록

var items = ["책 구매","철수와 약속","스터디 준비하기"]

var itemsImageFile = ["cart.png","clock.png","pencil.png"]



class TableViewController: UITableViewController {



    @IBOutlet var tvListView: UITableView!

    

    override func viewDidLoad() {

        super.viewDidLoad()



        // Uncomment the following line to preserve selection between presentations

        // self.clearsSelectionOnViewWillAppear = false



        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.

         self.navigationItem.leftBarButtonItem = self.editButtonItem

    }

    

    // 뷰가 노출될 때마다 리스트의 데이터를 다시 불러옴

    override func viewWillAppear(_ animated: Bool) {

        tvListView.reloadData()

    }

    

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.

    }



    // MARK: - Table view data source

    // 테이블 안의 섹션 개수를 1로 설정함

    override func numberOfSections(in tableView: UITableView) -> Int {

        // #warning Incomplete implementation, return the number of sections

        return 1

    }



    // 섹션당 열의 개수를 전달

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // #warning Incomplete implementation, return the number of rows

        return items.count

    }



    // items와 itemsImageFile의 값을 셀에 삽입함

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)



        // Configure the cell...

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]

        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        

        return cell

    }

    



    /*

    // Override to support conditional editing of the table view.

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        // Return false if you do not want the specified item to be editable.

        return true

    }

    */



    

    // Override to support editing the table view.

    // 목록 삭제 함수

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            // Delete the row from the data source

            // items와 itemsImageFile에서 해당 리스트를 삭제함

            items.remove(at: (indexPath as NSIndexPath).row)

            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)

            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {

            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view

        }    

    }

    

    // 삭제 시 "Delete" 대신 "삭제"로 표시

    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {

        return "삭제"

    }

    

    

    // Override to support rearranging the table view.

    // 목록 순서 바꾸기

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        

        let itemToMove = items[(fromIndexPath as NSIndexPath).row]

        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]

        items.remove(at: (fromIndexPath as NSIndexPath).row)

        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)

        items.insert(itemToMove, at: (to as NSIndexPath).row)

        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)

    }

    



    /*

    // Override to support conditional rearranging of the table view.

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {

        // Return false if you do not want the item to be re-orderable.

        return true

    }

    */



    

    // MARK: - Navigation



    // 세그웨이를 이용하여 디테일 뷰로 전환하기

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Get the new view controller using segue.destinationViewController.

        // Pass the selected object to the new view controller.

        if segue.identifier == "sgDetail" {

            let cell = sender as! UITableViewCell

            let indexPath = self.tvListView.indexPath(for: cell)

            let detailView = segue.destination as! DetailViewController

            detailView.receiveItem(items[((indexPath as NSIndexPath?)?.row)!])

        }

    }

    



}



//

//  AddViewController.swift

//  Table

//

//  Created by stayfoolish on 19/10/2018.

//  Copyright © 2018 stayfoolish. All rights reserved.

//



import UIKit



class AddViewController: UIViewController {



    @IBOutlet var tfAddItem: UITextField!

    override func viewDidLoad() {

        super.viewDidLoad()



        // Do any additional setup after loading the view.

    }



    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.

    }

    



    /*

    // MARK: - Navigation



    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Get the new view controller using segue.destinationViewController.

        // Pass the selected object to the new view controller.

    }

    */

    // 새 목록 추가하기

    @IBAction func btnAddItem(_ sender: UIButton) {

        items.append(tfAddItem.text!)

        itemsImageFile.append("clock.png")

        tfAddItem.text=""

        _ = navigationController?.popViewController(animated: true)

    }

    

}



//

//  DetailViewController.swift

//  Table

//

//  Created by stayfoolish on 19/10/2018.

//  Copyright © 2018 stayfoolish. All rights reserved.

//



import UIKit



class DetailViewController: UIViewController {

    

    var receiveItem = ""



    @IBOutlet var lblItem: UILabel!

    

    override func viewDidLoad() {

        super.viewDidLoad()



        // Do any additional setup after loading the view.

        lblItem.text = receiveItem

    }



    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.

    }

    

    // Main View에서 변수를 받아오기 위한 함수

    func receiveItem(_ item: String){

        receiveItem = item

    }

    



    /*

    // MARK: - Navigation



    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Get the new view controller using segue.destinationViewController.

        // Pass the selected object to the new view controller.

    }

    */

처음에 세 개의 목록이 나타나고 [+] 버튼을 클릭하면 'Add View' 화면으로 이동됩니다. 여기에 새로운 내용을 입력히면 목록에 새로운 아이템이 추가됩니다. 또힌 아이템을 왼쪽으로 밀면 [삭제] 버튼이 나타나 삭제할 수도 있습니다.
테이블 뷰 컨트롤러(Table View Controller)란 데이터를 목록 형태로 보여 주기 위한 가장 좋은 방법입니다. 대표적인 앱으로 알람, 메일, 연락처 등이 있습니다.
[Edit] 버튼을 클릭하면 왼쪽에 붉은 원이 나타납니다. 그 붉은 원 모양의 버튼을 클릭하면 [삭제] 버튼이 나타나고 이를 클릭하면 삭제됩니다.
[Edit] 버튼을 클릭하면 오른쪽에 있던 버튼이 '순서 바꾸기' 버튼으로 나타납니다. 옮기고 싶은 목록을 끌어다 놓고 [Done] 버튼을 클릭해 저장하면 목록의 순서를 바꿀 수 있습니다.
화면 오른쪽에 있는 [+] 버튼을 클릭하면 'Add View' 화면으로 이동하고, 텍스트 필드에내용을 입력한 후 [Add] 버튼을 클릭하면 'Main View'로 돌아옵니다. 새 목록이 추가된 것을 확인할 수 있습니다.
목록의 아이템을 선택하면 'Detail View'로 이동하고 그 내용을 보여줍니다.
