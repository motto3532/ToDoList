//
//  ViewController.swift
//  ToDoList
//
//  Created by Atto Rari on 2023/06/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor.white
        return cell
    }
    
}

