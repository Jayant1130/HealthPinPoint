<%@page import="Controller.CivilianDAO"%>
<%
CivilianDAO   cid= new CivilianDAO ();
String aadhar = request.getParameter("aadhar");
if(cid.isAadharExist(aadhar))
{
out.print("true");
}
else out.print("false");
%>