package com.suresh;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.ui.ModelMap;

@Controller
public class RegisterController
{
    
    static Connection con11;
    static final String admin_username="admin123";
    static final String admin_pass="root123";
    static String user, pass, email, year, prn, city, div;
    static int logged_in=0;
    static int dl;
    @RequestMapping(value = "/register")
    public String viewRegistration()
    {


        return "Registration";
    }

    @RequestMapping(value = "/registerform", method = RequestMethod.POST)
    public String processRegistration(  @RequestParam("a") String x,
                                        @RequestParam("b") String y,
                                        @RequestParam("c") String z,
                                        @RequestParam("d") String p,
                                        @RequestParam("e") String q,
                                        @RequestParam("f") String r,
                                        @RequestParam("g") String s,
                                        @RequestParam("h") String t,
                                        @RequestParam("i") String u,
                                        @RequestParam("j") String v,
                                        @RequestParam("k") String w,
                                        Model object1                 )
    {
        user = x;
        int i=0;
        System.out.println(v);
        try
        {
            i=1;
            //changes in 3...
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");            
            String ss="insert into students values(?,?,?,?,?,?,?,?,?,?,?)";
            //using prepared statement
            PreparedStatement stmt11=con11.prepareStatement(ss);
            i=4;
            //send value of parameters
            stmt11.setString(1, user);
            stmt11.setString(2, y);
            stmt11.setString(3, z);
            stmt11.setString(4, p);
            stmt11.setString(5, q);
            stmt11.setString(6, r);
            stmt11.setString(7, s);
            stmt11.setString(8, t);
            stmt11.setString(9, u);
            stmt11.setString(10, v);
            stmt11.setString(11, w);
            //execute
            stmt11.executeUpdate();
            //upto here
            
            ss = "create table " + user + "(courses varchar(40), FOREIGN KEY (courses) REFERENCES all_courses(course) ON DELETE CASCADE)";
            stmt11 = con11.prepareStatement(ss); 

            stmt11.executeUpdate();
            
//            ss="create table "+user+"_msg (Messages varchar(50), isread integer)";
//            stmt11=con11.prepareStatement(ss);
//            stmt11.executeUpdate();
            
            //closing connection
            try { stmt11.close(); } catch (Exception e) { /* Ignored */ }
            try { con11.close(); } catch (Exception e) { /* Ignored */ }
        }
        catch (SQLIntegrityConstraintViolationException e)
        {
            object1.addAttribute("s", "Username or Email already Registered");
            return "Registration";
        }
        catch (ClassNotFoundException | SQLException k)
        {
            object1.addAttribute("s", k+"Some error in Registration, Try again.");
            return "Registration";
        }
        object1.addAttribute("s", "Some error in Registration, Try again.");
        object1.addAttribute("dl",dl);
        return "Login";
    }

    @RequestMapping(value = "/login")
    public String viewLogin(Model object1)
    {
        object1.addAttribute("dl",dl);
        return "Login";
    }

    @RequestMapping(value = "/loginform", method = RequestMethod.POST)
    public String processLogin(@RequestParam("a") String x, @RequestParam("b") String y, Model object2)
    {
        if(x.equals(admin_username) && y.equals(admin_pass))
        {
            user=admin_username;
            object2.addAttribute("user", user);
            logged_in=2;
            return "admin_home";
        }
        String msg=null;
        int i=0;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            Statement stmt21=con11.createStatement();
            
            //checking if student login
            ResultSet rs21=stmt21.executeQuery("select * from students");
            while (rs21.next())
            {
                if (rs21.getString("username").equals(x) && rs21.getString("password").equals(y))
                {
                   
                    user = x;
                    logged_in = 1;
                    //closing connection
                    try { rs21.close(); } catch (Exception e) { /* Ignored */ }
                    try { stmt21.close(); } catch (Exception e) { /* Ignored */ }
                    object2.addAttribute("user", user);
                    return "Student_home";
                }
            }
            
            //checking if teacher login
            stmt21=con11.createStatement();
            rs21=stmt21.executeQuery("select * from all_faculty");
            while (rs21.next())
            {
                if (rs21.getString("username").equals(x) && rs21.getString("password").equals(y))
                {
                   
                    user = x;
                    logged_in = 3;
                    //closing connection
                    try { rs21.close(); } catch (Exception e) { /* Ignored */ }
                    try { stmt21.close(); } catch (Exception e) { /* Ignored */ }
                    object2.addAttribute("user", user);
                    return "Teacher_home";
                }
            }
        }
        
