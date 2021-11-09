<%@page pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Calendar. Test Job.</title>
</head>
<body>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.ParseException" %>
<!-- header -->
<div>
    <h1>Календарь. Test Job.</h1>
</div>

<div>       <!-- content -->
    <div>    <!-- buttons holder -->
        <p><a href="http://localhost:8888/testServlet_war_exploded/list"> >>> </a></p>
        <p><a href="http://localhost:8888/testServlet_war_exploded/add"> <<< </a></p>
    </div>
</div>
<div>
    <%
        Calendar calendar = Calendar.getInstance();
    %>
    <h1><%
        int tDay = calendar.get(Calendar.DATE);
        int mouth = calendar.get(Calendar.MONTH);
        String textMonth = calendar.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.getDefault());
        int years = calendar.get(Calendar.YEAR);
        out.println(tDay + " " + textMonth + " " + years);
    %></h1>
    <p>
        <%
                Date date;
                date = new SimpleDateFormat("dd/MM/yyyy").parse(tDay + "/" + mouth + "/" + years);
                //calendar.setTime(date);
                int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
                int firstDay = dayOfWeek - 1;
                List<String> list = new LinkedList<>();
                for (int i = 1; i < 36; i++) {
                    if (i <= firstDay - 1) {
                        list.add(" ");
                    } else {
                        list.add(String.valueOf(i - (firstDay - 1)));
                    }
                }
        %>
    </p>
    <table border ='1'>
        <%

            //делать чтобы таблица заполнялась корректно
            int li = 0;
                for (int i = 1; i < 6; i++) {
                    out.write("<tr>");
                    for (int j = 1; j < 8; j++) {
                        out.write("<td>" +
                                list.get(li) +
                                "</td>");
                        li++;
                    }
                    out.write("</tr>");
                }
        %>
    </table>
</div>
</body>
</html>
