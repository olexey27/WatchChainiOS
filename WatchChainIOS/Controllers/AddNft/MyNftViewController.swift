//
//  MyNftViewController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 31.01.23.
//

import UIKit
import CoreData

class MyNftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var sourceName = ""
    var sourceId: UUID?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var tableViewNft: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*navigationController?.navigationBar.topItem?
            .rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:
                                                    UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNft))*/
        tableViewNft.delegate = self
        tableViewNft.dataSource = self
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newData"), object: nil)
    }
    
    @objc func getData() {
        self.nameArray.removeAll(keepingCapacity: true)
        self.idArray.removeAll(keepingCapacity: true)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.addNftPersistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Collection")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey:"name") as? String {
                    self.nameArray.append(name)
                }
                if let id = result.value(forKey: "id") as? UUID {
                    self.idArray.append(id)
                }
                self.tableViewNft.reloadData()
            }
        } catch {
        }
    }
         @IBAction func addNft(_ sender: Any) {
             sourceName = ""
            performSegue(withIdentifier: "toAddNftView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddNftView" {
            let destinationView = segue.destination as! AddNftViewController
            destinationView.targetName = sourceName
            destinationView.targetId = sourceId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        sourceName = nameArray[indexPath.row]
        sourceId = idArray[indexPath.row]
        performSegue(withIdentifier: "toAddNftView", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.addNftPersistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Collection")
        let idString = idArray[indexPath.row].uuidString
        fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let _ = result.value(forKey: "id") as? UUID {
                    context.delete(result)
                    nameArray.remove(at: indexPath.row)
                    idArray.remove(at: indexPath.row)
                    self.tableViewNft.reloadData()
                    do {
                        try context.save()
                    } catch {
                    }
                }
            }
        } catch {
        }
    }
    @IBAction func addButton() {
        performSegue(withIdentifier: "toAddNftView", sender: self)
    }
}
