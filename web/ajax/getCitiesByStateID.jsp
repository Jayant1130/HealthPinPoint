<%@page import="Model.City"%>
<%@page import="Controller.CommonDAO"%>
<%
CommonDAO   cd= new CommonDAO ();
int StateID = Integer.parseInt(request.getParameter("StateID"));
out.print("<option value=''>Select City</option>");
for(City c : cd.getAllCitiesByStateID(StateID))
{
out.print("<option value='"+c.getCityID()+"'>"+c.getCityName()+"</option>");
}
%>