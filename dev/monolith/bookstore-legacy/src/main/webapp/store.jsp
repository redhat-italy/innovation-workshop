<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>


<html>
    <head>
        <style>
            * {
              box-sizing: border-box;
            }

            /* Create three equal columns that floats next to each other */
            .column {
              float: left;
              width: 33.33%;
              padding: 10px;
              height: 600px; /*Should be removed. Only for demonstration */
            }

            /* Clear floats after the columns */
            .row:after {
              content: "";
              display: table;
              clear: both;
            }
        </style>
    </head>
<body>
<% int booksColumn = 0;
    boolean rowClosed = false;
%>
<h2><% out.println("Acme Bookstore" );%> - Sale!</h2>
<br>


    <logic:iterate name="books" id="booksList">
    <% if (booksColumn == 0){
        rowClosed=false;%>
        <div class="Row">
    <% }%>
            <div class="Column">
                <p>
                    <h2><bean:write name="booksList" property="title"/></h2>
                    <br>
                    <img src="covers/<bean:write name="booksList" property="cover"/>" height="300"/>
                    <p>
                    <i><bean:write name="booksList" property="description"/></i>
                    </p>
                    By: <bean:write name="booksList" property="author"/>
                    <br>
                    <br>
                    <strong>Sale price: <bean:write name="booksList" property="price"/></strong> <a href="#"> << Buy it!!</a>
                </p>
            </div>
            <%  booksColumn++; %>
    <%  if (booksColumn == 3){
        booksColumn=0;
        rowClosed=true;
        %>
        <div/>
    <% }%>
    </logic:iterate>
    <%  if (!rowClosed){
            booksColumn=0;
            rowClosed=true;
    %>
        <div/>
    <% }%>

</body>
</html>
