//
//  ViewController.swift
//  DynamicHeightTableHeaderViewDemo
//
//  Created by HeYilei on 1/02/2016.
//  Copyright © 2016 lionhylra. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    // MARK: - IBOutlet properties
    @IBOutlet var tableView:UITableView!
    @IBOutlet var headerView:UIView!
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var descLabel:UILabel!
    @IBOutlet var dateLabel:UILabel!
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self//can be set in the Interface Builder
        self.tableView.dataSource = self//can be set in the Interface Builder
        setupHeader()//load data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /* Adjust the height of the header view */
        let height = headerView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        headerView.frame.size.height = height
        
        tableView.tableHeaderView = headerView//this line ensures that the headerView do not cover the first row of tableView
    }
    
    func setupHeader(){
        titleLabel.text = "Dynamic TableHeaderView Demo"
        //descLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter homines, aliter philosophos loqui putas oportere? Omnes enim iucundum motum, quo sensus hilaretur."
        descLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter homines, aliter philosophos loqui putas oportere? Omnes enim iucundum motum, quo sensus hilaretur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter homines, aliter philosophos loqui putas oportere? Omnes enim iucundum motum, quo sensus hilaretur."
        dateLabel.text = NSDate.init().description
        
        /* These three lines below is compulsory, but they can be set in the Interface Builder */
        descLabel.lineBreakMode = .ByCharWrapping
        descLabel.numberOfLines = 0
        descLabel.sizeToFit()
    }
}
// MARK: - UITableViewDelegate

let cellId = "Cell"
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        cell.textLabel?.text = "\(indexPath.row). Hello Dynamic TableHeaderView Demo"
        return cell
    }
}