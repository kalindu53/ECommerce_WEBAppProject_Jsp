package org.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "CustomerDeleteServlet", value = "/customer-delete")
public class CustomerDeleteServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customer_name = req.getParameter("Uname");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql="DELETE FROM user WHERE name=?";
            PreparedStatement pstm=connection.prepareStatement(sql);
            pstm.setString(1,customer_name);

            int effectRowCount=pstm.executeUpdate();

            if (effectRowCount>0){
                resp.sendRedirect(
                        "customer-delete.jsp?message=Customer delete successfully"
                );
            }else {
                resp.sendRedirect(
                        "customer-delete.jsp?error=Customer not found"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(
                    "customer-delete.jsp?error=Customer delete Unsuccessfully"
            );
        }
    }
}
