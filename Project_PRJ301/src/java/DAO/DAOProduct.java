/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Category;
import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hi
 */
public class DAOProduct  extends DBContext{
    
    public void editProduct(String id,String name, String description,String price,String memory, String image,String quantity,String category){
        String sql ="UPDATE [dbo].[Products]\n" +
"   SET [product_name] = ?\n" +
"      ,[description] = ?\n" +
"      ,[price] = ?\n" +
"      ,[memory] = ?\n" +
"      ,[image_url] = ?\n" +
"      ,[stock_quantity] = ?\n" +
"      ,[category_id] = ?\n" +
"      \n" +
" WHERE product_id = ?";
        try {
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            int id1 = Integer.parseInt(id);
            int quantity1 = Integer.parseInt(quantity);
            int price1 = Integer.parseInt(price);
            int memory1 = Integer.parseInt(memory);
            int cate1 = Integer.parseInt(category);
            
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, price1);
            ps.setInt(4, memory1);
            ps.setString(5, image);
            ps.setInt(6, quantity1);
            ps.setInt(7, cate1);         
            ps.setInt(8, id1);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void insertProduct(String name, String description,String price,String memory, String image,String quantity,String category,int user_id){
        String sql ="INSERT INTO [dbo].[Products]\n" +
"           ([product_name]\n" +
"           ,[description]\n" +
"           ,[price]\n" +
"           ,[memory]\n" +
"           ,[image_url]\n" +
"           ,[stock_quantity]\n" +
"           ,[category_id]\n" +
"           ,[user_id])\n" +
"     VALUES\n" +
"           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            int quantity1 = Integer.parseInt(quantity);
            int price1 = Integer.parseInt(price);
            int memory1 = Integer.parseInt(memory);
            int cate1 = Integer.parseInt(category);
            
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, price1);
            ps.setInt(4, memory1);
            ps.setString(5, image);
            ps.setInt(6, quantity1);
            ps.setInt(7, cate1);
            ps.setInt(8, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteProductByProductID(String pid){
        String sql = "DELETE FROM Products\n" +
"      WHERE product_id =?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, pid);
            pre.executeUpdate();
        } catch (Exception e) {
        }
    }
    public Product getLast() {
        String sql = "select top 1 * from products\n"
                + "order by product_id desc";
        try {
             Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9));
                
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Product> getProductByCateID(String id){
        List<Product> list = new ArrayList<>();
        String sql = "select* from Products where category_id="+id;
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                // int id=rs.getInt(1);
                String product_name = rs.getString(2);
                // String name=rs.getString("ProductName");
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                int user_id  = rs.getInt(9);
                Product pro=new Product(product_id, product_name, description,  price, memory, image_url, stock_quantity, category_id,user_id);
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> getProductByUserID(int user_id){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where user_id ="+user_id;
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                
                Product pro=new Product(product_id, product_name, description,  price, memory, image_url, stock_quantity, category_id,user_id);
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    
    public List<Product> searchProductByProductName(String txtSearch){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where [product_name] like '%"+txtSearch+"%'";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                // int id=rs.getInt(1);
                String product_name = rs.getString(2);
                // String name=rs.getString("ProductName");
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                int user_id = rs.getInt(9);
                Product pro=new Product(product_id, product_name, description,  price, memory, image_url, stock_quantity, category_id,user_id);
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Product getProductByProductID(int id){
        
        String sql = "select* from Products where product_id="+id;
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                // int id=rs.getInt(1);
                String product_name = rs.getString(2);
                // String name=rs.getString("ProductName");
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                int user_id = rs.getInt(9);
                return new Product(product_id, product_name, description,  price, memory, image_url, stock_quantity, category_id,user_id);
                
            }
        } catch (Exception e) {
        }
        return null;
        
        
    }

    public List<Category> getCategory(String sql){
        List<Category> category = new ArrayList<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int cateID = rs.getInt(1);
                String cateName = rs.getString(2);
                Category cate = new Category(cateID, cateName);
                category.add(cate);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }
    public List<Product> getProduct(String sql){
        List<Product> product = new ArrayList<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                // int id=rs.getInt(1);
                String product_name = rs.getString(2);
                // String name=rs.getString("ProductName");
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                int user_id = rs.getInt(9);
                
                Product pro=new Product(product_id, product_name, description,  price, memory, image_url, stock_quantity, category_id,user_id);
                product.add(pro);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
        public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
//        List<Product> list = dao.getProductByUserID(2);
//        for(Product pro: list){
//           System.out.println(pro);
//        }
        
//       Product pro1  = dao.getProductByProductID("3");
//            System.out.println(pro1);

//        List<Product> list = dao.searchProductByProductName("SamSung");
//        for(Product pro: list){
//          System.out.println(pro);
//        }

        }
}
