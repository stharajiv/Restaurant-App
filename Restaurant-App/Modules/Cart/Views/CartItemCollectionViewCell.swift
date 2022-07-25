//
//  CartItemCollectionViewCell.swift
//  Restaurant-App
//
//  Created by Rajiv Shrestha on 7/25/22.
//

import UIKit

class CartItemCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var addProductBtn: UIButton!
    @IBOutlet weak var removeProductBtn: UIButton!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var productExtras: UILabel!
    @IBOutlet weak var specialInstructions: UILabel!
    @IBOutlet weak var quantityView: DesignableView!
    @IBOutlet weak var shimmerView: ShimmerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        removeProductBtn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        removeProductBtn.layer.masksToBounds = true
        addProductBtn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        addProductBtn.layer.masksToBounds = true
    }
    
    func setData(_ itemName:String, itemExtras: String, itemImage:String, currency: String, price:Double, orgPrice: Double, quantity: Int, special_instruction: String, loading:Bool){
        productName.text = itemName
        productExtras.text = itemExtras
        productPrice.text = "\(price.removeZerosFromEnd())"
        productQuantity.text = "\(quantity)"
        specialInstructions.text = special_instruction
        productImage.image = UIImage(named: itemImage)
        if price == orgPrice {
            originalPrice.isHidden = true
        }else {
            originalPrice.isHidden = false
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(currency)\(orgPrice.removeZerosFromEnd())")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            self.originalPrice.attributedText = attributeString
        }
        
        if quantity == 0 {
            removeProductBtn.setImage(UIImage.init(named: "minus-small"), for: .normal)
        }else if quantity == 1 {
            removeProductBtn.setImage(UIImage.init(named: "trash-small"), for: .normal)
        }else {
            removeProductBtn.setImage(UIImage.init(named: "minus-small"), for: .normal)
        }
        
        if loading == true{
            shimmerView.isHidden = false
            shimmerView.startAnimating()
        }else {
            shimmerView.isHidden = true
        }
        
        self.layoutIfNeeded()
        awakeFromNib()
    }
}
