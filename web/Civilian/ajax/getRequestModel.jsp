<%@page import="Model.FamilyMember"%>
<%@page import="Model.Civilian"%>
<%@page import="java.util.List"%>
<%@page import="Controller.CivilianDAO"%>
<div class="model">
                            <div class="modelHeader">Family Entreaty</div>
                            <div class="modelContent">
                                <%
                        CivilianDAO cd = new CivilianDAO();
                        String HealthID = (String) session.getAttribute("UserID");
                        List<FamilyMember> Rfamilymembers = cd.getRFamilyMembersByHealthIDandStatus(HealthID, 0);
                        if(Rfamilymembers.size()==0){
                        out.print("No Request");
                        }
                        for(FamilyMember fm : Rfamilymembers){
                            Civilian c = cd.getCivilianByID(fm.getHealthID());
                            
                                %>
                                <div class="Entreaty">
                                    <div class="EntreatyLogo"><img src="../img/logo.png"></div>
                                    <div class="Entreatyinfo">
                                        <div class="EntreatyName"><%=c.getName()%></div>
                                        <div class="EntreatyRel">Connect as <%=fm.getRelationship()%></div>
                                    </div>
                                    <div class="EntreatyAcceptButton" onclick="updateFamilyMemberStatus('<%=fm.getHealthID()%>','1')">Accept</div>
                                    <div class="EntreatyDeclineButton"  onclick="DeleteFamilyMemberStatus('<%=fm.getHealthID()%>','0')">Delete</div>
                                </div>
                                        <%
                                       } 
                                        %>
                            </div>
                            <div class="modelFooter">
                                <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px" onclick="close_model('EntreatyScreen')"> Close</div>
                            </div>
                        </div>