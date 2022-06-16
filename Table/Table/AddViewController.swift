//
//  AddViewController.swift
//  Table
//
//  Created by HwangSeungyeon on 2020/08/28.
//  Copyright © 2020 HwangSeungyeon. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 40
    var imageArray = [UIImage?]()
    var imageFileName = [ "cart.png", "clock.png", "pencil.png" ]
    var fileName = ""
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image!)
        }
        imageView.image = imageArray[0]
        fileName = imageFileName[0]
    }
    
    // 새 목록 추가하기
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!) // item에 텍스트 필드의 텍스트 값을 추가한다.
        itemsImageFile.append(fileName) //itemsImageFile에는 무조건 'clock.png'파일 추가
        tfAddItem.text="" // 텍스트 필드의 내용 지운다
        _ = navigationController?.popViewController(animated: true) // 루트 뷰 컨트롤러 , 테이블 뷰로 돌아간다
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // returns height of row for each component.
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = imageArray[row]
        fileName = imageFileName[row]
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
