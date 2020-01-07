package Action;

import Dao.BookDao;
import Entity.Book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.alibaba.fastjson.JSONArray;

public class BookAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action.equals("getall")){
            this.getAll(request, response);
        }
        else if(action.equals("addtemp")) {
            this.addtemp(request, response);
        }
        else if(action.equals("gettemp")) {
            this.gettemp(request, response);
        }
        else if(action.equals("confirm")) {
            this.confirm(request, response);
        }
        else if(action.equals("querybookbyid")){
            this.QueryBookById(request, response);
        }
        else if(action.equals("DeleteById")){
            this.DeleteById(request, response);
        }
        else if(action.equals("EditDone")){
            this.EditDone(request, response);
        }
        else if(action.equals("truncatetable")){
           this.truncatetable(request, response); 
        }
        else if(action.equals("querybookbyname")){
            this.QueryBookByName(request, response);
        }
    }
//读取数据
    private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao bdao = new BookDao();
       ArrayList<Book> bookArrayList = bdao.getAllBook();

        HttpSession session = request.getSession();
        session.setAttribute("allbooklist", bookArrayList);
        request.getRequestDispatcher("/booklist.jsp").forward(request, response);
    }

    //添加到临时表
    private void addtemp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String next = request.getParameter("over");
        BookDao bdao = new BookDao();
        Book book = new Book();
        if(!request.getParameter("bookid").equals(""))
            book.setId(request.getParameter("bookid"));
        if(!request.getParameter("bookname").equals(""))
            book.setName(request.getParameter("bookname"));
        if(!request.getParameter("bookauthor").equals(""))
            book.setAuthor(request.getParameter("bookauthor"));
        if(!request.getParameter("bookpublisher").equals(""))
            book.setPublisher(request.getParameter("bookpublisher"));
        if(!request.getParameter("bookcategory").equals(""))
            book.setCategory(request.getParameter("bookcategory"));
        if(!request.getParameter("bookprice").trim().equals(""))
            book.setPrice(Integer.parseInt(request.getParameter("bookprice")));
        if(!request.getParameter("bookstore").trim().equals(""))
            book.setStore(Integer.parseInt(request.getParameter("bookstore")));
        if(!request.getParameter("booklocation").equals(""))
            book.setLocation(request.getParameter("booklocation"));
        if(!request.getParameter("bookdesc").equals(""))
            book.setDesc(request.getParameter("bookdesc"));
        if(!request.getParameter("bookid").equals(""))
            bdao.addtemp(book);
        if(next.equals("0"))
            request.getRequestDispatcher("/AddBook.jsp").forward(request, response);
        else
            this.gettemp(request,response);
    }
    
//读取后端数据，将临时表中的数据转换为json格式
    private void gettemp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        JSONArray addbooklist=bdao.getadd();//读取列表
        HttpSession session = request.getSession();
        session.setAttribute("addbooklist", addbooklist);
        request.getRequestDispatcher("/addconfirm.jsp").forward(request,response);
    }
//对临时表单中的数据调用getall函数，添加到书单列表
    private void confirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        bdao.confirm();
        this.getAll(request, response);
    }
//查询某本书的细节状态
    private void QueryBookById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        String id = request.getParameter("id");
        String next = request.getParameter("next");
        Book book = bdao.QueryBookById(id);
        HttpSession session = request.getSession();
        session.setAttribute("resultbook", book);
        PrintWriter out = response.getWriter();
        if(next.equals("check"))
            request.getRequestDispatcher("/detail.jsp").forward(request, response);
        else if(next.equals("edit"))
            request.getRequestDispatcher("/edit.jsp").forward(request, response);
        else if(next.equals("borrowcheck")){
            out.write(book.getName() + "||" + book.getAuthor() + "||" + book.getPublisher() + "||" + book.getRemain());
        }
        else if(next.equals("existcheck")){
            out.write(book.getName());
        }
    }

//根据书名关键词查询书籍
    private void QueryBookByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        String name= request.getParameter("name");
        JSONArray querylist=bdao.QueryBookByName(name);//读取列表
        HttpSession session = request.getSession();
        session.setAttribute("querylist", querylist);
        request.getRequestDispatcher("/querybooklist.jsp").forward(request,response);
    }

//根据id删除某本书
    private void DeleteById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        String id = request.getParameter("id");
        bdao.DeleteById(id);
        this.getAll(request, response);
    }
//编辑
    private void EditDone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        Book book = new Book();
        if(!request.getParameter("id").equals(""))
            book.setId(request.getParameter("id"));
        if(!request.getParameter("name").equals(""))
            book.setName(request.getParameter("name"));
        if(!request.getParameter("author").equals(""))
            book.setAuthor(request.getParameter("author"));
        if(!request.getParameter("publisher").equals(""))
            book.setPublisher(request.getParameter("publisher"));
        if(!request.getParameter("category").equals(""))
            book.setCategory(request.getParameter("category"));
        if(!request.getParameter("price").trim().equals(""))
            book.setPrice(Integer.parseInt(request.getParameter("price")));
        if(!request.getParameter("store").trim().equals(""))
            book.setStore(Integer.parseInt(request.getParameter("store")));
        if(!request.getParameter("location").equals(""))
            book.setLocation(request.getParameter("location"));
        if(!request.getParameter("desc").equals(""))
            book.setDesc(request.getParameter("desc"));
        if(!request.getParameter("id").equals(""))
            bdao.addtemp(book);
        bdao.EditDone(book);
        request.getRequestDispatcher("BookAction?action=querybookbyid&id=<%=b.getId()%>&next=check").forward(request, response);
    }
//清空当前整个表
    private void truncatetable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bookDao = new BookDao();
        bookDao.truncatetable();
        this.gettemp(request, response);
    }
}
