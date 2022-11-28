const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const Product = require('../models/product');

adminRouter.post("/admin/add-product", admin, async (req,res) => {
    try {
        const {name, description, quantity, category, price, images } = req.body;
        let product = new Product({
            name, 
            description,
            quantity,
            price,
            category,
            images
        });

        product = await product.save();
        res.json(product);

    } catch (e) {
        res.status(500).json({error: e.message});
    }
}) 

adminRouter.get('/admin/get-products', admin, async (req, res) => {
    try {
        const products = await Product.find({});
        res.json(products);
        
    } catch (e) {
        res.status(500).json({error: e.message});
    }
})

module.exports = adminRouter;