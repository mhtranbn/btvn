//
//  StudentListVC.swift
//  DemoTable
//
//  Created by mhtranbn on 11/22/14.
//  Copyright (c) 2014 . All rights reserved.
//
import Foundation
import UIKit
import AVFoundation

class StudentListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var audioPlayer = AVAudioPlayer()
    var students : NSMutableArray!
    var deleteButton: UIBarButtonItem?
    var doneBarButtonItem, backBarButtonItem: UIBarButtonItem!
    private var tableView: UITableView!
    private var toolBar: UIToolbar!
    private var addUpdateStudentVC : AddUpdateStudentVC!

    override func loadView() {
        Audiobackground()
        super.loadView()
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        backBarButtonItem = self.navigationItem.leftBarButtonItem
        doneBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "onDone")
        deleteButton = UIBarButtonItem(title: "Delete", style: UIBarButtonItemStyle.Plain, target: self, action: "onDelete")
        //self.tableView.allowsMultipleSelectionDuringEditing = true
        view.backgroundColor = UIColor.whiteColor()
        tableView = UITableView(frame: CGRect.nullRect, style: UITableViewStyle.Plain)
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        toolBar = UIToolbar()
        toolBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let fixWidthSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        fixWidthSpace.width = 30
        let addButton = UIBarButtonItem(image: UIImage(named: "add")!, target: self, action: "onAdd")
        let saveButton = UIBarButtonItem(image: UIImage(named: "save")!, target: self, action: "onSave")
        let searchButton = UIBarButtonItem(image: UIImage(named: "search")!, target: self, action: "onSearch")
        let sortButton = UIBarButtonItem(image: UIImage(named: "sort")!, target: self, action: "onSort")
        toolBar.items = [spacer, addButton, fixWidthSpace, saveButton,fixWidthSpace ,sortButton, fixWidthSpace, searchButton, spacer]
        view.addSubview(toolBar)
                let views = ["view": view, "tableView": tableView, "toolBar": toolBar]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView][toolBar(40)]-|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[toolBar]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
    }
    
    
    func initData() {
        students = DataManager.singleton.students
        students.addObject(Student(name: "James Rock", score: 8.0))
        students.addObject(Student(name: "Diana Rose", score: 1.0))
        for item in DataManager.singleton.students {
            println( (item as Student).fullName)
        }
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        //tableView.reloadData()
        
       initData()
    }
    
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell: UITableViewCell!
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell {
            cell = dequeCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "#")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        let student = students[indexPath.row] as Student
        cell.textLabel.text = student.fullName
        cell.detailTextLabel?.text = "\(student.score)"
        
        return cell
        
        
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(Bool(), animated: Bool())
        if (editing) {
            self.navigationItem.rightBarButtonItem = doneBarButtonItem
            self.navigationItem.leftBarButtonItem = deleteButton

        }
     
    }
    func onDone() {
        self.tableView.setEditing(false, animated: true)
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
    }
    
    func onDelete() {
        if let selectedRows = self.tableView.indexPathsForSelectedRows() {
            if selectedRows.count > 0 {
                let indicesOfItemsToDelete = NSMutableIndexSet()
                for selectedIndex in selectedRows {
                    indicesOfItemsToDelete.addIndex(selectedIndex.row)
                }
                students.removeObjectsAtIndexes(indicesOfItemsToDelete)
                self.tableView.deleteRowsAtIndexPaths(selectedRows, withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
    
    func onSave() {
        
    }

    
    
    //MARK: UITableViewDelegate
    //MARK: Handle tool bar button actions
    func onAdd() {
        if addUpdateStudentVC == nil {
            addUpdateStudentVC = AddUpdateStudentVC()
        }
        self.navigationController?.pushViewController(addUpdateStudentVC, animated: true)
    }
    
    func onSearch() {
        
    }

    func onSort() {
        var alert = UIAlertController(title: "Sort", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        
        alert.addAction(UIAlertAction(title: "Reset", style: UIAlertActionStyle.Destructive, handler: { action in
            println("")
        }))

        alert.addAction(UIAlertAction(title: "By Name", style: UIAlertActionStyle.Default, handler: { action in
            self.students.sortUsingComparator({ (a:AnyObject!, b:AnyObject!) -> NSComparisonResult in
                
                var c: Student = a as Student
                var d: Student = b as Student
                return c.fullName.compare(d.fullName)
            })
            self.tableView.reloadData()
        }))
        
        
        alert.addAction(UIAlertAction(title: "By Score", style: UIAlertActionStyle.Default, handler: { action in
            self.students.sortUsingComparator({ (a:AnyObject!, b:AnyObject!) -> NSComparisonResult in
                var c: Student = a as Student
                var d: Student = b as Student
                if (c.score > d.score) {
                    return NSComparisonResult.OrderedAscending
                } else if (c.score < d.score) {
                    return NSComparisonResult.OrderedDescending
                }
                return NSComparisonResult.OrderedSame
                
            })
            self.tableView.reloadData()
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func Audiobackground() {
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("FutariNoKimochi", ofType: ".mp3")!)
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
}
