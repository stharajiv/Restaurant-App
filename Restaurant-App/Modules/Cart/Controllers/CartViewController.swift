//
//  CartViewController.swift
//  Restaurant-App
//
//  Created by Rajiv Shrestha on 7/25/22.
//

import UIKit

class CartViewController: UIViewController, CustomDeliveryNotesSelectorDelegate {
    func customNotesSelected(notesTitle: String) {
        self.btnDeliveryNotes.setTitle(notesTitle, for: .normal)
        self.btnDeliveryNotes.setTitleColor(UIColor.lightGray, for: .normal)
    }
    

    @IBOutlet weak var cartItemsCollectionView: UICollectionView!{
        didSet{
            cartItemsCollectionView.register(cellType: CartItemCollectionViewCell.self)
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            cartItemsCollectionView.collectionViewLayout = layout
            //            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            cartItemsCollectionView.setCollectionViewLayout(layout, animated: false)
        }
    }
    @IBOutlet weak var itemListHeight: NSLayoutConstraint!
    @IBOutlet weak var emptyCartLayout: UIView!
    @IBOutlet weak var lblProductCost: UILabel!
    @IBOutlet weak var lblPackagingCost: UILabel!
    @IBOutlet weak var lblDeliveryCost: UILabel!
    @IBOutlet weak var lblTotalPayment: UILabel!
    @IBOutlet weak var lblPromoDiscount: UILabel!
    @IBOutlet weak var lblDriverTip: UILabel!
    @IBOutlet weak var lblSavedText: UILabel!
    @IBOutlet weak var itemsLayout: DesignableView!
    @IBOutlet weak var paymentLayout: DesignableView!
    @IBOutlet weak var basketTotalLayout: DesignableView!
    @IBOutlet weak var promoDiscountLayout: DesignableView!
    @IBOutlet weak var deliveryCostLayout: DesignableView!
    @IBOutlet weak var tipforRiderLayout: DesignableView!
    @IBOutlet weak var packagingCostLayout: DesignableView!
    @IBOutlet weak var grandTotalLayout: DesignableView!
    @IBOutlet weak var deliveryNotesLayout: DesignableView!
    @IBOutlet weak var stickyLayout: DesignableView!
    @IBOutlet weak var savingsLayout: DesignableView!{
        didSet{
            savingsLayout.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            savingsLayout.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var addCheckoutLayout: DesignableView!
    @IBOutlet weak var btnDeliveryNotes: UIButton!
    
    var cartData: CartModel?
    var isLoading: Bool?
    let currency = "Nrs."
    var productName = ["Momo", "Pizza", "Samosa", "Gulabjamun", "Donuts", "Chowmein"]
    var productExtras = ["Chicken Momo with chilly", "Extra Cheesee, Olives and Corns", "Extra Sauce", "Extra Large", "Choclate with blue berry", "Egg and vegeterian mix"]
    var productPrice = [120.0, 400.0, 80.0, 100.0, 60.0, 130.0 ]
    var productQuanitty = [1, 1, 2, 3, 1, 1]
    var promodiscount = 100.0
    var packagingCost = 100.0
    var deliveryCost = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let itemsCount = productName.count
            NotificationCenter.default.post(name: Notification.Name("cartCount"), object: self, userInfo:["totalItems": itemsCount])
            let height = self.cartItemsCollectionView.collectionViewLayout.collectionViewContentSize.height
            let cgfloat = CGFloat(height)
            self.itemListHeight.constant = cgfloat
        lblProductCost.text = "\(currency) \(productPrice.reduce(0, +).removeZerosFromEnd())"
        lblPromoDiscount.text = "\(currency) \(promodiscount.removeZerosFromEnd())"
        lblPackagingCost.text = "\(currency) \(packagingCost.removeZerosFromEnd())"
        lblDeliveryCost.text = "\(currency) \(deliveryCost.removeZerosFromEnd())"
        lblTotalPayment.text = "\(currency) \((productPrice.reduce(0, +) - promodiscount  + packagingCost + deliveryCost).removeZerosFromEnd())"
        lblSavedText.text = "You saved \(currency) \(promodiscount.removeZerosFromEnd()) on this order"
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let height = self.cartItemsCollectionView.collectionViewLayout.collectionViewContentSize.height
        let cgfloat = CGFloat(height)
        self.itemListHeight.constant = cgfloat
    }

    @IBAction func didTapButtonNotesClicked(_ sender:Any) {
        let controller = Storyboard.customDeliveryNotes.initWithViewController() as! CustomDeliveryNotesViewController
        controller.delegate = self
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    
}

extension CartViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let data = tipsData?.data?.count else { return 5}
        return productName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeReusableCell(withClass: CartItemCollectionViewCell.self, for: indexPath)
        let data = cartData?.data?[indexPath.row]
        let product_name = productName[indexPath.row]
        let product_extras = productExtras[indexPath.row]
        let product_image =  productName[indexPath.row]
        let price = productPrice[indexPath.row]
        let currency = "Nrs."
        let originalPrice = productPrice[indexPath.row]
        let quantity = productQuanitty[indexPath.row]
        let specialInstructions = ""
        let loadingValue = self.isLoading ?? false
        
        cell.setData(product_name, itemExtras: product_extras, itemImage: product_image, currency: currency, price: price, orgPrice: originalPrice, quantity: quantity, special_instruction: specialInstructions, loading: loadingValue)
        return cell
    }
    
    
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = ((collectionView.bounds.size.width))
        if let cell = cartItemsCollectionView.cellForItem(at: indexPath) as? CartItemCollectionViewCell{
            cell.contentView.frame = cell.bounds;
            cell.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
        let data = cartData?.data?[indexPath.item]
        let productName = productName[indexPath.item]
        let product_extras = productExtras[indexPath.row]
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let labelWidth = ((collectionView.bounds.size.width)-148)
        let labelSize = CGSize(width: labelWidth, height: 5000)
        let productFrame = NSString(string: productName).boundingRect(with: labelSize, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
        let descriptionFrame = NSString(string: product_extras).boundingRect(with: labelSize, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], context: nil)
        if data?.special_instruction == nil {
            if (descriptionFrame.height < 14.7 && productFrame.height < 17.4){
                return CGSize(width: itemWidth, height: 134.0)
            }else{
                return CGSize(width: itemWidth, height: (productFrame.height + descriptionFrame.height + 102.0));
            }
        }else {
            let specialInsFrame = NSString(string: data?.special_instruction ?? "special").boundingRect(with: labelSize, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], context: nil)
            if (specialInsFrame.height < 14.7 && descriptionFrame.height < 14.7 && productFrame.height < 17.4){
                return CGSize(width: itemWidth, height: 156.0)
            }else{
                return CGSize(width: itemWidth, height: (specialInsFrame.height + productFrame.height + descriptionFrame.height + 107.5));
            }
        }
    }
}
