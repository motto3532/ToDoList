//
//  ViewController.swift
//  ToDoList
//
//  Created by Atto Rari on 2023/06/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var tasks: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "タスクを追加", message: "タスクを入力してください", preferredStyle: .alert)
        
        //追加ボタン
        let addAction = UIAlertAction(title: "追加", style: .default) { (UIAlertAction) in
            //テキストを取り出す
            guard let textField = alertController.textFields?.first else {
                return
            }
            guard let text = textField.text else {
                return
            }
            //タスクを追加
            self.tasks.append(text)
            //tableViewを更新
            self.tableView.reloadData()
        }
        
        //キャンセルボタン
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)
        
        //アラート作成
        alertController.addTextField()
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}

