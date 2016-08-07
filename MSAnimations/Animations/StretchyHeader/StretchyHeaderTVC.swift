//
//  StretchyHeaderTVC.swift
//  MSAnimations
//
//  Created by mr.scorpion on 16/8/5.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

import UIKit

class StretchyHeaderTVC: UITableViewController, UIGestureRecognizerDelegate {

    // MARK: - Properties
    let tableHeaderHeight: CGFloat = 300.0
    var headerView: UIView!
    
    let places = [
    Place(place: "Neuschwanstein Castle"),
    Place(place: "Yosemite National Park"),
    Place(place: "Times Square"),
    Place(place: "Tokyo"),
    Place(place: "Hawaii"),
    Place(place: "Eiffel Tower"),
    Place(place: "Rio de Janeiro"),
    Place(place: "Turkey"),
    Place(place: "Golden Gate Bridge"),
    Place(place: "Caribbean Islands")
    ]
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        updateHeaderView()
        
        // 双击退出
        let singleFingerTwo = UITapGestureRecognizer(target: self, action: #selector(StretchyHeaderTVC.dismiss))
        singleFingerTwo.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(singleFingerTwo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StrtchyCell", forIndexPath: indexPath)
        let place = places[indexPath.row]
        cell.textLabel?.text = place.placeTitle
        return cell
    }

    // MARK: - UIScrollViewDelegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    // MARK: - Convenience
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -tableHeaderHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        if tableView.contentOffset.y < -tableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Satus Bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
