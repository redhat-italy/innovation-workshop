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
              width: 31.33%;
              padding: 15px;
              margin: 5px;
              height: 600px; /*Should be removed. Only for demonstration */
            }

            /* Clear floats after the columns */
            .row:after {
              content: "";
              display: table;
              clear: both;
            }
        </style>
        <title><% out.println("Acme Bookstore" );%> - Sale!</title>
    </head>
<body style="margin:0; padding:0">
<% int booksColumn = 0;
    boolean rowClosed = false;
%>
<div style="border-style: solid; border-width: thin;  background-color: black; width: 100%;">
    <center><h1 style="color:white"><% out.println("Acme Bookstore" );%> - Sale!</h1></center>
</div>
<br>


    <logic:iterate name="books" id="booksList">
    <% if (booksColumn == 0){
        rowClosed=false;%>
        <div class="Row">
    <% }%>
            <div class="Column" style="border-style: solid; border-width: thin;">
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
