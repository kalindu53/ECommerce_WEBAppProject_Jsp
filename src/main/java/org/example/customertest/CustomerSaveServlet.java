package org.example.customertest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "CustomerSaveServlet",value = "/customer-save")
public class CustomerSaveServlet extends HttpServlet {

    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("Uname");
        String address = req.getParameter("Uaddress");
        String email = req.getParameter("Uemail");
        String password = req.getParameter("Upassword");


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql = "insert into users (name,address,email,password)values(?,?,?,?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, address);
            pstm.setString(3, email);
            pstm.setString(4,password);
            int efectedRowCount = pstm.executeUpdate();

            if (efectedRowCount > 0) {
                resp.sendRedirect(
                        "customer-save.jsp?message=Customer saved successfully"
                );
            }else {
                resp.sendRedirect(
                        "customer-save.jsp?error=Customer not saved"
                );

            }

        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect(
                    "customer-save.jsp?error=Customer not saved"
            );
        }

    }
}




