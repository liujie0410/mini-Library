package Dao;
//完成数据库操作
import Entity.User;
import Util.DBConnect;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDao extends DBConnect{

    public String login(User u){
        try {
            Connection conn = super.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;

            String sql = "SELECT password,name FROM User WHERE user=?";
            ps = conn.prepareStatement(sql);//通过加载驱动获得与sql的连接
            ps.setString(1, u.getUsername());
            rs = ps.executeQuery();//获取结果集
           if (rs.next()) {
                if (u.getPassword().equals(rs.getString("password"))){
                    u.setName(rs.getString("name"));
                    return "true";
                }
                else{
                    return "false";
                }
            }
            else{
                return "false";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}