        catch (ClassNotFoundException | SQLException e)
        {
            
        }
        msg="Incorrect credentials";
        object2.addAttribute("msg", msg);
        object2.addAttribute("dl",dl);
        return "Login";
    }

    @RequestMapping(value = "/goto_enroll")
    public String goto_enroll()
    {
        return "enroll_new";
    }

    @RequestMapping(value = "/done_enroll")
    public String done_enrolling(@RequestParam("crs") String x, Model object)
    {
        String teach = "", uteach = "",s="",msg="";
        object.addAttribute("user", user);
        int i = 0;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            i=1;
            s="select courses from " + user;
            PreparedStatement stmt=con11.prepareStatement(s);
            ResultSet rs;
            try
            {
                rs=stmt.executeQuery();
                i=2;
                //checking if student already enrolled or not
                while(rs.next())
                {
                    i=3;
                    try
                    {
                        if (rs.getString("courses").equals(x))
                        {
                            //closing connection
                            try { rs.close(); } catch (Exception e) { /* Ignored */ }
                            try { stmt.close(); } catch (Exception e) { /* Ignored */ }                      
                            object.addAttribute("msg", "already enrolled");
                            return "/Student_home";
                        }
                    }
                    catch (SQLException e)
                    {
                        msg+=" | "+e;
                    }
                }
            }
            catch(SQLException e11)
            {
                /**/
            }
            i=4;
            s = "select * from all_courses where course='" + x + "'";
            stmt = con11.prepareStatement(s);
            rs = stmt.executeQuery();
            i=5;
            while (rs.next())
            {

                if (rs.getString("course").equals(x))
                {
                    teach = rs.getString("faculty");
                }
            }
            i=6;
            s = "select * from all_faculty where name='" + teach + "'";
            stmt = con11.prepareStatement(s);
            i=7;
            rs = stmt.executeQuery();
            while (rs.next())
            {

                if (rs.getString("name").equals(teach))
                {
                    uteach = rs.getString("username");
                }
            }
            i=8;
            s = "insert into " + user + " values('" + x + "')";
            stmt = con11.prepareStatement(s);
            stmt.executeUpdate();
            i=9;
            s = "insert into " + uteach + " values('" + user + "')";
            stmt = con11.prepareStatement(s);
            stmt.executeUpdate();
            i=10;
            //closing connection
            try { rs.close(); } catch (Exception e) { /* Ignored */ }
            try { stmt.close(); } catch (Exception e) { /* Ignored */ }
            object.addAttribute("msg", "succesfully enrolled");
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            msg =" | caught in catch i=" + i+" | Exception: "+ex;
            object.addAttribute("msg", msg);
            return "Student_home";
        }
        return "Student_home";
    }

    @RequestMapping(value = "/goto_home_student")
    public String goBackStudent(Model object)
    {
        object.addAttribute("user", user);
        return "Student_home";        
    }
    
    @RequestMapping(value = "/goto_home_teacher")
    public String goBackTeacher(Model object)
    {
        object.addAttribute("user", user);
        return "Teacher_home";    
    }
    
    @RequestMapping(value = "/goto_home_admin")
    public String goBackAdmin(Model object)
    {
        object.addAttribute("user", user);
        object.addAttribute("msg", "");
        return "admin_home";    
    }
    

    @RequestMapping(value = "/Login")
    public String Student_Home(Model object1)
    {
        object1.addAttribute("dl",dl);
        return "Login";
    }

    @RequestMapping(value = "/afs")
    public String afs()
    {
        return "All_faculty";
    }
    
    @RequestMapping(value = "/afs_admin")
    public String afs_admin()
    {
        return "all_faculty_for_admin";
    }

    @RequestMapping(value = "/profileS")
    public String goToStudProf(Model object)
    {
        try
        {
//            object.addAttribute("user", user);
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            
            String s="select * from students where username='" + user+"'";
            PreparedStatement stmt=con11.prepareStatement(s);
            ResultSet rs=stmt.executeQuery();
            
            while (rs.next())
            {
                if (rs.getString("username").equals(user))
                {
                    object.addAttribute("user", rs.getString("username"));
                    object.addAttribute("email", rs.getString("email"));
                    object.addAttribute("year", rs.getString("year"));
                    object.addAttribute("prn", rs.getString("prn"));
                    object.addAttribute("city", rs.getString("city"));
                    object.addAttribute("div", rs.getString("divn"));
                    object.addAttribute("f_nm", rs.getString("f_name"));
                    object.addAttribute("l_nm", rs.getString("l_name"));
                    object.addAttribute("dob", rs.getString("dob"));
                    object.addAttribute("phno", rs.getString("phone_number"));
                    //closing connection
                    try { rs.close(); } catch (Exception e) { /* Ignored */ }
                    try { stmt.close(); } catch (Exception e) { /* Ignored */ }
                    return "profile_student";
                }
            }
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            return "Student_home";
        }
        return "error";
    }

    
    @RequestMapping(value = "/profileTeach")
    public String goToTeachProf(Model object)
    {
        try
        {
//            object.addAttribute("user", user);
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            
            String s="select * from all_faculty where username='" + user + "'";
            PreparedStatement stmt=con11.prepareStatement(s);
            ResultSet rs=stmt.executeQuery();
            
            while (rs.next())
            {
                if (rs.getString("username").equals(user))
                {
                    object.addAttribute("user", rs.getString("username"));
                    object.addAttribute("email", rs.getString("email"));
                    object.addAttribute("name", rs.getString("name"));
                    object.addAttribute("course", rs.getString("course"));
                    object.addAttribute("phno", rs.getString("phone_number"));
                    
                    s="select count(*) from " + user ;
                    stmt=con11.prepareStatement(s);
                    rs=stmt.executeQuery();
                    rs.next();
                    object.addAttribute("n11", rs.getInt(1));
                    //closing connection
                    try { rs.close(); } catch (Exception e) { /* Ignored */ }
                    try { stmt.close(); } catch (Exception e) { /* Ignored */ }
                    return "profile_teacher";
                }
            }
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            return "teacher_home";
        }
        return "error";
    }
    
    @RequestMapping(value = "/courses")
    public String ShowCourses()
    {
        return "All_Courses";
    }
    
    @RequestMapping(value = "/goto_yourcrs")
    public String Showyour_Courses(Model object)
    {
        String msg="";
        object.addAttribute("user", user);
        object.addAttribute("msg", msg);
        return "Your_courses_St";
    }
    
    @RequestMapping(value = "/un_enroll")
    public String unenroll_student(@RequestParam("crs") String crs,Model object)
    {
        String msg="",teach="",uteach="";
        int i=0;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            
            String s="select * from students where username='" + user+"'";
            PreparedStatement stmt=con11.prepareStatement(s);
            ResultSet rs=stmt.executeQuery();
            
            i=1;
            //obtaining teacher's username for unenrolling
            s="select * from all_courses where course='"+crs+"'";
            stmt = con11.prepareStatement(s);
            rs = stmt.executeQuery();
            i=2;
           
             while (rs.next())
                {   if (rs.getString("course").equals(crs))
                    {teach = rs.getString("faculty");}  }
            i=3;
            s = "select * from all_faculty where name='" + teach + "'";
            stmt = con11.prepareStatement(s);
            i=4;
            rs = stmt.executeQuery();
            while (rs.next())
                {   if (rs.getString("name").equals(teach))
                    {uteach = rs.getString("username");}    }
            //__________________________________________________________________
            i=5;
            s="delete from "+uteach+" where students='"+user+"'";
            stmt=con11.prepareStatement(s);
            stmt.executeUpdate();
            i=6;
            s="delete from "+user+" where courses='"+crs+"'";
            stmt=con11.prepareStatement(s);
            stmt.executeUpdate();
            i=7;
            msg="Succesfully Un-Enrolled";
            try { rs.close(); } catch (Exception e) { /* Ignored */ }
            try { stmt.close(); } catch (Exception e) { /* Ignored */ }
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            msg="Error while Un-Enrolling from "+crs+", please try again..."+i;
        }
        object.addAttribute("user", user);
        object.addAttribute("msg", msg);
        
        return "Your_courses_St";
    }
    
