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
            Patient p;
            p = (Patient)session.getAttribute("p");
            p.display(); 
        %>
        <h1>Patient Profile</h1>
        <div class="wrapper">
            <form action="ModifyContentServlet" method="post" name="PatientChangeForm" id="PatientChangeForm">
                <fieldset>
                    <legend><b>Patient Account</b></legend><br>
                    <fieldset>
                        <legend><b>Patient Login</b></legend>
                        <label for="ID">Patient ID:</label>
                            <input type="text" id="ID" name="ID" placeholder="Patient ID" value="<%=p.getPatID()%>" disabled>
                        <label for="password">Current Password:</label>
                            <input type="text" id="password" name="password" placeholder="Password" value="<%=p.getPatPassword()%>" disabled><br>
                        <label for="newPassword">New Password:</label>
                            <input type="password" id="newPassword" name="newPassword" placeholder="New Password" value="">
                        <label for="confirmPassword">Confirm Password:</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" value="">
                    </fieldset>
                    <br>
                    <fieldset>
                        <legend><b>Patient Information</b></legend>
                        <label for="firstName">First Name:</label>
                            <input type="text" id="firstName" name="firstName" placeholder="First Name" value="<%=p.getPatFirstName()%>">
                        <label for="lastName">Last Name:</label>
                            <input type="text" id="lastName" name="lastName" placeholder="Last Name" value="<%=p.getPatLastName()%>"><br>
                        <label for="address">City:</label>
                            <input type="text" id="address" name="address" placeholder="City" value="<%=p.getPatAddress()%>">
                    </fieldset>
                    <br>
                    <fieldset>
                        <legend><b>Patient Contact & Insurance</b></legend>
                        <label for="email">Email:</label>
                            <input type="email" id="email" name="email" placeholder="Email Address" value="<%=p.getPatEmail()%>">
                        <label for="insurance">Insurance:</label>
                            <input type="text" id="insurance" name="insurance" placeholder="Insurance" value="<%=p.getPatInsurance()%>">
                    </fieldset>
                    <br>
                    <hr>
                    <input type="submit" value="Submit Changes">
                    <input type="reset" value="Reset Changes">
                </fieldset>
            </form>
            <h2>Your Upcoming Dentist Appointment</h2>
            <table>
                <%!Dentist pD = new Dentist();%>
                
                <%
                    pD.selectDB(p.getPatAppt().getDentID());
                    pD.display(); 
                    if(p.getPatAppt().getApptDateTime() == ""){
                %> 
                <tr>
                    <th> Date & Time </th>
                    <th> Patient </th>
                    <th> Dentist </th>
                    <th> Procedure </th>
                    <th> Add </th>
		</tr>
                <tr>
                    <td> N/A </td>
                    <td> N/A </td>
                    <td> N/A </td>
                    <td> N/A </td>
                    <td>
                        <form action="ModifyContentServlet" method="post" name="AppointmentAddForm" id="AppointmentAddForm">
                            <input type="submit" name="Action" value="Book Appointment">
                        </form>
                    </td>
                </tr>
                <%} else {%>
                <tr>
                    <th> Date & Time </th>
                    <th> Patient </th>
                    <th> Dentist </th>
                    <th> Procedure </th>
                    <th> Edit </th>
		</tr>
                <tr>
                    <td><%=p.getPatAppt().getApptDateTime()%></td>
                    <td><abbr title="You"><%=p.getPatAppt().getPatID()%></abbr></td>
                    <td><abbr title="<%=pD.returnDisplay()%>"><%=p.getPatAppt().getDentID()%></abbr></td>
                    <td><abbr title="<%=p.getPatAppt().getProcedure().returnDisplay()%>"><%=p.getPatAppt().getProcedure().getProcCode()%></abbr></td>
                    <td>
                        <form action="ModifyContentServlet" method="post" name="AppointmentChangeForm" id="AppointmentChangeForm">
                            <input type="submit" name="Action" value="Change Appointment">
                            <input type="submit" name="Action" value="Delete Appointment">
                        </form>
                    </td>
		</tr>
                <%}%>
            </table>
        </div>
    </body>
</html> 
