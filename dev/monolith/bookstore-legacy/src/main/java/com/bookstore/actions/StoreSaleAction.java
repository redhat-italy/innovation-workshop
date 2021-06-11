package com.bookstore.actions;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.bookstore.model.Book;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StoreSaleAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {
        String success = request.getParameter("success");

        List<Book> booksList = getBooks();
        request.setAttribute("books", booksList);
        return mapping.findForward("success");
    }

    private List<Book> getBooks() throws Exception {
        List<Book> booksList = new ArrayList<Book>();

        DataSource ds = getDataSource();

        Connection conn = ds.getConnection();
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from bookscatalog");
            while (rs.next()) {
                Book book = new Book();
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setCover(rs.getString("cover"));
                book.setPrice(rs.getDouble("price"));
                book.setDescription(rs.getString("description"));
                booksList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, stmt, rs);
        }

        return booksList;
    }

    private void closeAll(Connection conn, Statement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private DataSource getDataSource() throws Exception {
        InitialContext cxt = new InitialContext();
        if (cxt == null) {
            throw new Exception("Uh oh -- no context!");
        }

        DataSource ds = (DataSource) cxt.lookup("java:/comp/env/jdbc/bookstore");

        if (ds == null) {
            throw new Exception("Data source not found!");
        }
        return ds;
    }

}
