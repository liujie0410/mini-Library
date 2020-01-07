package Dao;

import Entity.Book;
import Util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSetMetaData;
import java.util.HashMap;
import java.util.Map;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;


public class BookDao extends DBConnect {
    //读取所有书籍
    public ArrayList<Book> getAllBook(){
        ArrayList<Book> booklist = new ArrayList<>();
        IODao ioDao = new IODao();
        try {
            Connection conn = super.getConnection();
            String sql = "SELECT * FROM Book";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getString("id"));
                book.setName(rs.getString("bookname"));
                book.setAuthor(rs.getString("author"));
                book.setPublisher(rs.getString("publisher"));
                book.setPrice(rs.getInt("price"));
                book.setCategory(rs.getString("category"));
                book.setStore(rs.getInt("store"));
                book.setLend(ioDao.QueryBookNumById(book.getId()));
                book.setRemain(book.getStore() - book.getLend());
                book.setLocation(rs.getString("location"));
                booklist.add(book);
            }
            return booklist;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return booklist;
    }

    //添加书籍到临时表单
    public void addtemp(Book book){
        try {
            int i = 0;
            Connection conn = super.getConnection();
            PreparedStatement pst = null;
            String sql = "insert into tempadd (id, bookname, author, publisher, price, category, store, bookdesc, location)values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, book.getId());
            pst.setString(2, book.getName());
            pst.setString(3, book.getAuthor());
            pst.setString(4, book.getPublisher());
            pst.setInt(5, book.getPrice());
            pst.setString(6, book.getCategory());
            pst.setInt(7, book.getStore());
            pst.setString(8, book.getDesc());
            pst.setString(9, book.getLocation());
            i = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //读取后台数据，将临时表单中的数据转换为json数组
    public JSONArray getadd(){
        List<Map<String,Object>> booklist =new ArrayList<Map<String,Object>>();
        try {
            Connection conn = super.getConnection();
            String sql = "SELECT * FROM tempadd";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            ResultSetMetaData md = rs.getMetaData();
            int columnCount = md.getColumnCount();
            while (rs.next()) {
                Map<String, Object> rowData=new HashMap<String, Object>();
                for (int i = 1; i <= columnCount; i++) {
                    rowData.put(md.getColumnName(i), rs.getObject(i));
                }
                booklist.add(rowData);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONArray jsonData = JSONArray.parseArray(JSON.toJSONString(booklist));
        System.out.println("转换json成功！"+jsonData);
        return jsonData;
    }

//确认添加，将临时表中的数据添加到数据库
    public void confirm(){
        try {
            int i = 0;
            Connection conn = super.getConnection();
            PreparedStatement pst = null;
            String sql = "INSERT INTO Book SELECT * FROM tempadd;";
            pst = conn.prepareStatement(sql);
            i = pst.executeUpdate();
            sql = "truncate table tempadd;";
            pst = conn.prepareStatement(sql);
            i = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//清空整个表单
    public void truncatetable(){
        int i = 0;
        Connection conn = null;
        try {
            conn = super.getConnection();        
            PreparedStatement pst = null;
            String sql = "truncate table tempadd;";
            pst = conn.prepareStatement(sql);
            i = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//通过书号查询某本书的各参数
    public  Book QueryBookById(String s){
        try {
            IODao ioDao = new IODao();
            Connection conn = super.getConnection();
            String sql = "SELECT * FROM Book WHERE id=" + "'" + s + "'";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            Book book = new Book();
            while (rs.next()) {
                book.setId(rs.getString("id"));
                book.setName(rs.getString("bookname"));
                book.setAuthor(rs.getString("author"));
                book.setPublisher(rs.getString("publisher"));
                book.setPrice(rs.getInt("price"));
                book.setCategory(rs.getString("category"));
                book.setStore(rs.getInt("store"));
                book.setLend(ioDao.QueryBookNumById(book.getId()));
                book.setRemain(book.getStore() - book.getLend());
                book.setDesc(rs.getString("bookdesc"));
                book.setLocation(rs.getString("location"));
            }
            return book;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
//通过书名查询某书信息
    public JSONArray QueryBookByName(String s){
        List<Map<String,Object>> querybooklist =new ArrayList<Map<String,Object>>();
        try {
            Connection conn = super.getConnection();
            System.out.println("获取待查询书名"+s);
            String sql =" SELECT * FROM Book  WHERE bookname=" + "'" + s + "'";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            ResultSetMetaData md = rs.getMetaData();
            int columnCount = md.getColumnCount();
            while (rs.next()) {
                Map<String, Object> rowData=new HashMap<String, Object>();
                for (int i = 1; i <= columnCount; i++) {
                    rowData.put(md.getColumnName(i), rs.getObject(i));
                }
                querybooklist.add(rowData);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONArray querylist = JSONArray.parseArray(JSON.toJSONString(querybooklist));
        System.out.println("待查询书籍的信息转换json成功！"+querylist);
        return querylist;
    }

    //在数据库中删除某本书
    public void DeleteById(String s){
        try {
            int i = 0;
            Connection conn = super.getConnection();
            PreparedStatement pst = null;
            String sql = "DELETE FROM Book WHERE  id=" + "'" + s + "'";
            pst = conn.prepareStatement(sql);
            i = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public void EditDone(Book book){
        try {
            int i = 0;
            Connection conn = super.getConnection();
            PreparedStatement pst = null;
            String sql = "UPDATE Book SET bookname=?,author=?,publisher=?,price=?,category=?,store=?,bookdesc=?,location=? WHERE id=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, book.getName());
            pst.setString(2, book.getAuthor());
            pst.setString(3, book.getPublisher());
            pst.setInt(4, book.getPrice());
            pst.setString(5, book.getCategory());
            pst.setInt(6, book.getStore());
            pst.setString(7, book.getDesc());
            pst.setString(8, book.getLocation());
            pst.setString(9, book.getId());
            i = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

