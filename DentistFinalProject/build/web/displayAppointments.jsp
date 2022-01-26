<%-- 
    Jacob Shaw
    Final Project - Dentist Office Appointment Web Application
    December 2, 2021
    I promise that I wrote this code...
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="keywords" content="dentist, office">
	<title>Dentist Office Appointments</title>
	<meta name="author" content="Jacob Shaw">
	<meta name="description" content="Dentist Office Appointment Scheduler">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style.css" type="text/css" media="screen">
    </head>
    <body>
        <%
            Dentist d;
            d = (Dentist)session.getAttribute("d");
            d.display(); 
        %>
        <h1>Dentist Profile</h1>
        <div class="wrapper">
            <form action="ModifyContentServlet" method="post" name="DentistChangeForm" id="DentistChangeForm">
                <fieldset>
                    <legend><b>Dentist Account</b></legend><br>
                    <fieldset>
                        <legend><b>Dentist Login</b></legend>
                        <label for="ID">Dentist ID:</label>
                            <input type="text" id="ID" name="ID" placeholder="Dentist ID" value="<%=d.getDentID()%>" disabled>
                        <label for="password">Current Password:</label>
                            <input type="text" id="password" name="password" placeholder="Password" value="<%=d.getDentPassword()%>" disabled><br>
                        <label for="newPassword">New Password:</label>
                            <input type="password" id="newPassword" name="newPassword" placeholder="New Password" value="">
                        <label for="confirmPassword">Confirm Password:</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" value="">
                    </fieldset>
                    <br>
                    <fieldset>
                        <legend><b>Dentist Information</b></legend>
                        <label for="firstName">First Name:</label>
                            <input type="text" id="firstName" name="firstName" placeholder="First Name" value="<%=d.getDentFirstName()%>">
                        <label for="lastName">Last Name:</label>
                            <input type="text" id="lastName" name="lastName" placeholder="Last Name" value="<%=d.getDentLastName()%>">
                    </fieldset>
                    <br>
                    <fieldset>
                        <legend><b>Dentist Contact & Office</b></legend>
                        <label for="email">Email:</label>
                            <input type="email" id="email" name="email" placeholder="Email Address" value="<%=d.getDentEmail()%>">
                        <label for="office">Office:</label>
                            <input type="text" id="office" name="office" placeholder="Office" value="<%=d.getDentOffice()%>">
                    </fieldset>
                    <br>
                    <hr>
                    <input type="submit" value="Submit Changes">
                    <input type="reset" value="Reset Changes">
                </fieldset>
            </form>
            <h2>Your Upcoming Patient Appointments</h2>
            <table>
                <%!Patient dP = new Patient();%>
                <tr>
                    <th> Date & Time </th>
                    <th> Patient </th>
                    <th> Dentist </th>
                    <th> Procedure </th>
		</tr>
                <%!Appointment appt = new Appointment();%>
                <% 
                    for(int i = 0; i < d.getDentAppts().getAppts().size(); i++) {
                        appt = d.getDentAppts().getAppts().get(i);
                        dP.selectDB(appt.getPatID());
                %>
                <tr>
                    <td><%=appt.getApptDateTime()%></td>
                    <td><abbr title="<%=dP.returnDisplay()%>"><%=appt.getPatID()%></abbr></td>
                    <td><abbr title="You"><%=appt.getDentID()%></abbr></td>
                    <td><abbr title="<%=appt.getProcedure().returnDisplay()%>"><%=appt.getProcedure().getProcCode()%></abbr></td>
		</tr>
                <%  }  %>
            </table>
	</div>
    </body>
</html> 
