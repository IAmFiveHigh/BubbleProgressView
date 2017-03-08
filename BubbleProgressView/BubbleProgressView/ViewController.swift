//
//  ViewController.swift
//  BubbleProgressView
//
//  Created by 我是五高你敢信 on 2017/3/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let cellColor: (CGFloat, CGFloat, CGFloat) = (245, 245, 245)


class ViewController: UIViewController {

    fileprivate let cellId = "cell"
    
    fileprivate var dataArray = [ListModel]()
    
    fileprivate lazy var tableView: UITableView = {
       
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDataArray()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
    }
    
    fileprivate func createDataArray() {
        
        func add( _ controller: BaseViewController, name: String) {
            
            dataArray.append(ListModel(name: name, viewController: controller))
        }
        
        //FIXME: - 待修改数据源
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        add(BaseViewController(), name: "textViewController")
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //FIXME: - 待修改cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(dataArray[indexPath.row].viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.textLabel?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        
        UIView.animate(withDuration: 0.1, animations: {
            
            cell.textLabel?.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
}

struct ListModel {
    
    var name: String
    var viewController: BaseViewController
    
    init(name: String, viewController: BaseViewController) {
        self.name = name;
        self.viewController = viewController
    }
}



