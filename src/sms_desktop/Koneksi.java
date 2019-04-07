/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sms_desktop;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author hanafi
 */
public class Koneksi {
    Connection kon=null;
    public void koneksi(){
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            kon=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Hanafi", "root", "");
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {}
    }
    public ResultSet aksesData(String table, String hasil, String kunci, String value){
        ResultSet rs=null;
        try {
            Statement st=(Statement) kon.createStatement();
            rs=st.executeQuery("select "+hasil+" from "+table+" where "+kunci+"='"+value+"' order by Count desc;");
        } catch (SQLException ex) {}
        return rs;
    }
    public void delete(String table, String kolom, String kunci){
        try {
            Statement st=(Statement) kon.createStatement();
            st.execute("delete from "+table+" where "+kolom+"='"+kunci+"';");
        } catch (SQLException ex) {}
    }
    public String getUser(String username, String password){
        String name=null;
        ResultSet rs=null;
        try {
            Statement st=(Statement) kon.createStatement();
            rs=st.executeQuery("select Nama from UserAc where Nama='"+username+"' AND Password='"+password+"';");
            while(rs.next())
            name=rs.getString("Nama");
        } catch (SQLException ex) {}
        return name;
    }
    public ArrayList<String> getUsers(){
        ArrayList<String> name=new ArrayList<String>();
        try {
            Statement st=(Statement) kon.createStatement();
            ResultSet rs=st.executeQuery("select Nama from UserAc;");
            while(rs.next()){
                name.add(rs.getString("Nama"));
            }
        } catch (SQLException ex) {}
        return name;
    }
    public void sending(String asal, String tujuan, String pesan){
        try {
            Statement st=(Statement) kon.createStatement();
            st.execute("INSERT INTO Pesan (Pengirim, Penerima, IsiPesan) VALUES ('"+asal+"', '"+tujuan+"', '"+pesan+"');");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    public int getId(int x, String user){
        try {
            Statement st=(Statement) kon.createStatement();
            ResultSet rs=st.executeQuery("select count(*) as jum from Pesan where Penerima='"+user+"';");
            while(rs.next()){
                int y=rs.getInt("jum");
                if (y!=x){
                    x=y;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return x;
    }
    public int getCountUser(int x){
        try {
            Statement st=(Statement) kon.createStatement();
            ResultSet rs=st.executeQuery("select count(*) as jumlah from UserAc;");
            while(rs.next()){
                int y=rs.getInt("jumlah");
                if (y>x){
                    x=y;
                }
            }    
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return x;
    }
    public void register(String nama, String pass){
        try {
            Statement st=(Statement) kon.createStatement();
            st.execute("INSERT INTO UserAc (Nama, Password) VALUES ('"+nama+"', '"+pass+"');");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Username sudah digunakan", "Peringatan", JOptionPane.WARNING_MESSAGE);
            System.out.println(ex);
        }
    }
}
