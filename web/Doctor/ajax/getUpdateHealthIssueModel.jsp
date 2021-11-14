<%@page import="Model.HealthIssue"%>
<%@page import="Controller.CivilianDAO"%>
<%
    CivilianDAO cd = new CivilianDAO();
    HealthIssue h = cd.getHealthIssuesByID(request.getParameter("HealthIssueID"));
    
%>
<div class="model">
                            <form id="updateHealthIssuefrom" onsubmit="updateHealthIssue(document.getElementById('updateHealthIssuefrom'), '<%=h.getHealthID()%>');return false;" method="post">
                                <div class="modelHeader">Add New Health Issue</div>
                                <div class="modelContent">
                                 <div class="field">
                                     <input type="hidden" name="HealthIssueID" value="<%=h.getHealthIssueID()%>"></input>
			<div class="fieldhead">Complain<span style="color:red;">*</span></div>
			<div class="fieldinput">
                            <textarea placeholder="Complain" required name="Complain" value="" ><%=h.getComplaint()%></textarea></div>
			</div>
			<div class="field">
			<div class="fieldhead">Health Issue Duration<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Day" required name="Duration" type="text"  value="<%=h.getDuration()%>"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Disease<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Disease" required  name="Disease" type="text"  value="<%=h.getDiseases()%>"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Origin of Cause<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Origin of Cause" required  name="OriginofCause" type="text"  value="<%=h.getOriginOfCause()%>"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Trouble Table <span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Table" name="TroubleTable" required  type="text"  value="<%=h.getTroubleTable()%>"></input></div>
			</div>
			<div class="field">
			<div class="fieldinput">
				<input  name="Major" <%
                                        if(h.getMajor() == 1){
                                        out.print("checked");
                                        }
                                        
                                        %> type="checkbox" value="1">Hereditary/ Major Disease<span style="color:red;">(Tick If Disease is Hereditary)</span></input></div>
			</div>
                                </div>
                                <div class="modelFooter">
                                    <button type="submit" class="button" onclick="" id="AddFamilyModelAdd"  style="border-radius: 10px;">Update Health Issue</button>
                                    <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px" onclick="close_model('updatehealthissue')">Close</div>
                                </div>
                            </form>
                        </div>