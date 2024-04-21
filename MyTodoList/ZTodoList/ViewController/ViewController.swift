//
//  ViewController.swift
//  ZTodoList
//
//  Created by Zeynep Özcan on 18/04/24.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tblViewTodoList: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var arrItems = [TODOListItem]()
    var filteredData: [String] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
        configureTableView()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var data: [String] = []
        for item in arrItems {
            data.append(item.name ?? "")
        }
        if searchText.isEmpty == false {
            filteredData = data.filter({ $0.contains(searchText) })
        }

        tblViewTodoList.reloadData()

    }
    
    func setupUI() {
        title = "My List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(btnAddTapped))
    }
    
    

    @objc func btnAddTapped() {
        let alert = UIAlertController(title: "New Item", message: "Enter Item Name", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let newItem = field.text, !newItem.isEmpty else {
                self?.showAlert(title: "Empty to do", message: "Type something to add an item.")
                return
            }
            self?.createItem(name: newItem)
        }))
        
        self.present(alert, animated: true)
    }
    
    func configureTableView() {
        tblViewTodoList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblViewTodoList.delegate = self
        tblViewTodoList.dataSource = self
        self.getAllItems()
    }

    func getAllItems() {
        do {
            arrItems = try context.fetch(TODOListItem.fetchRequest())
            tblViewTodoList.reloadData()
        } catch let err {
            print("Error Fetching Items: \(err)")
        }
    }
    
    func createItem(name: String) {
        let newItem = TODOListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            self.getAllItems()
        } catch let err {
            print("Error Creating Item: \(err)")
        }

    }
    
    func deleteItem(item: TODOListItem) {
        context.delete(item)
        do {
            try context.save()
            self.getAllItems()
        } catch let err {
            print("Error Creating Item: \(err)")
        }
    }
    
    func updateItem(item: TODOListItem, newName: String) {
        item.name = newName
        do {
            try context.save()
            self.getAllItems()
        } catch let err {
            print("Error Creating Item: \(err)")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let itemData = arrItems[indexPath.row]
        cell.textLabel?.text = itemData.name ?? ""
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = arrItems[indexPath.row]
        let actionSheet = UIAlertController(title: "Options", message: "Select an option", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            let alert = UIAlertController(title: "Edit Item", message: "Enter Item Name", preferredStyle: .alert)
            alert.addTextField()
            alert.textFields?.first?.text = selectedItem.name ?? ""
            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newItem = field.text, !newItem.isEmpty else {
                    self?.showAlert(title: "Empty Name", message: "Item Name cannot be empty")
                    return
                }
                self?.updateItem(item: selectedItem, newName: newItem)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(alert, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteItem(item: selectedItem)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(actionSheet, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