//    _____________________________________________________________________________
    
    @RequestMapping(value = "/add_new_teacher")
    public String add_teacher_and_course()
    {
        return "add_teacher";
    }
    
    @RequestMapping(value = "/done_add_teacher", method = RequestMethod.POST)
    public String processRegistrationTeacher(   @RequestParam("a") String x,
                                                @RequestParam("b") String y,
                                                @RequestParam("c") String z,
                                                @RequestParam("d") String p,
                                                @RequestParam("e") String q,
                                                @RequestParam("f") String r,
                                                Model object1                 )
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            
            String s="select * from all_faculty";
            PreparedStatement stmt=con11.prepareStatement(s);
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getString(1).equals(x))
                {
                    object1.addAttribute("msg", "Teacher already exists.");
                    return "add_teacher";
                }
            }
            stmt=con11.prepareStatement("insert into all_faculty values(?,?,?,?,?,?)");
            stmt.setString(1, x);
            stmt.setString(2, y);
            stmt.setString(3, z);
            stmt.setString(4, p);
            stmt.setString(5, q);
            stmt.setString(6, r);
            stmt.executeUpdate();
            
            s="create table "+x+"(students varchar(30), FOREIGN KEY (students) REFERENCES students(username) ON DELETE CASCADE)";
            stmt=con11.prepareStatement(s);
            stmt.executeUpdate();
            
            s="insert into all_courses values('"+r+"','"+y+"')";
            stmt=con11.prepareStatement(s);
            stmt.executeUpdate();
            object1.addAttribute("msg", "Succesfully added.");
            try { stmt.close(); } catch (Exception e) { /* Ignored */ }
            try { rs.close(); } catch (Exception e) { /* Ignored */ }
            return "admin_home";
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            object1.addAttribute("msg", "Error while adding"+ex);
            return "add_teacher";
        }
    }
    
    
    @RequestMapping(value = "/remove_student")
    public String remove_student()
    {
        return "Remove_Student";
    }
    
    @RequestMapping(value = "/remove_stud")
    public String remove_student(@RequestParam("stud") String stud,Model object)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            
            String s="delete from students where username='"+stud+"'";
            PreparedStatement stmt=con11.prepareStatement(s);
            stmt.executeUpdate();
            s="drop table "+stud;
            stmt=con11.prepareStatement(s);
            stmt.executeUpdate();
            object.addAttribute("msg", "Succesfully Removed "+stud);
            //closing connection   
            try { stmt.close(); } catch (Exception e) { /* Ignored */ }
            return "Remove_Student";
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            object.addAttribute("msg", "Error while removing "+stud);
        }
        return "Remove_Student";
    }
    
    @RequestMapping(value = "/show_students")
    public String show_student()
    {
        return "Show_students";
    }
    
    //________________________________________________________________________
     @RequestMapping(value = "/view_stud_byTeacher")
    public String view_stud_by_teacher()
    {
        return "All_students_forTeacher";
    }
    
    @RequestMapping(value = "/view_your_students")
    public String show_enrolledStudent(Model object33)
    {
        object33.addAttribute("user", user);
        return "Your_students_forTeacher";
    }
    
    @RequestMapping(value = "/removeByTeacher")
    public String teacher_removes_student_from_his_course(Model object23)
    {
        object23.addAttribute("user", user);
        return "UnEnroll_byTeacher";
    }
    
    @RequestMapping(value = "/done_remove_by_teach")
    public String remove_student_by_Teacher(@RequestParam("stud") String stud,Model object23)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            
            String s="delete from "+user+" where students='"+stud+"'";
            PreparedStatement stmt=con11.prepareStatement(s);
            stmt.executeUpdate();
            s=" select course from all_faculty where username='"+user+"';";
            stmt=con11.prepareStatement(s);
            ResultSet rs24=stmt.executeQuery();
            rs24.next();
            String crs=rs24.getString(1);
            s="delete from "+stud+" where courses='"+crs+"'";
            stmt=con11.prepareStatement(s);
            stmt.executeUpdate();
            
            
            object23.addAttribute("user", user);
            object23.addAttribute("msg", "Succesfully Removed "+stud);
            //closing connection   
            try { stmt.close(); } catch (Exception e) { /* Ignored */ }
            try { rs24.close(); } catch (Exception e) { /* Ignored */ }
            return "UnEnroll_byTeacher";
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            object23.addAttribute("user", user);
            object23.addAttribute("msg", "Error while removing "+stud);
        }
        return "UnEnroll_byTeacher";
    }
    
    @RequestMapping(value="/add_new_student_byTeach")
    public String teacher_adds(Model object24)
    {
        object24.addAttribute("msg", null);
        return "add_to_crs_by_teach";
    }
    
    @RequestMapping(value = "/done_add_new_student_byTeach")
    public String done_add_newS_byTeach(@RequestParam("stud") String stud,Model object25)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            
            String s="select count(*) from "+user+" where students='"+stud+"'";
            PreparedStatement stmt=con11.prepareStatement(s);
            ResultSet rs24=stmt.executeQuery();
            rs24.next();
            String present=rs24.getString(1);
            if(present.equals("1"))
            {
                object25.addAttribute("msg", "Student already enrolled.");
                return "add_to_crs_by_teach";
            }
            else
            {
                s="insert into "+user+" values('"+stud+"')";
                stmt=con11.prepareStatement(s);
                stmt.executeUpdate();
                
                s="select course from all_faculty where username='"+user+"'";
                stmt=con11.prepareStatement(s);
                rs24=stmt.executeQuery();
                rs24.next();
                String crs=rs24.getString(1);
                
                
                s="insert into "+stud+" values('"+crs+"')";
                stmt=con11.prepareStatement(s);
                stmt.executeUpdate();
                
                try{    rs24.close();   } catch(SQLException e){   /*ignored*/}
                try{    stmt.close();   } catch(SQLException e){   /*ignored*/}
                
                object25.addAttribute("msg", "Succesfully added.");
                return "add_to_crs_by_teach";
            }
            
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            object25.addAttribute("msg", "Error adding Student, Try again."+ex);
            return "add_to_crs_by_teach";
        }
    }
    @RequestMapping(value="/dark_or_light")
    public String darkmode(Model o11)
    {
        if(dl==0)
            dl=1;
        else
            dl=0;
        o11.addAttribute("msg",null);
        o11.addAttribute("dl",dl);
        return "Student_home";
    }
    
    @RequestMapping(value = "/send_msg")
    public String msg_send(@RequestParam("msg") String msg11,Model object1)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con11=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");
            String course;
            PreparedStatement stmt;
            stmt=con11.prepareStatement("select course from all_faculty where username='"+user+"'");
            ResultSet rs24=stmt.executeQuery();
            rs24.next();
            course=rs24.getString(1);
            
            
            String s="select * from "+user;
            String s2="";
            stmt=con11.prepareStatement(s);
            rs24=stmt.executeQuery();
            while(rs24.next())
            {
                s2="insert into "+rs24.getString(1)+"_msg values('"+course+": "+msg11+"', 0)";
                stmt=con11.prepareStatement(s2);
                stmt.executeUpdate();
            }
                try { stmt.close(); } catch (Exception e) { /* Ignored */ }
                 try { rs24.close(); } catch (Exception e) { /* Ignored */ }
            object1.addAttribute("msg","Message sent to your students.");
            return "Teacher_home";
            
        }
        catch(ClassNotFoundException | SQLException e)
        {
            object1.addAttribute("msg",e.getMessage());
            return "Teacher_home";
        }
        
    }
    
   
}
