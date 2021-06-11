<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/bookstore">
    select * from bookscatalog
</sql:query>

<html>
<body>
<h2><% out.println("Acme Bookstore" ); %></h2>
<br>
<br>
<c:forEach var="row" items="${rs.rows}">
    Title ${row.title}<br/>
    Price ${row.price}<br/>
</c:forEach>
<%
   // Context initContext = new InitialContext();
   // Context envContext  = (Context)initContext.lookup("java:/comp/env");
   // DataSource ds = (DataSource)envContext.lookup("jdbc/bookstore");
   // Connection conn = ds.getConnection();
    
%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<logic:redirect forward="storesalefwd"/>

</body>
</html>
