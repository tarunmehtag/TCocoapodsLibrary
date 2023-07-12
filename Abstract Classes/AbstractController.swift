import UIKit

open class AbstractController: UIViewController, TableCellDelegate, CollectionCellDelegate {

    //MARK:- IBOutlets
    @IBOutlet weak var tblVw: UITableView!
    @IBOutlet weak var collectionVw: UICollectionView!
    
    //MARK:- Variables
    var arrayTblItems = [Any]() {
        didSet{
            if tblVw != nil{
                tblVw.reloadData()
            }
        }
    }
    
    var arrayCollectionItems = [Any]() {
        didSet{
            if collectionVw != nil{
                collectionVw.reloadData()
            }
        }
    }
    
    var tblCell: AbstractTblCell.Type {
        return AbstractTblCell.self
    }
    
    var collectionCell: AbstractCollectionCell.Type {
        return AbstractCollectionCell.self
    }
    
    var tblReuseId: String {
        return String(describing: tblCell.self)
    }
    
    var tblCellType: String = ""
    
    var collectionReuseId: String {
        return String(describing: collectionCell.self)
    }
    
    var collectionCellSize: CGSize {
        return CGSize.zero
    }
    
    var collectionCellType: String = ""
    
    var navTitle: String {
        return ""
    }
    
    var backBtn: Bool {
        return true
    }
    
    var rightBtns:[String] {
        return []
    }
    
    var tintColor: UIColor {
        return GREEN_COLOR
    }
    
    var multipleCollectionSection: Bool {
        return false
    }
    
    var multipleTableSection: Bool {
        return false
    }
    
    var backgroundImage : Bool {
        return true
    }
    
    //MARK:- View Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        if tblVw != nil {
            tblVw.register(UINib(nibName: tblReuseId, bundle: nil), forCellReuseIdentifier: tblReuseId)
            tblVw.dataSource = self
            tblVw.delegate = self
            tblVw.separatorStyle = .none
            tblVw.showsVerticalScrollIndicator = false
            tblVw.showsHorizontalScrollIndicator = false
            tblVw.tableFooterView = UIView()
        }
        if collectionVw != nil {
            collectionVw.register(UINib(nibName: collectionReuseId, bundle: nil), forCellWithReuseIdentifier: collectionReuseId)
            collectionVw.dataSource = self
            collectionVw.delegate = self
            collectionVw.showsVerticalScrollIndicator = false
            collectionVw.showsHorizontalScrollIndicator = false
        }
        navigationBar()
       // swipeGestures()
//        menu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
        
    //MARK:- Navigation Bar
    func navigationBar() {
        /* Set Navigation Bar Color */
//        navigationController?.navigationBar.barTintColor = MAIN_THEME_COLOR_ORDER
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        /* Set Logo At Navigation Bar */
//        let logo = UIImage(named: "logo")
//        let imageView = UIImageView(image:logo)
//        self.navigationItem.titleView = imageView
        
        let lbNavTitle = UILabel()
        lbNavTitle.backgroundColor = UIColor.clear
        lbNavTitle.textColor = tintColor
        lbNavTitle.font = UIFont(name:AppFontName.bold, size: 17.0)
        lbNavTitle.numberOfLines = 0
        lbNavTitle.center = CGPoint(x: 0, y: 0)
        lbNavTitle.textAlignment = .left
        lbNavTitle.text = navTitle
        let navView = UIView(frame: CGRect(x: 0, y: 0, width: 220, height: 30))
        
        navView.addSubview(lbNavTitle)
//        self.navigationItem.titleView = lbNavTitle

        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: lbNavTitle)
        
        self.navigationController?.navigationBar.tintColor = tintColor
        
        /* Set Left Btn */
//        var leftBtn = UIBarButtonItem()
//        if backBtn {
//            leftBtn = UIBarButtonItem(image: UIImage(named: "back_icon") , style: .plain, target: self, action: #selector(back(_:)))
//        } else {
//            leftBtn = UIBarButtonItem(image: UIImage(named: "mail_icon") , style: .plain, target: self, action: #selector(menuButnAction))
//            }
//        self.navigationItem.leftBarButtonItem = leftBtn
        if backBtn {
            let back = UIBarButtonItem(image: UIImage(named: "back_icon") , style: .plain, target: self, action: #selector(back(_:)))
            self.navigationItem.leftBarButtonItems = [back, UIBarButtonItem.init(customView: lbNavTitle)]
        } else {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem.init(customView: lbNavTitle)]
        }
        
        
        /* Set Right Btn */
        var arrayRightBtn = [UIBarButtonItem]()
        for (index,imageName) in rightBtns.enumerated() {
            let btn = UIBarButtonItem(image: UIImage(named: imageName) , style: .plain, target: self, action: #selector(rightBtnActn(_:)))
            
            let space:CGFloat = CGFloat(index * 15)
            btn.imageInsets = UIEdgeInsets(top: 0.0, left: space, bottom: 0.0, right: 0.0)
            btn.tag = index+100
            arrayRightBtn.append(btn)
        }
        self.navigationItem.rightBarButtonItems = arrayRightBtn
    }

    @objc func menuButnAction() {
//        sideMenuController?.revealMenu()
    }
    
    //MARK:- Swipe
    func swipeGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    //MARK:- Actions
    @objc func dismiss(fromGesture gesture: UISwipeGestureRecognizer) {
        
    }
    
    //MARK:- Left Bar Button Back Action
    @objc func back(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Right Bar Button Action
    @objc func rightBtnActn(_ sender: UIBarButtonItem) {
        if sender.tag == 100 && rightBtns[0] == "notification" {
            self.pushOnly("NotificationsVC")
        }
    }
    
}

//MARK:- Extension for Table View
extension AbstractController:UITableViewDataSource, UITableViewDelegate {
    
    //MARK: DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        if multipleTableSection {
            return arrayTblItems.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if multipleTableSection {
            return (arrayTblItems[section] as! [Any]).count
        }
        return arrayTblItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tblReuseId) as! AbstractTblCell
        cell.delegate = self
        cell.backgroundColor = .clear
        if multipleTableSection {
            cell.updateWith((arrayTblItems[indexPath.section] as! [Any])[indexPath.row], indexPath.row, (arrayTblItems[indexPath.section] as! [Any]).count, tblCellType)
        } else {
            cell.updateWith(arrayTblItems[indexPath.row], indexPath.row, arrayTblItems.count, tblCellType)
        }
        return cell
    }
    
    //MARK: Delegate Methods
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}

//MARK:- Extension for Collection View
extension AbstractController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: DataSource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if multipleCollectionSection {
            return arrayCollectionItems.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if multipleCollectionSection {
            return (arrayCollectionItems[section] as! [Any]).count
        }
        return arrayCollectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionReuseId, for: indexPath) as! AbstractCollectionCell
        cell.delegate = self
        if multipleCollectionSection {
            cell.updateWith((arrayCollectionItems[indexPath.section] as! [Any])[indexPath.item], indexPath.item, (arrayCollectionItems[indexPath.section] as! [Any]).count, collectionCellType)
        } else {
            cell.updateWith(arrayCollectionItems[indexPath.row], indexPath.item, arrayCollectionItems.count, collectionCellType)
        }
        return cell
    }
    
    //MARK: Delegate Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view: UICollectionReusableView = UICollectionReusableView(frame: CGRect(x: 0, y: 0, width: collectionView.frame.size.width, height: 10))
        view.backgroundColor = .red
        return view
    }
}
