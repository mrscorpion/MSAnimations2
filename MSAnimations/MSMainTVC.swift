//
//  MSMainTVC.swift
//  MSAnimations
//
//  Created by mr.scorpion on 16/8/5.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

import UIKit

class MSMainTVC: UITableViewController, PullRefreshViewDelegate {

    // MARK: - Types
    struct Constants {
        struct ColorPalette {
            static let purple = UIColor(red: 0.31, green: 0.20, blue: 0.49, alpha: 1.0)
            static let backgroundColor = UIColor(red: 43/255.0, green: 35/255.0, blue: 77/255.0, alpha: 1.0)
        }
    }
    
    // MARK: - Properties
    var pullRefreshView: PullRefreshView!
    let kPullRefreshViewHeight: CGFloat = UIScreen.mainScreen().bounds.size.height * 0.22
    let items = ["PullToRefreshAnimation"]
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        configureTableView()
        
        // Part of pull-to-refresh animation.
        configureRefreshRect()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MSMainCell", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    // MARK: - Convenience
    func configureNavBar() {
        self.navigationController?.navigationBar.barTintColor = Constants.ColorPalette.purple // 紫色导航栏
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()] // 字体白色
    }
    
    func configureTableView() {
        self.view.backgroundColor = Constants.ColorPalette.backgroundColor // tableview背景色
    }

    func PullRefreshViewDidRefresh(pullRefreshView: PullRefreshView) {
        delay(seconds: 2.5) {
            pullRefreshView.endRefreshing()
        }
    }
    
    func configureRefreshRect() {
        let refreshRect = CGRect(x: 0.0, y: -kPullRefreshViewHeight, width: view.frame.size.width, height: kPullRefreshViewHeight)
        pullRefreshView = PullRefreshView(frame: refreshRect, scrollView: self.tableView)
        pullRefreshView.delegate = self
        view.addSubview(pullRefreshView)
    }
    // MARK: - UIScrollViewDelegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        pullRefreshView.scrollViewDidScroll(scrollView)
    }
    
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pullRefreshView.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
