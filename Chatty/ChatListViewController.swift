//
//  ChatListViewController.swift
//  Chatty
//
//  Created by Arjun on 9/30/17.
//  Copyright © 2017 innovation.llc. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView .dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Jone snow"
        cell.imageView?.image = UIImage (named : "man")
       
      
       
 
        return cell
    }
}
