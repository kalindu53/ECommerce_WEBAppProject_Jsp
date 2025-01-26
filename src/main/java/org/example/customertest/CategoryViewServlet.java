package org.example.customertest;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryViewServlet", value = "/category-view")
public class CategoryViewServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> categoryList = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT * FROM category";
                try (Statement stm = connection.createStatement();
                     ResultSet rst = stm.executeQuery(sql)) {

                    while (rst.next()) {
                        categoryList.add(new CategoryDTO(
                                rst.getInt("code"),
                                rst.getString("name"),
                                rst.getInt("qty"),
                                rst.getString("imagePath")
                        ));
                    }
                }
            }

            req.setAttribute("categories", categoryList);
            RequestDispatcher rd = req.getRequestDispatcher("category-view.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error loading categories: " + e.getMessage());
            req.getRequestDispatcher("category-view.jsp").forward(req, resp);
        }
    }
}
